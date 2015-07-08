# Install script for directory: /scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/scratch/software/pyimager")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "OPT")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/BBSKernel" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Apply.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/BaselineMask.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Correlation.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/CorrelationMask.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Estimate.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Evaluator.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Exceptions.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/ExprSet.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/IndexedSequence.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Instrument.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Interval.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/IonosphereExpr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Measurement.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/MeasurementAIPS.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/MeasurementExpr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/MeasurementExprLOFAR.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/MeasurementExprLOFARUtil.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/ModelConfig.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/ParmManager.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/ParmProxy.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/PatchExpr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Solver.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/SolverInterfaceTypes.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/StationExprLOFAR.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/StationLOFAR.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Types.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/UVWFlagger.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/VisBuffer.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/VisDimensions.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/VisEquator.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/VisSelection.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/BBSKernel/Expr" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/AzEl.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/BasicExpr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Cache.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/CachePolicy.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ConditionNumber.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Delay.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Element.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ElevationCut.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/EquatorialCentroid.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Expr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprId.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprAdaptors.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprParm.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprValue.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprValueView.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprValueIterator.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExprVisData.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ExternalFunction.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/FaradayRotation.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/FlagArray.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/FlagIf.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/GaussianCoherence.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/GaussianSource.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/IonPhaseShift.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ITRFDirection.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/LinearToCircularRL.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Literal.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/LMN.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Matrix.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixComplexArr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixComplexSca.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixInverse.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixInverseMMSE.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixMul2.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixMul3.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixRealArr.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixRealSca.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixRep.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixSum.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MatrixTmp.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/MergeFlags.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/PhaseShift.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/PiercePoint.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/PointCoherence.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/PointSource.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/PolynomialLayer.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/RefCounting.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Request.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Resampler.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Rotation.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ScalarMatrixMul.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Scope.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ShapeletCoherence.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/ShapeletSource.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Source.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/SpectralIndex.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/StationResponse.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/StationShift.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/StationUVW.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/StokesRM.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/TECU2Phase.h"
    "/scratch/software/src/pyimager/CEP/Calibration/BBSKernel/include/BBSKernel/Expr/Timer.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

