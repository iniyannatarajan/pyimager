//#  -*- mode: c++ -*-
//#
//#  BypassSettings.h: Bypass control information
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
//#  $Id: BypassSettings.h 23417 2012-12-20 14:06:29Z loose $

#ifndef BYPASSSETTINGS_H
#define BYPASSSETTINGS_H

//#include <APL/RTCCommon/RegisterState.h>

#include <complex>
#include <blitz/array.h>
#include <Common/LofarTypes.h>
#include <APL/RSP_Protocol/EPA_Protocol.ph>

namespace LOFAR {
  namespace RSP_Protocol {

// Note: Bypass registers are per BP, so each register has info for the X
//		 and the Y antenna.
class BypassSettings
{
public:
	// Constructor and destructor
	BypassSettings() { }
	virtual ~BypassSettings() {}

	class Control {
	public:
		Control() { 
			memset(&bypass,0,sizeof(bypass));
			bypass.raw.dc_disable = 1;
		}
		~Control() {}

		void setXSI(bool	on) { bypass.raw.six_enable = on ? 1 : 0; }
		void setYSI(bool	on) { bypass.raw.siy_enable = on ? 1 : 0; }
		bool getXSI() const 	{ return bypass.raw.six_enable; }
		bool getYSI() const 	{ return bypass.raw.siy_enable; }
		uint16	getAsUint16() const	{ return bypass.as_uint; }
		DIAGBypass	getRaw()  const	{ return bypass.raw; }
		void setRaw(const DIAGBypass	newBypass) { bypass.raw = newBypass; }
	private:
		union {
			EPA_Protocol::DIAGBypass	raw;
			uint16	as_uint;
		} bypass;
	};

	/* get reference to diag settings array */
	blitz::Array<Control, 1>& operator()();

	//@{
	//
	// marshalling methods
	//
	size_t getSize() const;
	size_t pack  (char* buffer) const;
	size_t unpack(const char *buffer);
  	//@}

private:
	blitz::Array<Control, 1> m_registers;
	
};

inline blitz::Array<BypassSettings::Control, 1>& BypassSettings::operator()() { 
	return m_registers; 
}

  }; // namespace RSP_Protocol
}; // namespace LOFAR

#endif /* BYPASSSETTINGS_H */