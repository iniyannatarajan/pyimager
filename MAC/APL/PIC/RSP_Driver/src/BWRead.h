//#  -*- mode: c++ -*-
//#
//#  BWRead.h: Read beamformer weights to the RSP hardware.
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
//#  $Id: BWRead.h 22248 2012-10-08 12:34:59Z overeem $

#ifndef BWREAD_H_
#define BWREAD_H_

#include <Common/LofarTypes.h>
#include <APL/RSP_Protocol/MEPHeader.h>

#include "SyncAction.h"

namespace LOFAR {
  namespace RSP {
    class BWRead : public SyncAction
    {
    public:
      /**
       * Constructors for a BWRead object.
       */
      BWRead(GCFPortInterface& board_port, int board_id, int blp, int regid);
	  
      /* Destructor for BWRead. */
      virtual ~BWRead();

      /**
       * Send the read message.
       */
      virtual void sendrequest();

      /**
       * Send the read request.
       */
      virtual void sendrequest_status();

      /**
       * Handle the read result.
       */
      virtual GCFEvent::TResult handleack(GCFEvent& event, GCFPortInterface& port);

    private:
      int m_blp;
      int m_regid;
      int itsBank;

      size_t m_remaining; // how much to read
      size_t m_offset;    // where to read

      EPA_Protocol::MEPHeader m_hdr;
    };
  };
};
     
#endif /* BWSYNC_H_ */
