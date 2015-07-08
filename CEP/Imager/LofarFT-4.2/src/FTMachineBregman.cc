//# LofarFTMachineSimple.cc: Gridder for LOFAR data correcting for DD effects
//#
//# Copyright (C) 2011
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
//# $Id: FTMachineBregman.cc 28017 2014-01-23 13:01:00Z vdtol $

#include <lofar_config.h>
// #include <Common/LofarLogger.h>
// #include <Common/Exception.h>
#include <Common/OpenMP.h>
#include <synthesis/MSVis/VisibilityIterator.h>
#include <casa/Quanta/UnitMap.h>
#include <casa/Quanta/UnitVal.h>
#include <measures/Measures/Stokes.h>
#include <coordinates/Coordinates/CoordinateSystem.h>
#include <coordinates/Coordinates/DirectionCoordinate.h>
#include <coordinates/Coordinates/SpectralCoordinate.h>
#include <coordinates/Coordinates/StokesCoordinate.h>
#include <coordinates/Coordinates/Projection.h>
#include <ms/MeasurementSets/MSColumns.h>
#include <casa/BasicSL/Constants.h>
#include <scimath/Mathematics/FFTServer.h>
#include <LofarFT/LofarFTMachineOld.h>
#include <LofarFT/LofarCFStore.h>
#include <LofarFT/LofarConvolutionFunctionOld.h>
#include <synthesis/TransformMachines/Utils.h>
#include <LofarFT/LofarVisResamplerOld.h>
#include <synthesis/TransformMachines/CFStore.h>
#include <LofarFT/LofarVBStore.h>
#include <scimath/Mathematics/RigidVector.h>
#include <synthesis/MSVis/StokesVector.h>
#include <synthesis/TransformMachines/StokesImageUtil.h>
#include <synthesis/MSVis/VisBuffer.h>
#include <synthesis/MSVis/VisSet.h>
#include <images/Images/ImageInterface.h>
#include <images/Images/PagedImage.h>
#include <casa/Containers/Block.h>
#include <casa/Containers/Record.h>
#include <casa/Arrays/ArrayLogical.h>
#include <casa/Arrays/ArrayMath.h>
#include <casa/Arrays/Array.h>
#include <casa/Arrays/MaskedArray.h>
#include <casa/Arrays/Vector.h>
#include <casa/Arrays/Slicer.h>
#include <casa/Arrays/Matrix.h>
#include <casa/Arrays/Cube.h>
#include <casa/Arrays/MatrixIter.h>
#include <casa/BasicSL/String.h>
#include <casa/Utilities/Assert.h>
#include <casa/Exceptions/Error.h>
#include <lattices/Lattices/ArrayLattice.h>
#include <measures/Measures/UVWMachine.h>
#include <lattices/Lattices/SubLattice.h>
#include <lattices/Lattices/LCBox.h>
#include <lattices/Lattices/LatticeCache.h>
#include <lattices/Lattices/LatticeFFT.h>
#include <lattices/Lattices/LatticeIterator.h>
#include <lattices/Lattices/LatticeStepper.h>
#include <scimath/Mathematics/ConvolveGridder.h>
#include <casa/Utilities/CompositeNumber.h>
#include <casa/OS/PrecTimer.h>
#include <casa/sstream.h>

using namespace casa;

namespace LOFAR {

FTMachineSimple::FTMachineSimple(
  const MeasurementSet& ms,
  Int nwPlanes,
  MPosition mLocation, 
  Float padding, 
  Bool useDoublePrec)
  : FTMachine( ms, nwPlanes, mLocation, padding, useDoublePrec, parameters),
    itsMachineName("LofarFTMachineSimple"), 
    itsNThread(OpenMP::maxThreads())
{
  AlwaysAssert (itsNThread>0, AipsError);
  itsGriddedData.resize (itsNThread);
  itsGriddedData2.resize (itsNThread);
  itsSumPB.resize (itsNThread);
  itsSumCFWeight.resize (itsNThread);
  itsSumWeight.resize (itsNThread);
}


//----------------------------------------------------------------------
FTMachineSimple& FTMachineSimple::operator=(const FTMachineSimple& other)
{
  if(this!=&other) 
  {
    //Do the base parameters
    FTMachine::operator=(other);

    lattice=0;
    arrayLattice=0;
    itsNThread = other.itsNThread;
    itsGriddedData.resize (itsNThread);
    itsGriddedData2.resize (itsNThread);
    itsSumPB.resize (itsNThread);
    itsSumCFWeight.resize (itsNThread);
    itsSumWeight.resize (itsNThread);
  }
  return *this;
}

//----------------------------------------------------------------------
  FTMachineSimple::FTMachineSimple(const FTMachineSimple& other) : 
    FTMachine(), 
    itsMachineName("LofarFTMachineSimple")
  {
    operator=(other);
  }

//----------------------------------------------------------------------
  FTMachineSimple* FTMachineSimple::clone() const
  {
    FTMachineSimple* newftm = new FTMachineSimple(*this);
    return newftm;
  }

//----------------------------------------------------------------------
void FTMachineSimple::init() {

  itsConvFunc = new ConvolutionFunction(
    padded_shape,
    image->coordinates().directionCoordinate (image->coordinates().findCoordinate(Coordinate::DIRECTION)),
    itsMS,
    itsNWPlanes, 
    itsWMax,
    itsOversample, 
    itsBeamPath,
    itsVerbose, 
    itsMaxSupport,
    itsImageName);

  }
}

