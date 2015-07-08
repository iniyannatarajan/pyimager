C$TEST DPT1
C TO RUN AS A MAIN PROGRAM REMOVE NEXT LINE
      SUBROUTINE DPT1
C***********************************************************************
C
C  EXAMPLE OF USE OF PORT PROGRAM DPOST
C
C***********************************************************************
      COMMON /CSTAK/ DS
      DOUBLE PRECISION DS(1000)
      EXTERNAL HANDLE, DPOSTD, BC, AF
      INTEGER NDX, K, IS(1000), NU, NV, NMESH
      REAL ERRPAR(2), RS(1000)
      LOGICAL LS(1000)
      COMPLEX CS(500)
      DOUBLE PRECISION U(100), V(1), MESH(100), DT, WS(500), TSTOP
      EQUIVALENCE (DS(1), CS(1), WS(1), RS(1), IS(1), LS(1))
C TO TEST DPOST ON
C      U SUB T = U SUB XX + F      ON (0,1)
C WHERE F IS CHOSEN SO THAT THE SOLUTION IS
C      U(X,T) = EXP(XT).
C THE PORT LIBRARY STACK AND ITS ALIASES.
C INITIALIZE THE PORT LIBRARY STACK LENGTH.
      CALL ISTKIN(1000, 4)
      NU = 1
      NV = 0
      ERRPAR(1) = 0
C ABSOLUTE ERROR.
      ERRPAR(2) = 1E-2
      TSTOP = 1
      DT = 1D-2
      K = 4
C NDX UNIFORM MESH POINTS ON (0,1).
      NDX = 4
      CALL DUMB(0D0, 1D0, NDX, K, MESH, NMESH)
C INITIAL CONDITIONS FOR U.
      CALL SETD(NMESH-K, 1D0, U)
      CALL DPOST(U, NU, K, MESH, NMESH, V, NV, 0D0, TSTOP, DT, AF, BC, 
     1   DPOSTD, ERRPAR, HANDLE)
C CHECK FOR ERRORS AND STACK USAGE STATISTICS.
      CALL WRAPUP
      STOP 
      END
      SUBROUTINE AF(T, X, NX, U, UX, UT, UTX, NU, V, VT, NV, A, 
     1   AU, AUX, AUT, AUTX, AV, AVT, F, FU, FUX, FUT, FUTX, FV, FVT)
      INTEGER NU, NX
      INTEGER NV
      DOUBLE PRECISION T, X(NX), U(NX, NU), UX(NX, NU), UT(NX, NU), UTX(
     1   NX, NU)
      DOUBLE PRECISION V(1), VT(1), A(NX, NU), AU(NX, NU, NU), AUX(NX, 
     1   NU, NU), AUT(NX, NU, NU)
      DOUBLE PRECISION AUTX(NX, NU, NU), AV(1), AVT(1), F(NX, NU), FU(
     1   NX, NU, NU), FUX(NX, NU, NU)
      DOUBLE PRECISION FUT(NX, NU, NU), FUTX(NX, NU, NU), FV(1), FVT(1)
      INTEGER I
      DOUBLE PRECISION DEXP
      DO  1 I = 1, NX
         A(I, 1) = -UX(I, 1)
         AUX(I, 1, 1) = -1
         F(I, 1) = (X(I)-T**2)*DEXP(X(I)*T)-UT(I, 1)
         FUT(I, 1, 1) = -1
   1     CONTINUE
      RETURN
      END
      SUBROUTINE BC(T, L, R, U, UX, UT, UTX, NU, V, VT, NV, B, BU,
     1   BUX, BUT, BUTX, BV, BVT)
      INTEGER NU
      INTEGER NV
      DOUBLE PRECISION T, L, R, U(NU, 2), UX(NU, 2), UT(NU, 2)
      DOUBLE PRECISION UTX(NU, 2), V(1), VT(1), B(NU, 2), BU(NU, NU, 2),
     1   BUX(NU, NU, 2)
      DOUBLE PRECISION BUT(NU, NU, 2), BUTX(NU, NU, 2), BV(1), BVT(1)
      DOUBLE PRECISION DEXP
      B(1, 1) = U(1, 1)-1D0
      B(1, 2) = U(1, 2)-DEXP(T)
      BU(1, 1, 1) = 1
      BU(1, 1, 2) = 1
      RETURN
      END
      SUBROUTINE HANDLE(T0, U0, V0, T, U, V, NU, NXMK, NV, K, X, 
     1   NX, DT, TSTOP)
      INTEGER NXMK, NU, NX
      INTEGER NV, K
      DOUBLE PRECISION T0, U0(NXMK, NU), V0(1), T, U(NXMK, NU), V(1)
      DOUBLE PRECISION X(NX), DT, TSTOP
      COMMON /TIME/ TT
      DOUBLE PRECISION TT
      EXTERNAL UOFX
      INTEGER I1MACH
      DOUBLE PRECISION DEESFF, EU
      INTEGER TEMP
C OUTPUT AND CHECKING ROUTINE.
      IF (T0 .EQ. T) RETURN
C UOFX NEEDS TIME.
      TT = T
      EU = DEESFF(K, X, NX, U, UOFX)
      TEMP = I1MACH(2)
      WRITE (TEMP,  1) T, EU
   1  FORMAT (14H ERROR IN U(X,, 1PE10.2, 4H ) =, 1PE10.2)
      RETURN
      END
      SUBROUTINE UOFX(X, NX, U, W)
      INTEGER NX
      DOUBLE PRECISION X(NX), U(NX), W(NX)
      COMMON /TIME/ T
      DOUBLE PRECISION T
      INTEGER I
      DOUBLE PRECISION DEXP
      DO  1 I = 1, NX
         U(I) = DEXP(X(I)*T)
   1     CONTINUE
      RETURN
      END