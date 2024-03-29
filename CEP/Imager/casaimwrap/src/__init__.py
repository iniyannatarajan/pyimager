# __init__.py:
#
# Copyright (C) 2012
# ASTRON (Netherlands Institute for Radio Astronomy)
# P.O.Box 2, 7990 AA Dwingeloo, The Netherlands
#
# This file is part of the LOFAR software suite.
# The LOFAR software suite is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The LOFAR software suite is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with the LOFAR software suite. If not, see <http://www.gnu.org/licenses/>.
#
# $Id: __init__.py 20560 2012-03-26 12:06:49Z zwieten $


from _casaimwrap import *

import _casaimwrap
import lofar.parameterset


def init(context, msname, parameters) :
  
  ps = lofar.parameterset.parameterset()
  for key in parameters :
    ps.add(key, str(parameters[key]))
  _casaimwrap.init(context, msname, lofar.parameterset.PyParameterSet(ps))
  
  