void LofarFTMachineOld::put(const VisBuffer& vb, Int row, Bool dopsf,
                         FTMachine::Type type)
{
  if (itsVerbose > 0) {
    logIO() << LogOrigin("LofarFTMachineOld", "put") << LogIO::NORMAL
            << "I am gridding " << vb.nRow() << " row(s)."  << LogIO::POST;
    logIO() << LogIO::NORMAL << "Padding is " << padding_p  << LogIO::POST;
  }

  //Check if ms has changed then cache new spw and chan selection
  if(vb.newMS())   matchAllSpwChans(vb);

  //Here we redo the match or use previous match

  //Channel matching for the actual spectral window of buffer
  if (doConversion_p[vb.spectralWindow()]) {
    matchChannel(vb.spectralWindow(), vb);
  } else {
    chanMap.resize();
    chanMap=multiChanMap_p[vb.spectralWindow()];
  }

  //No point in reading data if it's not matching in frequency
  if(max(chanMap)==-1) return;

  const Matrix<Float> *imagingweight;
  imagingweight=&(vb.imagingWeight());

  // dopsf=true;

  if(dopsf) {type=FTMachine::PSF;}

  Cube<Complex> data;
  //Fortran gridder need the flag as ints
  Cube<Int> flags;
  Matrix<Float> elWeight;
  interpolateFrequencyTogrid(vb, *imagingweight,data, flags, elWeight, type);


  Int startRow, endRow, nRow;
  if (row==-1) { nRow=vb.nRow(); startRow=0; endRow=nRow-1; }
  else         { nRow=1; startRow=row; endRow=row; }

  // Get the uvws in a form that Fortran can use and do that
  // necessary phase rotation. On a Pentium Pro 200 MHz
  // when null, this step takes about 50us per uvw point. This
  // is just barely noticeable for Stokes I continuum and
  // irrelevant for other cases.
  Matrix<Double> uvw(3, vb.uvw().nelements());  uvw=0.0;
  Vector<Double> dphase(vb.uvw().nelements());  dphase=0.0;
  //NEGATING to correct for an image inversion problem
  for (Int i=startRow;i<=endRow;i++) {
    for (Int idim=0;idim<2;idim++) uvw(idim,i)=-vb.uvw()(i)(idim);
    uvw(2,i)=vb.uvw()(i)(2);
  }

  rotateUVW(uvw, dphase, vb);
  refocus(uvw, vb.antenna1(), vb.antenna2(), dphase, vb);

  // Set up VBStore object to point to the relevant info of the VB.
  LofarVBStore vbs;
  makeCFPolMap(vb,cfStokes_p,CFMap_p);
  makeConjPolMap(vb,CFMap_p,ConjCFMap_p);

  // Determine the baselines in the VisBuffer.
  const Vector<Int>& ant1 = vb.antenna1();
  const Vector<Int>& ant2 = vb.antenna2();
  int nrant = 1 + max(max(ant1), max(ant2));
  // Sort on baseline (use a baseline nr which is faster to sort).
  Vector<Int> blnr(nrant*ant1);
  blnr += ant2;  // This is faster than nrant*ant1+ant2 in a single line
  Vector<uInt> blIndex;
  GenSortIndirect<Int>::sort (blIndex, blnr);
  // Now determine nr of unique baselines and their start index.
  vector<int> blStart, blEnd;
  blStart.reserve (nrant*(nrant+1)/2);
  blEnd.reserve   (nrant*(nrant+1)/2);
  Int  lastbl     = -1;
  Int  lastIndex  = 0;
  bool usebl      = false;
  bool allFlagged = true;
  const Vector<Bool>& flagRow = vb.flagRow();
  for (uint i=0; i<blnr.size(); ++i) {
    Int inx = blIndex[i];
    Int bl = blnr[inx];
    if (bl != lastbl) {
      // New baseline. Write the previous end index if applicable.
      if (usebl  &&  !allFlagged) {
	double Wmean(0.5*(vb.uvw()[blIndex[lastIndex]](2) + vb.uvw()[blIndex[i-1]](2)));
	if (abs(Wmean) <= itsWMax) {
	  if (itsVerbose > 1) {
	    cout<<"using w="<<Wmean<<endl;
	  }
	  blStart.push_back (lastIndex);
	  blEnd.push_back (i-1);
	}
      }
      // Skip auto-correlations and high W-values.
      // All w values are close, so if first w is too high, skip baseline.
      usebl = false;

      if (ant1[inx] != ant2[inx]) {
	usebl = true;
      }
      lastbl=bl;
      lastIndex=i;
    }
    // Test if the row is flagged.
    if (! flagRow[inx]) {
      allFlagged = false;
    }
  }
  // Write the last end index if applicable.
  if (usebl  &&  !allFlagged) {
    double Wmean(0.5*(vb.uvw()[blIndex[lastIndex]](2) + vb.uvw()[blIndex[blnr.size()-1]](2)));
    if (abs(Wmean) <= itsWMax) {
      if (itsVerbose > 1) {
	cout<<"...using w="<<Wmean<<endl;
      }
      blStart.push_back (lastIndex);
      blEnd.push_back (blnr.size()-1);
    }
  }
  // Determine the time center of this data chunk.
  const Vector<Double>& times = vb.timeCentroid();
  double time = 0.5 * (times[times.size()-1] + times[0]);

  vbs.nRow_p = vb.nRow();
  vbs.uvw_p.reference(uvw);
  vbs.imagingWeight_p.reference(elWeight);
  vbs.visCube_p.reference(data);
  //  vbs.visCube_p.reference(vb.modelVisCube());
  vbs.freq_p.reference(interpVisFreq_p);
  vbs.rowFlag_p.reference(vb.flagRow());

  // Really nice way of converting a Cube<Int> to Cube<Bool>.
  // However the VBS objects should ultimately be references
  // directly to bool cubes.
  //**************
  vbs.flagCube_p.resize(flags.shape());    vbs.flagCube_p = False; vbs.flagCube_p(flags!=0) = True;
  //  vbs.flagCube_p.reference(vb.flagCube());
  //**************

   // Determine the terms of the Mueller matrix that should be calculated
  visResamplers_p.setParams(uvScale,uvOffset,dphase);
  visResamplers_p.setMaps(chanMap, polMap);

  // First compute the A-terms for all stations (if needed).
  itsConvFunc->computeAterm (time);

  uInt Nchannels = vb.nChannel();

  itsTotalTimer.start();
#pragma omp parallel 
  {
    // Thread-private variables.
    PrecTimer gridTimer;
    PrecTimer cfTimer;
    // The for loop can be parallellized. This must be done dynamically,
    // because the execution times of iterations can vary greatly.
#pragma omp for schedule(dynamic)
    for (int i=0; i<int(blStart.size()); ++i) {
      Int ist  = blIndex[blStart[i]];
      Int iend = blIndex[blEnd[i]];

      // compute average weight for baseline for CF averaging
      double average_weight(0.);
      uInt Nvis(0);
      for(Int j=ist; j<iend; ++j)
      {
        uInt row=blIndex[j];
        if(!vbs.rowFlag()[row])
        {
          Nvis+=1;
          for(uint k=0; k<Nchannels; ++k) 
          {
            average_weight=average_weight+vbs.imagingWeight()(k,row);
          }
        }
      }
      average_weight=average_weight/Nvis;
      ///        itsSumWeight += average_weight * average_weight;
      if (itsVerbose > 1) 
      {
        cout<<"average weights= "<<average_weight<<", Nvis="<<Nvis<<endl;
      }

      int threadNum = OpenMP::threadNum();

      // Get the convolution function.
      if (itsVerbose > 1) 
      {
        cout.precision(20);
        cout<<"A1="<<ant1[ist]<<", A2="<<ant2[ist]<<", time="<<fixed<<time<<endl;
      }
      LofarCFStore cfStore;
      cfTimer.start();
      cfStore = itsConvFunc->makeConvolutionFunction (
        ant1[ist], 
        ant2[ist], 
        time,
        0.5*(vbs.uvw()(2,ist) + vbs.uvw()(2,iend)),
        itsGridMuellerMask, 
        false,
        average_weight,
        itsSumPB[threadNum],
        itsSumCFWeight[threadNum]);
      cfTimer.stop();

      if (useDoubleGrid_p) 
      {
        visResamplers_p.lofarDataToGrid(itsGriddedData2[threadNum], vbs, blIndex,
                                        blStart[i], blEnd[i],
                                        itsSumWeight[threadNum], dopsf, cfStore);
      } 
      else 
      {
        if (itsVerbose > 1) 
        {
          cout<<"  gridding"<<" thread="<<threadNum<<'('<<itsNThread<<"), A1="<<ant1[ist]<<", A2="<<ant2[ist]<<", time=" <<time<<endl;
        }
        gridTimer.start();
        visResamplers_p.lofarDataToGrid(
          itsGriddedData[threadNum], 
          vbs, 
          blIndex, 
          blStart[i],
          blEnd[i], 
          itsSumWeight[threadNum], 
          dopsf, 
          cfStore);
        gridTimer.stop();
      }
    } // end omp for
    double cftime = cfTimer.getReal();
#pragma omp atomic
    itsCFTime += cftime;
    double gtime = gridTimer.getReal();
#pragma omp atomic
    itsGriddingTime += gtime;
  } // end omp parallel
  itsTotalTimer.stop();
}


