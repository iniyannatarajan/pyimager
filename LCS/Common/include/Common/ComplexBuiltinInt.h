//# ComplexBuiltinInt.h: Wrapper for efficient C99 integer complex types
//#
//# Copyright (C) 2005
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
//# $Id: ComplexBuiltinInt.h 25182 2013-06-04 14:47:42Z mol $

#ifndef LOFAR_COMMON_COMPLEXBUILTININT_H
#define LOFAR_COMMON_COMPLEXBUILTININT_H

// \file


#define LOFAR_I8COMPLEX LOFAR_BUILTIN_COMPLEXINT signed char
#define LOFAR_I16COMPLEX LOFAR_BUILTIN_COMPLEXINT short
#define LOFAR_U16COMPLEX LOFAR_BUILTIN_COMPLEXINT unsigned short

//# Include the typedefs for (u)int16.
#include <Common/LofarTypedefs.h>
#include <ostream>


namespace LOFAR {
  namespace TYPES {
    // Define the complex types.
    typedef LOFAR_I8COMPLEX i8complex;
    typedef LOFAR_I16COMPLEX i16complex;
    typedef LOFAR_U16COMPLEX u16complex;
  }

  inline TYPES::i8complex makei8complex (TYPES::int8 re, TYPES::int8 im)
    { return (re + im*1i); }
  inline TYPES::i16complex makei16complex (TYPES::int16 re, TYPES::int16 im)
    { return (re + im*1i); }
  inline TYPES::u16complex makeu16complex (TYPES::uint16 re, TYPES::uint16 im)
    { return (re + im*1i); }

  // Functions operating on int8 complex numbers.
  // <group>
  inline TYPES::int8 real (TYPES::i8complex x)
    { return __real__(x); }
  inline TYPES::int8 imag (TYPES::i8complex x)
    { return __imag__(x); }
  inline TYPES::i8complex conj (TYPES::i8complex x)
    { return ~(x); }
  // </group>

  // Functions operating on int16 complex numbers.
  // <group>
  inline TYPES::int16 real (TYPES::i16complex x)
    { return __real__(x); }
  inline TYPES::int16 imag (TYPES::i16complex x)
    { return __imag__(x); }
  inline TYPES::i16complex conj (TYPES::i16complex x)
    { return ~(x); }
  // </group>

  // Functions operating on uint16 complex numbers.
  // <group>
  inline TYPES::uint16 real (TYPES::u16complex x)
    { return __real__(x); }
  inline TYPES::uint16 imag (TYPES::u16complex x)
    { return __imag__(x); }
  inline TYPES::u16complex conj (TYPES::u16complex x)
    { return ~(x); }
  // </group>

  // Show the complex numbers.
  // <group>
  inline std::ostream& operator<< (std::ostream& os, TYPES::i8complex x)
    { os << '(' << (int)real(x) << ',' << (int)imag(x) << ')'; return os; }
  inline std::ostream& operator<< (std::ostream& os, TYPES::i16complex x)
    { os << '(' << real(x) << ',' << imag(x) << ')'; return os; }
  inline std::ostream& operator<< (std::ostream& os, TYPES::u16complex x)
    { os << '(' << real(x) << ',' << imag(x) << ')'; return os; }
  // </group>
}

#undef LOFAR_I8COMPLEX
#undef LOFAR_I16COMPLEX
#undef LOFAR_U16COMPLEX

#endif
