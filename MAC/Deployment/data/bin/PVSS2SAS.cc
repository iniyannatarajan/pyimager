//#  PVSS2SAS: translate PVSS DPname to SAS DPname
//#
//#  Copyright (C) 2008
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
//#  $Id: PVSS2SAS.cc 19088 2011-10-21 14:49:42Z mol $

//# Always #include <lofar_config.h> first!
#include <lofar_config.h>

//# Includes
#include <ostream>
using namespace std;
#include <Common/LofarTypes.h>
#include <ApplCommon/StationInfo.h>

using namespace LOFAR;

int	main (int	argc, char*	argv[]) {
    (void)argc;
    (void)argv;

	string	input;
	while(getline(cin, input)) {
		cout << PVSS2SASname(input) << endl;
	}
	return (0);
}