// Degrid
void LofarFTMachineOld::get(VisBuffer& vb, Int row)
{
  if (itsVerbose > 0) {
    cout<<"///////////////////// GET!!!!!!!!!!!!!!!!!!"<<endl;
  }
  gridOk(gridder->cSupport()(0));
  // If row is -1 then we pass through all rows
  Int startRow, endRow, nRow;
  if (row < 0) { nRow=vb.nRow(); startRow=0; endRow=nRow-1;}
  else         { nRow=1; startRow=row; endRow=row; }

  // Get the uvws in a form that Fortran can use
  Matrix<Double> uvw(3, vb.uvw().nelements());  uvw=0.0;
  Vector<Double> dphase(vb.uvw().nelements());  dphase=0.0;
  //NEGATING to correct for an image inversion problem
  for (Int i=startRow;i<=endRow;i++) {
    for (Int idim=0;idim<2;idim++) uvw(idim,i)=-vb.uvw()(i)(idim);
    uvw(2,i)=vb.uvw()(i)(2);
  }
  rotateUVW(uvw, dphase, vb);
  refocus(uvw, vb.antenna1(), vb.antenna2(), dphase, vb);

  //Check if ms has changed then cache new spw and chan selection
  if(vb.newMS())  matchAllSpwChans(vb);


  //Channel matching for the actual spectral window of buffer
  if(doConversion_p[vb.spectralWindow()])
    matchChannel(vb.spectralWindow(), vb);
  else
    {
      chanMap.resize();
      chanMap=multiChanMap_p[vb.spectralWindow()];
    }

  //No point in reading data if its not matching in frequency
  if(max(chanMap)==-1)    return;

  Cube<Complex> data;
  Cube<Int> flags;
  getInterpolateArrays(vb, data, flags);

  // Apparently we don't support "tiled gridding" any more (good! :)).
  if(isTiled)
    throw(SynthesisFTMachineError("LofarFTMachineOld::get(): Internal error.  isTiled is True. "));

  LofarVBStore vbs;
  vbs.nRow_p = vb.nRow();
  vbs.beginRow_p = 0;
  vbs.endRow_p = vbs.nRow_p;

  vbs.uvw_p.reference(uvw);
  //    vbs.imagingWeight.reference(elWeight);
  vbs.visCube_p.reference(data);
  
  vbs.freq_p.reference(interpVisFreq_p);
  vbs.rowFlag_p.resize(0); vbs.rowFlag_p = vb.flagRow();
  if(!usezero_p)
    for (Int rownr=startRow; rownr<=endRow; rownr++)
      if(vb.antenna1()(rownr)==vb.antenna2()(rownr)) vbs.rowFlag_p(rownr)=True;

  // Really nice way of converting a Cube<Int> to Cube<Bool>.
  // However these should ultimately be references directly to bool
  // cubes.
  vbs.flagCube_p.resize(flags.shape());    vbs.flagCube_p = False; vbs.flagCube_p(flags!=0) = True;
  //    vbs.rowFlag.resize(rowFlags.shape());  vbs.rowFlag  = False; vbs.rowFlag(rowFlags) = True;

  // Determine the terms of the Mueller matrix that should be calculated
  visResamplers_p.setParams(uvScale,uvOffset,dphase);
  visResamplers_p.setMaps(chanMap, polMap);


  // Determine the baselines in the VisBuffer.
  const Vector<Int>& ant1 = vb.antenna1();
  const Vector<Int>& ant2 = vb.antenna2();
  int nrant = 1 + max(max(ant1), max(ant2));
  // Sort on baseline (use a baseline nr which is faster to sort).
  Vector<Int> blnr(nrant*ant1);
  blnr += ant2;  // This is faster than nrant*ant1+ant2 in a single line
  Vector<uInt> blIndex;
  GenSortIndirect<Int>::sort (blIndex, blnr);
  // Now determine nr of unique baselines and their start index.
  vector<int> blStart, blEnd;
  blStart.reserve (nrant*(nrant+1)/2);
  blEnd.reserve   (nrant*(nrant+1)/2);
  Int  lastbl     = -1;
  Int  lastIndex  = 0;
  bool usebl      = false;
  bool allFlagged = true;
  const Vector<Bool>& flagRow = vb.flagRow();
  for (uint i=0; i<blnr.size(); ++i) {
    Int inx = blIndex[i];
    Int bl = blnr[inx];
    if (bl != lastbl) {
      // New baseline. Write the previous end index if applicable.
      if (usebl  &&  !allFlagged) {
        double Wmean(0.5*(vb.uvw()[blIndex[lastIndex]](2) + vb.uvw()[blIndex[i-1]](2)));
        if (abs(Wmean) <= itsWMax) {
	  if (itsVerbose > 1) {
	    cout<<"using w="<<Wmean<<endl;
	  }
	  blStart.push_back (lastIndex);
	  blEnd.push_back (i-1);
        }
      }
      // Skip auto-correlations and high W-values.
      // All w values are close, so if first w is too high, skip baseline.
      usebl = false;

      if (ant1[inx] != ant2[inx]) {
        usebl = true;
      }
      lastbl=bl;
      lastIndex=i;
    }
    // Test if the row is flagged.
    if (! flagRow[inx]) 
    {
      allFlagged = false;
    }
  }
  // Write the last end index if applicable.
  if (usebl  &&  !allFlagged) 
  {
    double Wmean(0.5*(vb.uvw()[blIndex[lastIndex]](2) + vb.uvw()[blIndex[blnr.size()-1]](2)));
    if (abs(Wmean) <= itsWMax) {
      if (itsVerbose > 1) 
      {
        cout<<"...using w="<<Wmean<<endl;
      }
      blStart.push_back (lastIndex);
      blEnd.push_back (blnr.size()-1);
    }
  }

  // Determine the time center of this data chunk.
  const Vector<Double>& times = vb.timeCentroid();
  double time = 0.5 * (times[times.size()-1] + times[0]);

  // First compute the A-terms for all stations (if needed).
  itsConvFunc->computeAterm (time);

  itsTotalTimer.start();
  #pragma omp parallel
  {
    // Thread-private variables.
    PrecTimer degridTimer;
    PrecTimer cfTimer;
    // The for loop can be parallellized. This must be done dynamically,
    // because the execution times of iterations can vary greatly.
    #pragma omp for schedule(dynamic)
    for (int i=0; i<int(blStart.size()); ++i) {
      // #pragma omp critical(LofarFTMachineOld_lofarGridToData)
      // {
      Int ist  = blIndex[blStart[i]];
      Int iend = blIndex[blEnd[i]];
      int threadNum = OpenMP::threadNum();
      // Get the convolution function for degridding.
      if (itsVerbose > 1) {
	cout<<"ANTENNA "<<ant1[ist]<<" "<<ant2[ist]<<endl;
      }
      cfTimer.start();
      LofarCFStore cfStore = itsConvFunc->makeConvolutionFunction (
        ant1[ist], 
        ant2[ist], 
        time,
        0.5*(vbs.uvw()(2,ist) + vbs.uvw()(2,iend)),
        itsDegridMuellerMask,
        true,
        0.0,
        itsSumPB[threadNum],
        itsSumCFWeight[threadNum]);
      cfTimer.stop();

      //Double or single precision gridding.
      //      cout<<"GRID "<<ant1[ist]<<" "<<ant2[ist]<<endl;
      degridTimer.start();
      visResamplers_p.lofarGridToData(vbs, itsGriddedData[0],
                                      blIndex, blStart[i], blEnd[i], cfStore);
      degridTimer.stop();
    } // end omp for
    double cftime = cfTimer.getReal();
    #pragma omp atomic
    itsCFTime += cftime;
    double gtime = degridTimer.getReal();
    #pragma omp atomic
    itsGriddingTime += gtime;
  } // end omp parallel
  itsTotalTimer.stop();
  interpolateFrequencyFromgrid(vb, data, FTMachine::MODEL);
}



