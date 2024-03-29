//# FileDescriptorBasedStream.cc: 
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
//# $Id: FileDescriptorBasedStream.cc 25574 2013-07-04 16:02:41Z amesfoort $

#include <lofar_config.h>

#include <Common/LofarLogger.h>
#include <Common/SystemCallException.h>
#include <Stream/FileDescriptorBasedStream.h>
#include <Common/Thread/Cancellation.h>

#include <unistd.h>

#include <stdexcept>


namespace LOFAR {

FileDescriptorBasedStream::~FileDescriptorBasedStream()
{
  ScopedDelayCancellation dc; // close() can throw as it is a cancellation point

  if (fd >= 0 && close(fd) < 0) {
    // try/throw/catch to match patterns elsewhere. 
    //
    // This ensures a proper string for errno, a
    // backtrace if available, and the proper representation
    // of exceptions in general.
    try {
      THROW_SYSCALL("close");
    } catch (Exception &ex) {
      LOG_ERROR_STR("Exception in destructor: " << ex);
    }
  }
}


size_t FileDescriptorBasedStream::tryRead(void *ptr, size_t size)
{
  ssize_t bytes = ::read(fd, ptr, size);
  
  if (bytes < 0)
    THROW_SYSCALL("read");

  if (bytes == 0) 
    throw EndOfStreamException("read", THROW_ARGS);

  return bytes;
}


size_t FileDescriptorBasedStream::tryWrite(const void *ptr, size_t size)
{
  ssize_t bytes = ::write(fd, ptr, size);

  if (bytes < 0)
    THROW_SYSCALL("write");

  return bytes;
}


void FileDescriptorBasedStream::sync()
{
  if (fsync(fd) < 0)
    THROW_SYSCALL("fsync");
}

} // namespace LOFAR
