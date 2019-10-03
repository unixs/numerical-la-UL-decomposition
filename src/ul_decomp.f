C     UL Matrix decomposition
      PROGRAM UL_DECOMP
        PARAMETER (N = 3)
        REAL A, B, U, L, Y, X
        DIMENSION A(N,N), B(N), U(N,N), L(N,N), Y(N), X(N)
        DATA A /1., -1., 3., 4., -2., 20., 2., 1., 19/,
     &       B /8., 3., 71./,
     &       U /9 * 0/,
     &       L /9 * 0/


        DO 10 I = 1, N
C         Fill L matrix diag with 1
          L(I, I) = 1
C         Fill U matrix first row
          U(1, I) = A(1, I)

C         Fill L matrix first column
          IF (I.GT.1)
     &      L(I, 1) = A(I, 1) / U(1, 1)
10      CONTINUE

        DO 30 I = 2, N
          DO 20 J = I, N

C           Fill U row cell by cell
            S = 0
            DO 15 K = 1, J - 1
              S = S + L(J, K) * U(K, I)
15          CONTINUE
            U(I, J) = A(I, J) - S

C           Fill L column cell by cell & use previously calculated cell
            S = 0
            DO 16 K = 1, J - 1
              S = S + L(I, K) * U(K, J)
16          CONTINUE
            L(J, I) = (1 / U(J, J)) * (A(J, I) - S)

20        CONTINUE
30      CONTINUE

        PRINT 500, "UL-DECOMP", A(3, 2), B(2), U(1, 2), L(3, 1)
500     FORMAT (1X, A, 1X, 4F15.12)
      END