// Finalize the FFT to the Sky. Here we actually do the FFT and
// return the resulting image
ImageInterface<Complex>& LofarFTMachineOld::getImage(Matrix<Float>& weights, Bool normalize)
{
  //AlwaysAssert(lattice, AipsError);
  AlwaysAssert(gridder, AipsError);
  AlwaysAssert(image, AipsError);
  logIO() << LogOrigin("LofarFTMachineOld", "getImage") << LogIO::NORMAL;

  if (itsVerbose > 0) {
    cout<<"GETIMAGE"<<endl;
  }
  itsAvgPB.reference (itsConvFunc->Compute_avg_pb(itsSumPB[0], itsSumCFWeight[0]));

  //cout<<"weights.shape() "<<weights.shape()<<"  "<<sumWeight<<endl;

  weights.resize(itsSumWeight[0].shape());

  convertArray(weights, itsSumWeight[0]);
  // If the weights are all zero then we cannot normalize
  // otherwise we don't care.
  if(normalize&&max(weights)==0.0) {
    logIO() << LogIO::SEVERE << "No useful data in LofarFTMachineOld: weights all zero"
	    << LogIO::POST;
  }
  else {

    const IPosition latticeShape = lattice->shape();

    logIO() << LogIO::DEBUGGING
	    << "Starting FFT and scaling of image" << LogIO::POST;



    // if(useDoubleGrid_p){
    //   convertArray(griddedData, griddedData2);
    //   //Don't need the double-prec grid anymore...
    //   griddedData2.resize();
    // }

    // x and y transforms
    //    LatticeFFT::cfft2d(*lattice,False);
    //
    // Retain the double precision grid for FFT as well.  Convert it
    // to single precision just after (since images are still single
    // precision).
    //
    if(useDoubleGrid_p) {
      ArrayLattice<DComplex> darrayLattice(itsGriddedData2[0]);
      LatticeFFT::cfft2d(darrayLattice,False);
      convertArray(itsGriddedData[0], itsGriddedData2[0]);
      //Don't need the double-prec grid anymore...
      ///griddedData2.resize();
    } else {
      LatticeFFT::cfft2d(*lattice, False);
    }

    if (itsVerbose > 0) {
      cout<<"POLMAP:::::::  "<<polMap<<endl;
      cout<<"POLMAP:::::::  "<<CFMap_p<<endl;
    }
    //cout<<"CFPOLMAP:::::::  "<<cfPolMap<<endl;
    //Int i,j,N = cfPolMap.nelements();
    //for(i=0;i<N;i++){
    //  if (cfPolMap[i] > -1){cout<<"cfPolMap[i]<<visStokes[i]"<<cfPolMap[i]<<" "<<visStokes[i]<<endl;};
    //};


    // Cyr: This does a normalisation by the number of pixel and spheroidal
    // function in the dirty image.
    // I have commented out the spheroidal normalisation (correctX1D part)
    {
      Int inx = lattice->shape()(0);
      Int iny = lattice->shape()(1);
      Vector<Complex> correction(inx);
      correction=Complex(1.0, 0.0);
      // Do the Grid-correction
      IPosition cursorShape(4, inx, 1, 1, 1);
      IPosition axisPath(4, 0, 1, 2, 3);
      LatticeStepper lsx(lattice->shape(), cursorShape, axisPath);
      LatticeIterator<Complex> lix(*lattice, lsx);
      for(lix.reset();!lix.atEnd();lix++) {
        Int pol=lix.position()(2);
	//cout<<"pol "<<pol<<endl;
        Int chan=lix.position()(3);
        if(weights(pol, chan)!=0.0) {
          //gridder->correctX1D(correction, lix.position()(1));
	  //cout<<"correction "<<correction<<endl;
          //lix.rwVectorCursor()/=correction;
          if(normalize) {
            Complex rnorm(Float(inx)*Float(iny)/weights(pol,chan));
            lix.rwCursor()*=rnorm;
	    //cout<<"rnorm "<<rnorm<<endl;
          }
          else {
            Complex rnorm(Float(inx)*Float(iny));
            lix.rwCursor()*=rnorm;
	    //cout<<"rnorm "<<rnorm<<endl;
          }
        }
        else {
          lix.woCursor()=0.0;
        }
      }
    }

    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // Normalising dirty image by the spheroidal function

    // String namei("sphe.img");
    // ostringstream name(namei);
    // PagedImage<Float> tmp(name.str().c_str());
    // Slicer slice(IPosition(4,0,0,0,0), tmp.shape(), IPosition(4,1,1,1,1));
    // Array<Float> data;
    // tmp.doGetSlice(data, slice);
    // IPosition posi(4,lattice->shape()[0],lattice->shape()[1],1,1);
    // IPosition posi2(4,lattice->shape()[0],lattice->shape()[1],1,1);
    // posi[2]=0.;
    // posi[3]=0.;
    // posi2[2]=0.;
    // posi2[3]=0.;    
    // Int offset_pad(floor(data.shape()[0]-lattice->shape()[0])/2.);

    


    // for(uInt k=0;k<lattice->shape()[2];++k){
    //   for(uInt i=0;i<lattice->shape()[0];++i){
    // 	for(uInt j=0;j<lattice->shape()[0];++j){
    // 	  posi[0]=i;
    // 	  posi[1]=j;
    // 	  posi[2]=k;
    // 	  posi2[0]=i+offset_pad;
    // 	  posi2[1]=j+offset_pad;
    // 	  Complex pixel(lattice->getAt(posi));
    // 	  //pixel/=data(posi2);//*data(posi2);
    // 	  lattice->putAt(pixel,posi);
    // 	};
    //   };
    // };
    //====================================================================================================================
    //====================================================================================================================
    //====================================================================================================================
    // Cyr: Normalisation by the beam!!!!!
    //cout<<"lattice shape: "<<lattice->shape()<<endl;
    IPosition pos(4,lattice->shape()[0],lattice->shape()[1],1,1);
    uInt shapeout(floor(lattice->shape()[0]/padding_p));
    uInt istart(floor((lattice->shape()[0]-shapeout)/2.));
    Cube<Complex> tempimage(IPosition(3,shapeout,shapeout,lattice->shape()[2]));

    pos[3]=0.;
    for(Int k=0;k<lattice->shape()[2];++k){
      for(uInt i=0;i<shapeout;++i){
    	for(uInt j=0;j<shapeout;++j){
    	  pos[0]=i+istart;
    	  pos[1]=j+istart;
    	  pos[2]=k;
    	  Complex pixel(lattice->getAt(pos));
    	  //cout<<"pixel value: "<<pixel<<", Primary beam: "<<avg_PB(i,j)<<endl;
    	  pixel/=sqrt(itsAvgPB(i+istart,j+istart));//*sqrt(avg_PB(i+istart,j+istart));
    	  //pixel*=(lattice->shape()[0]*lattice->shape()[0]);
    	  lattice->putAt(pixel,pos);
    	  //tempimage(i,j,k)=pixel/weights(0,0);
    	}
      }
    }
    // uInt count_cycle(0);
    // Bool written(false);

    // while(!written){
    //   cout<<"count_cycle ======================= "<<count_cycle<<" "<<normalize<<endl;
    //   File myFile("Cube_dirty.img"+String::toString(count_cycle));
    //   if(!myFile.exists()){
    // 	written=true;
    // 	store(tempimage,"Cube_dirty.img"+String::toString(count_cycle));
    //   }
    //   else{
    // 	count_cycle++;
    //   };
    // };

    //====================================================================================================================
    //====================================================================================================================
    //====================================================================================================================



    if(!isTiled) {
      // Check the section from the image BEFORE converting to a lattice
      IPosition blc(4, (nx-image->shape()(0)+(nx%2==0))/2, (ny-image->shape()(1)+(ny%2==0))/2, 0, 0);
      IPosition stride(4, 1);
      IPosition trc(blc+image->shape()-stride);
      // Do the copy
      IPosition start(4, 0);
      image->put(itsGriddedData[0](blc, trc));
    }
  }

  //store(*image,"last.img");
  return *image;
}

