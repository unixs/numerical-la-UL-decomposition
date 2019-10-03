      SUBROUTINE UL_DECOMP(DIM, A, B, L, U, Y, X)
        INTEGER DIM
        REAL A, B, U, L, Y, X
        DIMENSION A(DIM,DIM), B(DIM),
     &    U(DIM,DIM), L(DIM,DIM), Y(DIM), X(DIM)

        DO 10 I = 1, DIM
C         Fill L matrix diag with 1
          L(I, I) = 1
C         Fill U matrix first row
          U(1, I) = A(1, I)

C         Fill L matrix first column
          IF (I.GT.1)
     &      L(I, 1) = A(I, 1) / U(1, 1)
10      CONTINUE

        DO 50 I = 2, DIM
          DO 40 J = I, DIM

C           Fill U row cell by cell
            S = 0
            DO 20 K = 1, I - 1
              S = S + L(I, K) * U(K, J)
20          CONTINUE
            U(I, J) = A(I, J) - S

C           Fill L column cell by cell & use previously calculated cell
            IF (J.GT.I) THEN
              S = 0
              DO 30 K = 1, I - 1
                S = S + L(J, K) * U(K, I)
30            CONTINUE
              L(J, I) = (1 / U(I, I)) * (A(J, I) - S)
            END IF

40        CONTINUE
50      CONTINUE

C       y: Ly = b
        DO 70 I = 1, DIM
          S = 0
          DO 60 K = 1, I - 1
            S = S + L(I, K) * Y(K)
60        CONTINUE

          Y(I) = B(I) - S
70      CONTINUE

C       x: Ux = y
        DO 90 I = DIM, 1, -1
          S = 0
          DO 80 K = 1, I - 1
            S = S + U(I, K) * X(K)
80        CONTINUE

          X(I) = Y(I) - S
90      CONTINUE
      END
