C     UL Matrix decomposition
      PROGRAM UL_DECOMP_TEST
        PARAMETER (N = 3)
        REAL A, B, U, L, Y, X
        DIMENSION A(N,N), B(N), U(N,N), L(N,N), Y(N), X(N)
        DATA A /1., -1., 3., 4., -2., 20., 2., 1., 19/,
     &       B /8., 3., 71./,
     &       U /9 * 0/,
     &       L /9 * 0/


        CALL UL_DECOMP(N, A, B, L, U, Y, X)


C       Print results:
        PRINT 520, "A"
        DO 100 I = 1, N
          PRINT 510, (A(I, J), J = 1, N)
100     CONTINUE

        PRINT 520, "U"
        DO 110 I = 1, N
          PRINT 510, (U(I, J), J = 1, N)
110     CONTINUE

        PRINT 520, "L"
        DO 120 I = 1, N
          PRINT 510, (L(I, J), J = 1, N)
120     CONTINUE

        PRINT 500, "B"
        PRINT 510, (B(I), I = 1, N)

        PRINT 500, "Y"
        PRINT 510, (Y(I), I = 1, N)

        PRINT 500, "X"
        PRINT 510, (X(I), I = 1, N)

500     FORMAT (1X, /A, 1X, "VECTOR:")
510     FORMAT (100(1X, F6.3))
520     FORMAT (1X, /A, 1X, "MATRIX:")
      END