// Get weight image
void LofarFTMachineOld::getWeightImage(ImageInterface<Float>& weightImage, Matrix<Float>& weights)
{

  logIO() << LogOrigin("LofarFTMachineOld", "getWeightImage") << LogIO::NORMAL;

  weights.resize(itsSumWeight[0].shape());
  convertArray(weights,itsSumWeight[0]);

  const IPosition latticeShape = weightImage.shape();

  Int nx=latticeShape(0);
  Int ny=latticeShape(1);

  IPosition loc(2, 0);
  IPosition cursorShape(4, nx, ny, 1, 1);
  IPosition axisPath(4, 0, 1, 2, 3);
  LatticeStepper lsx(latticeShape, cursorShape, axisPath);
  LatticeIterator<Float> lix(weightImage, lsx);
  for(lix.reset();!lix.atEnd();lix++) {
    Int pol=lix.position()(2);
    Int chan=lix.position()(3);
    lix.rwCursor()=weights(pol,chan);
  }
}

Bool LofarFTMachineOld::toRecord(String& error, RecordInterface& outRec,
			Bool withImage) {

  // Save the current LofarFTMachineOld object to an output state record
  Bool retval = True;

  Double cacheVal=(Double)cachesize;
  outRec.define("cache", cacheVal);
  outRec.define("tile", tilesize);
  outRec.define("gridfunction", convType);

  Vector<Double> phaseValue(2);
  String phaseUnit;
  phaseValue=mTangent_p.getAngle().getValue();
  phaseUnit= mTangent_p.getAngle().getUnit();
  outRec.define("phasevalue", phaseValue);
  outRec.define("phaseunit", phaseUnit);

  Vector<Double> dirValue(3);
  String dirUnit;
  dirValue=mLocation_p.get("m").getValue();
  dirUnit=mLocation_p.get("m").getUnit();
  outRec.define("dirvalue", dirValue);
  outRec.define("dirunit", dirUnit);

  outRec.define("padding", padding_p);
  outRec.define("maxdataval", maxAbsData);

  Vector<Int> center_loc(4), offset_loc(4);
  for (Int k=0; k<4 ; k++){
    center_loc(k)=centerLoc(k);
    offset_loc(k)=offsetLoc(k);
  }
  outRec.define("centerloc", center_loc);
  outRec.define("offsetloc", offset_loc);
  outRec.define("sumofweights", itsSumWeight[0]);
  if(withImage && image){
    ImageInterface<Complex>& tempimage(*image);
    Record imageContainer;
    retval = (retval || tempimage.toRecord(error, imageContainer));
    outRec.defineRecord("image", imageContainer);
  }
  return retval;
}

Bool LofarFTMachineOld::fromRecord(String& error, const RecordInterface& inRec)
{
  Bool retval = True;
  gridder=0; imageCache=0; lattice=0; arrayLattice=0;
  Double cacheVal;
  inRec.get("cache", cacheVal);
  cachesize=(Long)cacheVal;
  inRec.get("tile", tilesize);
  inRec.get("gridfunction", convType);

  Vector<Double> phaseValue(2);
  inRec.get("phasevalue",phaseValue);
  String phaseUnit;
  inRec.get("phaseunit",phaseUnit);
  Quantity val1(phaseValue(0), phaseUnit);
  Quantity val2(phaseValue(1), phaseUnit);
  MDirection phasecenter(val1, val2);

  mTangent_p=phasecenter;
  // This should be passed down too but the tangent plane is
  // expected to be specified in all meaningful cases.
  tangentSpecified_p=True;
  Vector<Double> dirValue(3);
  String dirUnit;
  inRec.get("dirvalue", dirValue);
  inRec.get("dirunit", dirUnit);
  MVPosition dummyMVPos(dirValue(0), dirValue(1), dirValue(2));
  MPosition mLocation(dummyMVPos, MPosition::ITRF);
  mLocation_p=mLocation;

  inRec.get("padding", padding_p);
  inRec.get("maxdataval", maxAbsData);

  Vector<Int> center_loc(4), offset_loc(4);
  inRec.get("centerloc", center_loc);
  inRec.get("offsetloc", offset_loc);
  uInt ndim4 = 4;
  centerLoc=IPosition(ndim4, center_loc(0), center_loc(1), center_loc(2),
		      center_loc(3));
  offsetLoc=IPosition(ndim4, offset_loc(0), offset_loc(1), offset_loc(2),
		      offset_loc(3));
  inRec.get("sumofweights", itsSumWeight[0]);
  if(inRec.nfields() > 12 ){
    Record imageAsRec=inRec.asRecord("image");
    if(!image) {
      image= new TempImage<Complex>();
    }
    retval = (retval || image->fromRecord(error, imageAsRec));

    // Might be changing the shape of sumWeight
    init();

    if(isTiled) {
      lattice=CountedPtr<Lattice<Complex> >(image, False);
    }
    else {
      // Make the grid the correct shape and turn it into an array lattice
      // Check the section from the image BEFORE converting to a lattice
      IPosition gridShape(4, nx, ny, npol, nchan);
      itsGriddedData[0].resize(gridShape);
      itsGriddedData[0]=Complex(0.0);
      IPosition blc(4, (nx-image->shape()(0)+(nx%2==0))/2, (ny-image->shape()(1)+(ny%2==0))/2, 0, 0);
      IPosition start(4, 0);
      IPosition stride(4, 1);
      IPosition trc(blc+image->shape()-stride);
      itsGriddedData[0](blc, trc)=image->getSlice(start, image->shape());

      //if(arrayLattice) delete arrayLattice; arrayLattice=0;
      arrayLattice = new ArrayLattice<Complex>(itsGriddedData[0]);
      lattice=arrayLattice;
    }

    //AlwaysAssert(lattice, AipsError);
    AlwaysAssert(gridder, AipsError);
    AlwaysAssert(image, AipsError);
  }
  return retval;
}

void LofarFTMachineOld::ok() {
  AlwaysAssert(image, AipsError);
}

