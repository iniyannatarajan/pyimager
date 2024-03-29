//#  -*- mode: c++ -*-
//#  SubArray.cc: implementation of the SubArray class
//#
//#  Copyright (C) 2002-2004
//#  ASTRON (Netherlands Foundation for Research in Astronomy)
//#  P.O.Box 2, 7990 AA Dwingeloo, The Netherlands, seg@astron.nl
//#
//#  This program is free software; you can redistribute it and/or modify
//#  it under the terms of the GNU General Public License as published by
//#  the Free Software Foundation; either version 2 of the License, or
//#  (at your option) any later version.
//#
//#  This program is distributed in the hope that it will be useful,
//#  but WITHOUT ANY WARRANTY; without even the implied warranty of
//#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//#  GNU General Public License for more details.
//#
//#  You should have received a copy of the GNU General Public License
//#  along with this program; if not, write to the Free Software
//#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//#
//#  $Id: SubArray.cc 26401 2013-09-08 22:36:29Z amesfoort $

#include <APL/CAL_Protocol/SubArray.h>
#include <APL/CAL_Protocol/CalibrationInterface.h>
#include <Common/LofarLogger.h>
#include <Common/StringUtil.h>
#include <Common/hexdump.h>
#include <MACIO/Marshalling.tcc>
#include <APL/RTCCommon/MarshallBlitz.h>

using namespace std;
using namespace blitz;
using namespace LOFAR;
using namespace CAL;

// forward declaration
class CalibrationInterface;
    
//
// SubArray()
//
SubArray::SubArray() : 
	AntennaArray(), 
	m_antenna_selection(), 
	m_spw("undefined", 0, 0, 0, 0)
{
	LOG_TRACE_OBJ("SubArray()");

	m_result[FRONT] = 0;
	m_result[BACK]  = 0;
}

//
// SubArray(name, geoloc, pos, select, freq, nyquist, nrSubbands, rcuControl)
//
SubArray::SubArray (string					name,
					const Array<double,1>&	geoloc,
					const Array<double,3>&	pos,
					const Array<bool, 2>&	select,
					double 					sampling_frequency,
					int    					nyquist_zone,
					int    					nsubbands,
					uint32 					rcucontrol) :
	AntennaArray(name, geoloc, pos),
	m_antenna_selection(select),
	m_spw(name + "_spw", sampling_frequency, nyquist_zone, nsubbands, rcucontrol)
{
	LOG_TRACE_OBJ(formatString("SubArray(%s,%f,%d,%d,%08X)", 
							name.c_str(), sampling_frequency, nyquist_zone, nsubbands, rcucontrol));

	// assert sizes
	ASSERT(m_antenna_selection.extent(firstDim) == m_pos.extent(firstDim)
		&& m_antenna_selection.extent(secondDim) == m_pos.extent(secondDim)
		&& m_pos.extent(thirdDim) == 3);

	LOG_DEBUG_STR("name=" << name);
	LOG_DEBUG_STR("select=" << select);
	LOG_DEBUG_STR("m_pos=" << m_pos);

	// construct a new pos(ition) array containing only the coordinates of the
	// the subarray. Remember in m_rcuindex of each of these elements to which
	// of the global rcus the newpos element refers.

	// make array at least big enough
	m_rcuindex.resize(m_pos.extent(firstDim), m_pos.extent(secondDim));
	m_rcuindex = -1;

	// will contain positions of antenna's that contribute to subarray
	Array<double, 3> newpos(m_pos.shape());
	newpos = 0.0;
	
	// clear RCUbitset
	itsRCUmask.reset();

	// loop over inputs and update our admin.
	int sel = 0;
	for (int ant = 0; ant < m_pos.extent(firstDim); ant++) {
		if (sum(m_antenna_selection(ant, Range::all())) > 0) {
			for (int pol = 0; pol < m_pos.extent(secondDim); pol++) {
				if (m_antenna_selection(ant, pol)) {
					newpos(sel, pol, Range::all()) = m_pos(ant, pol, Range::all());
					m_rcuindex(sel, pol) = ant * m_pos.extent(secondDim) + pol;
					itsRCUmask.set(ant * N_POL + pol);
				}
			} // for each pol
			sel++;
		} // antenna in subarray?
	} // for each antenna
	m_antenna_count = sel;
	m_pos 			= newpos; // overwrite original positions

	ASSERT(m_antenna_count > 0);

	// resize the arrays
	m_pos.resizeAndPreserve(m_antenna_count, m_pos.extent(secondDim), m_pos.extent(thirdDim));
	m_rcuindex.resizeAndPreserve(m_antenna_count, m_rcuindex.extent(secondDim));

	LOG_DEBUG_STR("m_pos=" << m_pos);
	LOG_DEBUG_STR("m_rcuindex=" << m_rcuindex);
	LOG_DEBUG_STR("itsRCUmask=" << itsRCUmask);

	// create calibration result objects
	m_result[FRONT] = new AntennaGains(m_pos.extent(firstDim), m_pos.extent(secondDim), m_spw.getNumSubbands());
	m_result[BACK]  = new AntennaGains(m_pos.extent(firstDim), m_pos.extent(secondDim), m_spw.getNumSubbands());
	ASSERT(m_result[FRONT] && m_result[BACK]);
}

