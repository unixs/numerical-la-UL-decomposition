C     UL Matrix decomposition
      PROGRAM UL_DECOMP
        PARAMETER (N = 3)
        REAL M, V, U, L, Y, X
        DIMENSION M(N,N), V(N), U(N,N), L(N,N), Y(N), X(N)
        DATA M /1., -1., 3., 4., -2., 20., 2., 1., 19/,
     &       V /8., 3., 71./,
     &       U /9 * 0/,
     &       L /9 * 0/


        DO 10 I = 1, N
C         Fill L matrix diag with 1
          L(I, I) = 1
C         Fill U matrix first row
          U(1, I) = M(1, I)

C         Fill L matrix first column
          IF (I.GT.1)
     &      L(I, 1) = M(I, 1) / U(1, 1)
10      CONTINUE

        DO 30 I = 2, N
          DO 20 J = I, N
            U(I, J) = M(I, J) - SUM()
            L(J, I) = (1 / U(J, J)) * (M(J, I) - SUM())
20        CONTINUE
30      CONTINUE

        PRINT 500, "UL-DECOMP", M(3, 2), V(2), U(1, 2), L(3, 1)
500     FORMAT (1X, A, 1X, 4F15.12)
      END