// Make a plain straightforward honest-to-God image. This returns
// a complex image, without conversion to Stokes. The representation
// is that required for the visibilities.
//----------------------------------------------------------------------
void LofarFTMachineOld::makeImage(FTMachine::Type type,
		       VisSet& vs,
		       ImageInterface<Complex>& theImage,
		       Matrix<Float>& weight) {


  logIO() << LogOrigin("LofarFTMachineOld", "makeImage") << LogIO::NORMAL;

  if(type==FTMachine::COVERAGE) {
    logIO() << "Type COVERAGE not defined for Fourier transforms" << LogIO::EXCEPTION;
  }


  // Initialize the gradients
  ROVisIter& vi(vs.iter());

  // Loop over all visibilities and pixels
  VisBuffer vb(vi);

  // Initialize put (i.e. transform to Sky) for this model
  vi.origin();

// /home/vdtol/lofar-casapy-4.1/src/LOFAR/CEP/Imager/LofarFT/src/LofarFTMachineOld.cc:1502: error: incomplete type ‘casa::SkyModel’ used in nested name specifier
// /home/vdtol/lofar-casapy-4.1/src/LOFAR/CEP/Imager/LofarFT/src/LofarFTMachineOld.cc:1505: error: incomplete type ‘casa::SkyModel’ used in nested name specifier
  if(vb.polFrame()==MSIter::Linear) {
//     StokesImageUtil::changeCStokesRep(theImage, SkyModel::LINEAR);
  }
  else {
//     StokesImageUtil::changeCStokesRep(theImage, SkyModel::CIRCULAR);
  }

  initializeToSky(theImage,weight,vb);

  // Loop over the visibilities, putting VisBuffers
  for (vi.originChunks();vi.moreChunks();vi.nextChunk()) {
    for (vi.origin(); vi.more(); vi++) {

      switch(type) {
      case FTMachine::RESIDUAL:
        if (itsVerbose > 0) cout<<"FTMachine::RESIDUAL"<<endl;
	vb.visCube()=vb.correctedVisCube();
	vb.visCube()-=vb.modelVisCube();
        put(vb, -1, False);
        break;
      case FTMachine::MODEL:
	if (itsVerbose > 0) cout<<"FTMachine::MODEL"<<endl;
	vb.visCube()=vb.modelVisCube();
        put(vb, -1, False);
        break;
      case FTMachine::CORRECTED:
	if (itsVerbose > 0) cout<<"FTMachine::CORRECTED"<<endl;
	vb.visCube()=vb.correctedVisCube();
        put(vb, -1, False);
        break;
      case FTMachine::PSF:
	if (itsVerbose > 0) cout<<"FTMachine::PSF"<<endl;
	vb.visCube()=Complex(1.0,0.0);
        put(vb, -1, True);
        break;
      case FTMachine::OBSERVED:
      default:
	if (itsVerbose > 0) cout<<"FTMachine::OBSERVED"<<endl;
        put(vb, -1, False);
        break;
      }
    }
  }
  finalizeToSky();
  // Normalize by dividing out weights, etc.
  getImage(weight, True);
}

String LofarFTMachineOld::name(){

  return machineName_p;


}

