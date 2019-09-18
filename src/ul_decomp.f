C     UL Matrix decomposition
      PROGRAM UL_DECOMP
        REAL FACT, P
C        DIMENSION FACT(3,3)
        DATA FACT, P /10.25, 0.1/

        FACT = FACT + P

        PRINT *, "UL-DECOMP", FACT, P
      END
