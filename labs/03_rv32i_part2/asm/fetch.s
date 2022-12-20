# I_TYPES
; addi x1, x0, 1      # x1 = 1
; addi x2, x1, 2      # x2 = 3
; addi x3, x2, 3      # x3 = 6
; addi x15, x0, 2047

; xori x4, x2, 3      # x4 = 000
; ori x5, x2, 3       # x5 = 011
; andi x6, x2, 2      # x6 = 010
; slli x7, x6, 1      # x7 = 100
; addi x15, x0, -4
; srli x8, x15, 1     # x8 = 001
; srai x9, x15, 1     # x9 = 001 ????????????
; slti x10, x2, 4     # x9 = 1
; slti x11, x2, 2     # x10 = 0 
; sltiu x12, x2, 2    # x11 = 0 


# R-TYPES
; addi x1, x0, 10
; addi x2, x1, 10
; add x3, x2, x1
; sub x4, x3, x1
; xor x5, x4, x2      # 10100 (20) ^ 10100 (20) = 00000 (0)
; xor x6, x2, x1      # 01010 (10) ^ 10100 (20) = 11110 (30)

; addi x7, x0, 3
; addi x8, x0, 1
; or x9, x8, x7       # 011 (3) | 001 (1) = 011 (3)
; and x10, x8, x7     # 011 (3) | 001 (1) = 001 (1)

; sll x11, x7, x8     # 011 (3) << 001 (1) = 110 (6)
; srl x12, x7, x8     # 011 (3) >> 001 (1) = 001 (1)
; sra x13, x8, x7     # 011 (3) >> 001 (1) = 001 (1)

; slt x14, x8, x7     # 011 (3) > 001 (1) = 001 (1)
; slt x15, x7, x8     # 011 (3) < 001 (1) = 000 (0)

; sltu x16, x8, x7     # 011 (3) > 001 (1) = 001 (1)
; addi x8, x8, 2
; sltu x17, x8, x7     # 011 (3) > 011 (3) = 000 (0)


; # L_TYPE, S_TYPE, B_TYPE
; lw x1, 0(zero)
; addi x2, zero, 5
; addi x3, zero, 8
; addi x6, zero, 5
; lw x4, 4(sp)
; lw x5, -4(gp)
; sw x2, 4(gp)
; beq x2, x6, BEQ_WORKS
;     addi x31, x31, 1 # Should never run! 
; BEQ_WORKS: addi x10, x0, 1
;     bne x2, x3, BNE_WORKS
;     addi x30, x30, 1 # Should never run!
; BNE_WORKS: addi x15, x0, 1


# J_TYPE
# Note - call = jal ra, LABEL.
# Note - ret =  jr ra = jalr x0, ra, 0.

# Test sum_4
addi x3, zero, 1 //4
addi x4, zero, 2 //8
addi x5, zero, 3 //12
addi x6, zero, 4 //20
call SUM_4 

addi x10, zero, 10
bne x0, x10, DONE # End the program if the result isn't 10.

# Infinite loop: makes sure we don't accidentally start executing defined functions.
DONE: beq zero, zero, DONE

# Create a few "leaf" functions - functions that don't call any other functions inside them.
# return a0 + a1 + a2 + a3 
SUM_4:
  add x10, x3, x4 # SUM_4: use temporaries, no need to preserve regs.
  add x11, x5, x6
  add x3, x10, x11
  ret