void LofarFTMachineOld::ComputeResiduals(VisBuffer&vb, Bool useCorrected)
{
  LofarVBStore vbs;
  vbs.nRow_p = vb.nRow();
  vbs.beginRow_p = 0;
  vbs.endRow_p = vbs.nRow_p;
  vbs.modelCube_p.reference(vb.modelVisCube());
  if (useCorrected) vbs.correctedCube_p.reference(vb.correctedVisCube());
  else vbs.visCube_p.reference(vb.visCube());
  //  cout<<"BLA===="<<vb.visCube()<<"    "<<useCorrected<<endl;
  
  //for(uInt i=0;i<vbs.nRow_p;++i){cout<<"ROW "<<i<<" "<<vb.antenna1()(i)<<" "<<vb.antenna2()(i)<<endl;};

  vbs.useCorrected_p = useCorrected;
  visResamplers_p.lofarComputeResiduals(vbs);

  //  vb.correctedVisCube()=0.;//vb.modelVisCube();
}

  void LofarFTMachineOld::makeSensitivityImage(const VisBuffer& vb,
					 const ImageInterface<Complex>& imageTemplate,
					 ImageInterface<Float>& sensitivityImage)
  {
    if (convFuncCtor_p->makeAverageResponse(vb, imageTemplate, sensitivityImage))
      cfCache_p->flush(sensitivityImage,sensitivityPatternQualifierStr_p);
  }
  //
  //---------------------------------------------------------------
  //
  void LofarFTMachineOld::normalizeAvgPB(ImageInterface<Complex>& inImage,
				   ImageInterface<Float>& outImage)
  {
    LogIO log_l(LogOrigin("LofarFTMachineOld", "normalizeAvgPB"));
    if (pbNormalized_p) return;
    IPosition inShape(inImage.shape()),ndx(4,0,0,0,0);
    Vector<Complex> peak(inShape(2));

    outImage.resize(inShape);
    outImage.setCoordinateInfo(inImage.coordinates());

    Bool isRefIn;
    Array<Complex> inBuf;
    Array<Float> outBuf;

    isRefIn  = inImage.get(inBuf);
    log_l << "Normalizing the average PBs to unity"
	  << LogIO::NORMAL << LogIO::POST;
    //
    // Normalize each plane of the inImage separately to unity.
    //
    Complex inMax = max(inBuf);
    if (abs(inMax)-1.0 > 1E-3)
      {
	for(ndx(3)=0;ndx(3)<inShape(3);ndx(3)++)
	  for(ndx(2)=0;ndx(2)<inShape(2);ndx(2)++)
	    {
	      peak(ndx(2)) = 0;
	      for(ndx(1)=0;ndx(1)<inShape(1);ndx(1)++)
		for(ndx(0)=0;ndx(0)<inShape(0);ndx(0)++)
		  if (abs(inBuf(ndx)) > peak(ndx(2)))
		    peak(ndx(2)) = inBuf(ndx);

	      for(ndx(1)=0;ndx(1)<inShape(1);ndx(1)++)
		for(ndx(0)=0;ndx(0)<inShape(0);ndx(0)++)
		  //		      avgPBBuf(ndx) *= (pbPeaks(ndx(2))/peak(ndx(2)));
		  inBuf(ndx) /= peak(ndx(2));
	    }
	if (isRefIn) inImage.put(inBuf);
      }

    ndx=0;
    for(ndx(1)=0;ndx(1)<inShape(1);ndx(1)++)
      for(ndx(0)=0;ndx(0)<inShape(0);ndx(0)++)
	{
	  IPosition plane1(ndx);
	  plane1=ndx;
	  plane1(2)=1; // The other poln. plane
	  //	  avgPBBuf(ndx) = (avgPBBuf(ndx) + avgPBBuf(plane1))/2.0;
	  outBuf(ndx) = sqrt(real(inBuf(ndx) * inBuf(plane1)));
	}
    //
    // Rather convoluted way of copying Pol. plane-0 to Pol. plane-1!!!
    //
    for(ndx(1)=0;ndx(1)<inShape(1);ndx(1)++)
      for(ndx(0)=0;ndx(0)<inShape(0);ndx(0)++)
	{
	  IPosition plane1(ndx);
	  plane1=ndx;
	  plane1(2)=1; // The other poln. plane
	  outBuf(plane1) = outBuf(ndx);
	}

    pbNormalized_p = True;
  }
  //
  //---------------------------------------------------------------
  //
  void LofarFTMachineOld::normalizeAvgPB()
  {
    LogIO log_l(LogOrigin("LofarFTMachineOld", "normalizeAvgPB"));
    if (pbNormalized_p) return;
    Bool isRefF;
    Array<Float> avgPBBuf;
    isRefF=avgPB_p->get(avgPBBuf);
    //    Float pbMax = max(avgPBBuf);
      {
	pbPeaks.resize(avgPB_p->shape()(2),True);
	// if (makingPSF) pbPeaks = 1.0;
	// else pbPeaks /= (Float)noOfPASteps;
	pbPeaks = 1.0;
	log_l << "Normalizing the average PBs to " << 1.0
	      << LogIO::NORMAL << LogIO::POST;

	IPosition avgPBShape(avgPB_p->shape()),ndx(4,0,0,0,0);
	Vector<Float> peak(avgPBShape(2));


	Float pbMax = max(avgPBBuf);
	if (fabs(pbMax-1.0) > 1E-3)
	  {
	    //	    avgPBBuf = avgPBBuf/noOfPASteps;
	    for(ndx(3)=0;ndx(3)<avgPBShape(3);ndx(3)++)
	      for(ndx(2)=0;ndx(2)<avgPBShape(2);ndx(2)++)
		{
		  peak(ndx(2)) = 0;
		  for(ndx(1)=0;ndx(1)<avgPBShape(1);ndx(1)++)
		    for(ndx(0)=0;ndx(0)<avgPBShape(0);ndx(0)++)
		      if (abs(avgPBBuf(ndx)) > peak(ndx(2)))
			peak(ndx(2)) = avgPBBuf(ndx);

		  for(ndx(1)=0;ndx(1)<avgPBShape(1);ndx(1)++)
		    for(ndx(0)=0;ndx(0)<avgPBShape(0);ndx(0)++)
		      //		      avgPBBuf(ndx) *= (pbPeaks(ndx(2))/peak(ndx(2)));
		      avgPBBuf(ndx) /= peak(ndx(2));
		}
	    if (isRefF) avgPB_p->put(avgPBBuf);
	  }

	ndx=0;
	for(ndx(1)=0;ndx(1)<avgPBShape(1);ndx(1)++)
	  for(ndx(0)=0;ndx(0)<avgPBShape(0);ndx(0)++)
	    {
	      IPosition plane1(ndx);
	      plane1=ndx;
	      plane1(2)=1; // The other poln. plane
	      avgPBBuf(ndx) = (avgPBBuf(ndx) + avgPBBuf(plane1))/2.0;
	      //	      avgPBBuf(ndx) = (avgPBBuf(ndx) * avgPBBuf(plane1));
	    }
	for(ndx(1)=0;ndx(1)<avgPBShape(1);ndx(1)++)
	  for(ndx(0)=0;ndx(0)<avgPBShape(0);ndx(0)++)
	    {
	      IPosition plane1(ndx);
	      plane1=ndx;
	      plane1(2)=1; // The other poln. plane
	      avgPBBuf(plane1) = avgPBBuf(ndx);
	    }
      }
      pbNormalized_p = True;
  }

  void LofarFTMachineOld::normalizeImage(Lattice<Complex>& skyImage,
				   const Matrix<Double>& sumOfWts,
				   Lattice<Float>& sensitivityImage,
				   Lattice<Complex>& sensitivitySqImage,
				   Bool fftNorm)
  {
    //
    // Apply the gridding correction
    //
    if (itsVerbose > 0) {
      cout<<"LofarFTMachineOld::normalizeImage"<<endl;
    }
    Int inx = skyImage.shape()(0);
    Int iny = skyImage.shape()(1);
    Vector<Complex> correction(inx);

    Vector<Float> sincConv(nx);
    Float centerX=nx/2;
    for (Int ix=0;ix<nx;ix++)
      {
	Float x=C::pi*Float(ix-centerX)/(Float(nx)*Float(convSampling));
	if(ix==centerX) sincConv(ix)=1.0;
	else 	    sincConv(ix)=sin(x)/x;
      }

    IPosition cursorShape(4, inx, 1, 1, 1);
    IPosition axisPath(4, 0, 1, 2, 3);
    LatticeStepper lsx(skyImage.shape(), cursorShape, axisPath);
    LatticeIterator<Complex> lix(skyImage, lsx);

    LatticeStepper lavgpb(sensitivityImage.shape(),cursorShape,axisPath);
    LatticeIterator<Float> liavgpb(sensitivityImage, lavgpb);
    LatticeStepper lavgpbSq(sensitivitySqImage.shape(),cursorShape,axisPath);
    LatticeIterator<Complex> liavgpbSq(sensitivitySqImage, lavgpbSq);

    for(lix.reset(),liavgpb.reset(),liavgpbSq.reset();
	!lix.atEnd();
	lix++,liavgpb++,liavgpbSq++)
      {
	Int pol=lix.position()(2);
	Int chan=lix.position()(3);

	if(sumOfWts(pol, chan)>0.0)
	  {
	    Int iy=lix.position()(1);
	    gridder->correctX1D(correction,iy);

	    Vector<Complex> PBCorrection(liavgpb.rwVectorCursor().shape());
	    Vector<Float> avgPBVec(liavgpb.rwVectorCursor().shape());
	    Vector<Complex> avgPBSqVec(liavgpbSq.rwVectorCursor().shape());

	    avgPBSqVec= liavgpbSq.rwVectorCursor();
	    avgPBVec = liavgpb.rwVectorCursor();

	    for(int i=0;i<PBCorrection.shape();i++)
	      {
		//
		// This with the PS functions
		//
		// PBCorrection(i)=FUNC(avgPBVec(i))*sincConv(i)*sincConv(iy);
		// if ((abs(PBCorrection(i)*correction(i))) >= pbLimit_p)
		// 	lix.rwVectorCursor()(i) /= PBCorrection(i)*correction(i);
		// else if (!makingPSF)
		// 	lix.rwVectorCursor()(i) /= correction(i)*sincConv(i)*sincConv(iy);
		//
		// This without the PS functions
		//



		// if (makingPSF)
		PBCorrection(i)=(avgPBSqVec(i)/avgPBVec(i));///(sincConv(i)*sincConv(iy));
		//		PBCorrection(i)=(avgPBSqVec(i));///(sincConv(i)*sincConv(iy));
		//		PBCorrection(i)=avgPBVec(i);///(sincConv(i)*sincConv(iy));

		// else
		//		PBCorrection(i)=(avgPBVec(i));//*sincConv(i)*sincConv(iy);
		//		if ((abs(avgPBSqVec(i))) >= pbLimit_p)
		if ((abs(avgPBVec(i))) >= pbLimit_p)
		  lix.rwVectorCursor()(i) /= PBCorrection(i);

		// if ((abs(PBCorrection(i))) >= pbLimit_p)
		//   lix.rwVectorCursor()(i) /= PBCorrection(i);
		// else if (!makingPSF)
		//   lix.rwVectorCursor()(i) /= sincConv(i)*sincConv(iy);


		// PBCorrection(i)=FUNC(avgPBVec(i)/avgPBSqVec(i))/(sincConv(i)*sincConv(iy));
		// lix.rwVectorCursor()(i) *= PBCorrection(i);

		// if ((abs(avgPBSqVec(i))) >= pbLimit_p)
		//   lix.rwVectorCursor()(i) *= PBCorrection(i);
		// else if (!makingPSF)
		//   lix.rwVectorCursor()(i) /= sincConv(i)*sincConv(iy);
	      }

	    if(fftNorm)
	      {
		Complex rnorm(Float(inx)*Float(iny)/sumOfWts(pol,chan));
		lix.rwCursor()*=rnorm;
	      }
	    else
	      {
		Complex rnorm(Float(inx)*Float(iny));
		lix.rwCursor()*=rnorm;
	      }
	  }
	else
	  lix.woCursor()=0.0;
      }
  }
  //
  //---------------------------------------------------------------
  //
  void LofarFTMachineOld::normalizeImage(Lattice<Complex>& skyImage,
				   const Matrix<Double>& sumOfWts,
				   Lattice<Float>& sensitivityImage,
				   Bool fftNorm)
  {
    //
    // Apply the gridding correction
    //
    if (itsVerbose > 0) {
      cout<<"LofarFTMachineOld::normalizeImage<"<<endl;
    }
    Int inx = skyImage.shape()(0);
    Int iny = skyImage.shape()(1);
    Vector<Complex> correction(inx);

    Vector<Float> sincConv(nx);
    Float centerX=nx/2;
    for (Int ix=0;ix<nx;ix++)
      {
	Float x=C::pi*Float(ix-centerX)/(Float(nx)*Float(convSampling));
	if(ix==centerX) sincConv(ix)=1.0;
	else 	    sincConv(ix)=sin(x)/x;
      }

    IPosition cursorShape(4, inx, 1, 1, 1);
    IPosition axisPath(4, 0, 1, 2, 3);
    LatticeStepper lsx(skyImage.shape(), cursorShape, axisPath);
    //    LatticeIterator<Complex> lix(skyImage, lsx);
    LatticeIterator<Complex> lix(skyImage, lsx);

    LatticeStepper lavgpb(sensitivityImage.shape(),cursorShape,axisPath);
    // Array<Float> senArray;sensitivityImage.get(senArray,True);
    // ArrayLattice<Float> senLat(senArray,True);
    //    LatticeIterator<Float> liavgpb(senLat, lavgpb);
    LatticeIterator<Float> liavgpb(sensitivityImage, lavgpb);

    for(lix.reset(),liavgpb.reset();
	!lix.atEnd();
	lix++,liavgpb++)
      {
	Int pol=lix.position()(2);
	Int chan=lix.position()(3);

	if(sumOfWts(pol, chan)>0.0)
	  {
	    Int iy=lix.position()(1);
	    gridder->correctX1D(correction,iy);

	    Vector<Float> avgPBVec(liavgpb.rwVectorCursor().shape());

	    avgPBVec = liavgpb.rwVectorCursor();

	    for(int i=0;i<avgPBVec.shape();i++)
	      {
		//
		// This with the PS functions
		//
		// PBCorrection(i)=FUNC(avgPBVec(i))*sincConv(i)*sincConv(iy);
		// if ((abs(PBCorrection(i)*correction(i))) >= pbLimit_p)
		// 	lix.rwVectorCursor()(i) /= PBCorrection(i)*correction(i);
		// else if (!makingPSF)
		// 	lix.rwVectorCursor()(i) /= correction(i)*sincConv(i)*sincConv(iy);
		//
		// This without the PS functions
		//
		//                Float tt=sqrt(avgPBVec(i))/avgPBVec(i);
		Float tt = pbFunc(avgPBVec(i),pbLimit_p);
                  //		PBCorrection(i)=pbFunc(avgPBVec(i),pbLimit_p)*sincConv(i)*sincConv(iy);
                  //                lix.rwVectorCursor()(i) /= PBCorrection(i);
		//                lix.rwVectorCursor()(i) *= tt;

		lix.rwVectorCursor()(i) /= tt;
		// if ((abs(tt) >= pbLimit_p))
		//   lix.rwVectorCursor()(i) /= tt;
		// else if (!makingPSF)
		//   lix.rwVectorCursor()(i) /= sincConv(i)*sincConv(iy);
	      }

	    if(fftNorm)
	      {
		Complex rnorm(Float(inx)*Float(iny)/sumOfWts(pol,chan));
		lix.rwCursor()*=rnorm;
	      }
	    else
	      {
		Complex rnorm(Float(inx)*Float(iny));
		lix.rwCursor()*=rnorm;
	      }
	  }
	else
	  lix.woCursor()=0.0;
      }
  }


  void LofarFTMachineOld::makeCFPolMap(const VisBuffer& vb, const Vector<Int>& locCfStokes,
				 Vector<Int>& polM)
  {
    LogIO log_l(LogOrigin("LofarFTMachineOld", "findPointingOffsets"));
    Vector<Int> msStokes = vb.corrType();
    Int nPol = msStokes.nelements();
    polM.resize(polMap.shape());
    polM = -1;

    for(Int i=0;i<nPol;i++)
      for(uInt j=0;j<locCfStokes.nelements();j++)
	if (locCfStokes(j) == msStokes(i))
	    {polM(i) = j;break;}
  }
  //
  //---------------------------------------------------------------
  //
  // Given a polMap (mapping of which Visibility polarization is
  // gridded onto which grid plane), make a map of the conjugate
  // planes of the grid E.g, for Stokes-I and -V imaging, the two
  // planes of the uv-grid are [LL,RR].  For input VisBuffer
  // visibilites in order [RR,RL,LR,LL], polMap = [1,-1,-1,0].  The
  // conjugate map will be [0,-1,-1,1].
  //
  void LofarFTMachineOld::makeConjPolMap(const VisBuffer& vb,
				     const Vector<Int> cfPolMap,
				     Vector<Int>& conjPolMap)
  {
    LogIO log_l(LogOrigin("LofarFTMachineOld", "makConjPolMap"));
    //
    // All the Natak (Drama) below with slicers etc. is to extract the
    // Poln. info. for the first IF only (not much "information
    // hiding" for the code to slice arrays in a general fashion).
    //
    // Extract the shape of the array to be sliced.
    //
    Array<Int> stokesForAllIFs = vb.msColumns().polarization().corrType().getColumn();
    IPosition stokesShape(stokesForAllIFs.shape());
    IPosition firstIFStart(stokesShape),firstIFLength(stokesShape);
    //
    // Set up the start and length IPositions to extract only the
    // first column of the array.  The following is required since the
    // array could have only one column as well.
    //
    firstIFStart(0)=0;firstIFLength(0)=stokesShape(0);
    for(uInt i=1;i<stokesShape.nelements();i++) {firstIFStart(i)=0;firstIFLength(i)=1;}
    //
    // Construct the slicer and produce the slice.  .nonDegenerate
    // required to ensure the result of slice is a pure vector.
    //
    Vector<Int> visStokes = stokesForAllIFs(Slicer(firstIFStart,firstIFLength)).nonDegenerate();

    conjPolMap = cfPolMap;

    Int i,j,N = cfPolMap.nelements();
    
    for(i=0;i<N;i++)
      if (cfPolMap[i] > -1)
	{
	if      (visStokes[i] == Stokes::XX)
	  {
	    conjPolMap[i]=-1;
	    for(j=0;j<N;j++) if (visStokes[j] == Stokes::YY) break;
	    conjPolMap[i]=cfPolMap[j];
	  }
	else if (visStokes[i] == Stokes::YY)
	  {
	    conjPolMap[i]=-1;
	    for(j=0;j<N;j++) if (visStokes[j] == Stokes::XX) break;
	    conjPolMap[i]=cfPolMap[j];
	  }
	else if (visStokes[i] == Stokes::YX)
	  {
	    conjPolMap[i]=-1;
	    for(j=0;j<N;j++) if (visStokes[j] == Stokes::XY) break;
	    conjPolMap[i]=cfPolMap[j];
	  }
	else if (visStokes[i] == Stokes::XY)
	  {
	    conjPolMap[i]=-1;
	    for(j=0;j<N;j++) if (visStokes[j] == Stokes::YX) break;
	    conjPolMap[i]=cfPolMap[j];
	  }
	}
  }

  void LofarFTMachineOld::showTimings (ostream& os, double duration) const
  {
    // The total time is the real elapsed time.
    // The cf and (de)gridding time is the sum of all threads, so scale
    // them back to real time.
    double total = itsCFTime + itsGriddingTime + itsDegriddingTime;
    double scale = 1;
    if (total > 0) {
      scale = itsTotalTimer.getReal() / total;
    }
    itsConvFunc->showTimings (os, duration, itsCFTime*scale);
    if (itsGriddingTime > 0) {
      os << "  gridding          ";
      LofarConvolutionFunctionOld::showPerc1 (os, itsGriddingTime*scale,
                                           duration);
      os << endl;
    }
    if (itsDegriddingTime > 0) {
      os << "  degridding        ";
      LofarConvolutionFunctionOld::showPerc1 (os, itsDegriddingTime*scale,
                                           duration);
      os << endl;
    }
  }

} //# end namespace
