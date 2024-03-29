//# CasaGridder.cc: Gridder for LOFAR data correcting for DD effects
//#
//# Copyright (C) 2009
//# ASTRON (Netherlands Institute for Radio Astronomy)
//# P.O.Box 2, 7990 AA Dwingeloo, The Netherlands
//#
//# This file is part of the LOFAR software suite.
//# The LOFAR software suite is free software: you can redistribute it and/or
//# modify it under the terms of the GNU General Public License as published
//# by the Free Software Foundation, either version 3 of the License, or
//# (at your option) any later version.
//#
//# The LOFAR software suite is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License along
//# with the LOFAR software suite. If not, see <http://www.gnu.org/licenses/>.
//#
//# $Id: CasaGridder.cc 18046 2011-05-19 20:58:40Z diepen $
//#
//# @author Ger van Diepen <diepen at astron dot nl>

#include <lofar_config.h>
#include <LofarFT/CasaGridder.h>
#include <ParmDB/Grid.h>

using namespace LOFAR::BBS;
using namespace casa;

namespace LOFAR
{

  CasaGridder::CasaGridder (const ParameterSet& parset)
  {
  }

  CasaGridder::~CasaGridder()
  {}

  const std::string& CasaGridder::gridderName()
  {
    static std::string name("CasaGridder");
    return name;
  }

  void CasaGridder::registerGridder()
  {
    ///    VisGridderFactory::registerGridder (gridderName(), &makeGridder);
  }

} //# end namespace
