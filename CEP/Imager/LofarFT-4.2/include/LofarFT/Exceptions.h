//# Exceptions.h: Declaration and definition of LofarFT specific exceptions.
//#
//# Copyright (C) 2002-2012
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
//# $Id: Exceptions.h 21558 2012-07-12 09:35:39Z loose $

#ifndef LOFARFT_EXCEPTIONS_H
#define LOFARFT_EXCEPTIONS_H

//# Includes
#include <Common/Exception.h>

namespace LOFAR
{
  //
  // Exception for the AWImager.
  //
  EXCEPTION_CLASS(AWImagerException, Exception);

} // namespace LOFAR

#endif
