      SUBROUTINE MATR2_SWAP_ROWS(IDIM, JDIM, MATRIX, IS, IT)
        REAL MATRIX, VMAX
        DIMENSION MATRIX(IDIM, JDIM)

        DO 10 J = 1, JDIM
          TMP = MATRIX(TS, J)
          MATRIX(IT, J) = MATRIX(IS, J)
          MATRIX(IS, J) = TMP
10      CONTINUE
      END

      FUNCTION VECTOR_MAX(VECTOR, SIZE, IDX)
        INTEGER SIZE
        DIMENSION VECTOR(SIZE)

        DO 20 I = 1, SIZE
          IF (I.EQ.1) THEN
            VECTOR_MAX = VECTOR(I)
            IDX = I
          ELSE
            IF (VECTOR(I).GT.VECTOR_MAX) THEN
              IDX = I
              VECTOR_MAX = VECTOR(I)
            END IF
          END IF
20      CONTINUE
      END
