//#  CTStartDaemon.cc: Main entry for the LogicalDevice startdaemon
//#
//#  Copyright (C) 2002-2005
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
//#  $Id: CTStartDaemonMain.cc 23213 2012-12-07 13:00:09Z loose $
#include <lofar_config.h>
#include <Common/LofarLogger.h>
#include <Common/Exception.h>
#include <signal.h>

#include "CTStartDaemon.h"

using namespace LOFAR;

// Use a terminate handler that can produce a backtrace.
Exception::TerminateHandler t(Exception::terminate);

int main(int argc, char* argv[])
{
//	signal (SIGCHLD, SIG_IGN);

	GCFScheduler::instance()->init(argc, argv, "CTStartDaemon");

	LOG_INFO("MACProcessScope: LOFAR_PermSW_Daemons_CTStartDaemon");

	CUDaemons::CTStartDaemon sd("StartDaemon");		// give myself a name

	sd.start(); // make initial transition

	GCFScheduler::instance()->run();

	return 0;
}