SubArray::~SubArray()
{
	LOG_DEBUG_STR("SubArray destructor");	
	if (m_result[FRONT]) {
		delete m_result[FRONT];
	}
	if (m_result[BACK])  {
		delete m_result[BACK];
	}
}

void SubArray::calibrate(CalibrationInterface* cal, ACC& acc)
{
	ASSERT(m_result[FRONT]);

	if (cal) {
		acc.setSelection(m_antenna_selection);
		cal->calibrate(*this, acc, *m_result[FRONT]);
	}
	m_result[FRONT]->setDone();
}

bool SubArray::getGains(AntennaGains*& cal, int buffer)
{
	cal = 0;
	ASSERT(buffer >= FRONT && buffer <= BACK && m_result[buffer]);

	cal = m_result[buffer];

	return m_result[buffer]->isDone();
}

void SubArray::abortCalibration()
{}

const SpectralWindow& SubArray::getSPW() const
{
	return m_spw;
}

SubArray& SubArray::operator=(const SubArray& rhs)
{
	if (this != &rhs) {
		// base-class assignment
		AntennaArray::operator=(rhs);

		// assign spectral window
		m_spw = rhs.getSPW();

		// clear m_result pointers
		this->m_result[FRONT] = 0;
		this->m_result[BACK] = 0;

		itsRCUmask = rhs.itsRCUmask;
	}

	return *this;
}

bool SubArray::isDone()
{
	ASSERT(m_result[FRONT]);
	return m_result[FRONT]->isDone();
}

void SubArray::clearDone()
{
	ASSERT(m_result[FRONT]);
	m_result[FRONT]->setDone(false);
}

size_t SubArray::getSize() const
{
  return
      MSH_size(m_name)
    + MSH_size(m_geoloc)
    + MSH_size(m_pos)
    + MSH_size(m_rcuindex)
    + MSH_size(itsRCUmask)
    + m_spw.getSize();
}

size_t SubArray::pack(char* buffer) const
{
	uint32 offset = 0;

	MSH_pack(buffer, offset, m_name);
	MSH_pack(buffer, offset, m_geoloc);
	MSH_pack(buffer, offset, m_pos);
	MSH_pack(buffer, offset, m_rcuindex);
	MSH_pack(buffer, offset, itsRCUmask);
	offset += m_spw.pack(buffer + offset);

	return offset;
}

size_t SubArray::unpack(const char* buffer)
{
	uint32 offset = 0;

	MSH_unpack(buffer, offset, m_name);
	MSH_unpack(buffer, offset, m_geoloc);
	MSH_unpack(buffer, offset, m_pos);
	MSH_unpack(buffer, offset, m_rcuindex);
	MSH_unpack(buffer, offset, itsRCUmask);
	offset += m_spw.unpack(buffer + offset);

	return offset;
}

// -------------------- SubArrayMap --------------------

size_t SubArrayMap::getSize() const
{
	return (MSH_size(*this));
}

size_t SubArrayMap::pack(char* buffer) const
{
	uint32 offset = 0;
	MSH_pack(buffer, offset, (*this));
	return (offset);
}

size_t SubArrayMap::unpack(const char* buffer)
{
	uint32 offset = 0;
	MSH_unpack(buffer, offset, (*this));
	return (offset);
}

