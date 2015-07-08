//#  GetClocksCmd.cc: implementation of the GetClocksCmd class
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
//#  $Id: GetClocksCmd.cc 13440 2009-06-22 13:26:54Z overeem $

#include <lofar_config.h>
#include <Common/LofarLogger.h>

#include <APL/RSP_Protocol/RSP_Protocol.ph>

#include <APL/RTCCommon/PSAccess.h>
#include <blitz/array.h>

#include "StationSettings.h"
#include "GetClocksCmd.h"

using namespace blitz;
using namespace LOFAR;
using namespace RSP;
using namespace RSP_Protocol;
using namespace RTC;

GetClocksCmd::GetClocksCmd(GCFEvent& event, GCFPortInterface& port, Operation oper) :
	Command("GetClock", port, oper)
{
  m_event = new RSPGetclockEvent(event);
}

GetClocksCmd::~GetClocksCmd()
{
  delete m_event;
}

void GetClocksCmd::ack(CacheBuffer& cache)
{
  RSPGetclockackEvent ack;

  ack.timestamp = getTimestamp();
  ack.status = RSP_SUCCESS;
  ack.clock = cache.getClock();

  getPort()->send(ack);
}

void GetClocksCmd::apply(CacheBuffer& /*cache*/, bool /*setModFlag*/)
{
  /* intentionally left empty */
}

void GetClocksCmd::complete(CacheBuffer& cache)
{
  ack(cache);
}

const RTC::Timestamp& GetClocksCmd::getTimestamp() const
{
  return m_event->timestamp;
}

void GetClocksCmd::setTimestamp(const RTC::Timestamp& timestamp)
{
  m_event->timestamp = timestamp;
}

bool GetClocksCmd::validate() const
{
  return (true);
}

bool GetClocksCmd::readFromCache() const
{
  return m_event->cache;
}
