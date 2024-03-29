//# tParameterValue.cc: Test program for class ParameterValue
//#
//# Copyright (C) 2008
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
//# $Id: tParameterValue.cc 22651 2012-11-05 13:48:24Z diepen $

#include <lofar_config.h>
#include <Common/ParameterValue.h>
#include <Common/StringUtil.h>
#include <Common/LofarLogger.h>

using namespace LOFAR;

void testScalar()
{
  ParameterValue pv("  abc  ");
  ASSERT (pv.get() == "abc");
  ASSERT (! pv.isVector());
  ASSERT (pv.getString() == "abc");
  ASSERT (pv.getStringVector().size() == 1);
  ASSERT (pv.getStringVector()[0] == "abc");
  ParameterValue pv1("  abc  ", false);
  ASSERT (pv1.get() == "  abc  ");
  ASSERT (! pv1.isVector());
  ASSERT (pv1.getString() == "  abc  ");
  ASSERT (pv1.getStringVector().size() == 1);
  ASSERT (pv1.getStringVector()[0] == "  abc  ");
  ParameterValue pv2("'  abc  '");
  ASSERT (pv2.get() == "'  abc  '");
  ASSERT (! pv2.isVector());
  ASSERT (pv2.getString() == "  abc  ");
  ASSERT (pv2.getStringVector().size() == 1);
  ASSERT (pv2.getStringVector()[0] == "  abc  ");
}

void testEmpty()
{
  ParameterValue pv("  ");
  ASSERT (pv.get() == "");
  ASSERT (! pv.isVector());
  ASSERT (pv.getString() == "");
  ASSERT (pv.getStringVector().size() == 0);
  ParameterValue pv1("  ", false);
  ASSERT (pv1.get() == "  ");
  ASSERT (! pv1.isVector());
  ASSERT (pv1.getString() == "  ");
  ASSERT (pv1.getStringVector().size() == 1);
  ASSERT (pv1.getStringVector()[0] == "  ");
  ParameterValue pv2("'  '");
  ASSERT (pv2.get() == "'  '");
  ASSERT (! pv2.isVector());
  ASSERT (pv2.getString() == "  ");
  ASSERT (pv2.getStringVector().size() == 1);
  ASSERT (pv2.getStringVector()[0] == "  ");
}

void testVector()
{
  // Test a nested vector.
  ParameterValue pv("  [ 1,2.5 , ['a',  ,c ] , 3]  ");
  ASSERT (pv.get() == "[ 1,2.5 , ['a',  ,c ] , 3]");
  ASSERT (pv.isVector());
  vector<ParameterValue> vec = pv.getVector();
  ASSERT (vec.size() == 4);
  ASSERT (vec[0].get() == "1");
  ASSERT (vec[1].get() == "2.5");
  ASSERT (vec[2].get() == "['a',  ,c ]");
  ASSERT (vec[3].get() == "3");
  ASSERT (!vec[0].isVector());
  ASSERT (!vec[1].isVector());
  ASSERT (vec[2].isVector());
  ASSERT (!vec[3].isVector());
  ASSERT (vec[0].getBool());
  ASSERT (vec[0].getInt() == 1);
  ASSERT (vec[0].getFloat() == 1);
  ASSERT (vec[0].getDouble() == 1);
  ASSERT (vec[0].getString() == "1");
  ASSERT (vec[1].getFloat() == 2.5);
  ASSERT (vec[1].getDouble() == 2.5);
  // Test getting the nested value as a vector.
  vector<ParameterValue> vec2 = vec[2].getVector();
  ASSERT (vec2.size() == 3);
  ASSERT (vec2[0].get() == "'a'");
  ASSERT (vec2[1].get() == "");
  ASSERT (vec2[2].get() == "c");
  vector<string> vecs = vec[2].getStringVector();
  ASSERT (vecs.size() == 3);
  ASSERT (vecs[0] == "a");
  ASSERT (vecs[1] == "");
  ASSERT (vecs[2] == "c");
  // Test a vector with all kind of quoting.
  ParameterValue pvq ("['a,\",[' , \"'{,4' \"]");
  vector<ParameterValue> vecq = pvq.getVector();
  ASSERT (vecq.size() == 2);
  ASSERT (vecq[0].get() == "'a,\",['");
  ASSERT (vecq[1].get() == "\"'{,4' \"");
  ASSERT (vecq[0].getString() == "a,\",[");
  ASSERT (vecq[1].getString() == "'{,4' ");
  // Test a vector with another kind of quoting.
  ParameterValue pvq1 ("[\"gain:{11,22}:*\"]");
  vector<ParameterValue> vecq1 = pvq1.getVector();
  ASSERT (vecq1.size() == 1);
  ASSERT (vecq1[0].get() == "\"gain:{11,22}:*\"");
  ASSERT (vecq1[0].getString() == "gain:{11,22}:*");
}

void testExpand()
{
  ParameterValue pv("  [ 3*1, 3..5 ] ");
  pv = pv.expand();
  vector<int> vec = pv.getIntVector();
  ASSERT (vec.size() == 6);
  ASSERT (vec[0] == 1);
  ASSERT (vec[1] == 1);
  ASSERT (vec[2] == 1);
  ASSERT (vec[3] == 3);
  ASSERT (vec[4] == 4);
  ASSERT (vec[5] == 5);
}

int main()
{
  try {
    INIT_LOGGER("tParameterValue");
    testScalar();
    testEmpty();
    testVector();
    testExpand();
  } catch (std::exception& x) {
    cout << "Unexpected exception: " << x.what() << endl;
    return 1;
  }
  return 0;
}
