//#  -*- mode: c++ -*-
//#
//#  TBBTest.h: class definition for the EPA stub task
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
//#  $Id: TBBTest.h 13582 2009-07-03 15:46:45Z loose $

#ifndef TBBTEST_H_
#define TBBTEST_H_

#include <TestSuite/test.h>
#include <GCF/TM/GCF_Control.h>
#include <GCF/TM/GCF_ETHRawPort.h>

namespace LOFAR {
	using GCF::TM::GCFTask;
	using GCF::TM::GCFPort;
	using GCF::TM::GCFETHRawPort;
	using GCF::TM::GCFPortInterface;
	namespace TBB_Test {
  
  class TBBTest : public GCFTask, public Test
  {
    public:
      /**
       * The constructor of the TBBTest task.
       * @param name The name of the task. The name is used for looking
       * up connection establishment information using the GTMNameService and
       * GTMTopologyService classes.
       */
      TBBTest(string name);
      virtual ~TBBTest();

      // state methods

      /**
       * The initial and final state.
       */
      /*@{*/
      GCFEvent::TResult initial(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult final(GCFEvent& e, GCFPortInterface &p);
      /*@}*/

      /**
       * The test states. This state is reached when the
       * beaitsClient port is connected.
       */
      GCFEvent::TResult test001(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test002(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test003(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test004(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test005(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test006(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test007(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test008(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test009(GCFEvent& e, GCFPortInterface &p);
			GCFEvent::TResult test010(GCFEvent& e, GCFPortInterface &p);// size
      GCFEvent::TResult test011(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test012(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test013(GCFEvent& e, GCFPortInterface &p);
      GCFEvent::TResult test014(GCFEvent& e, GCFPortInterface &p);

      /**
       * Run the tests.
       */
      void run();

    private:
      // member variables

    private:
      // ports
      GCFPort	itsClient;
			uint32	itsboardmask;
  };
	
	}
}
     
#endif /* TBBTEST_H_ */
