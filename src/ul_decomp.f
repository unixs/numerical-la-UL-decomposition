C     UL Matrix decomposition
      PROGRAM UL_DECOMP
        REAL FACT, P
C        DIMENSION FACT(3,3)
        DATA FACT, P /10.25, .1/

        FACT = FACT + P

        PRINT 100, "UL-DECOMP", FACT, P
100     FORMAT (1X, A, 1X, 2F15.12)
      END
