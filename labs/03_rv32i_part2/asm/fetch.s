# ORI DOESN'T WORK
; addi x1, x0, 1  # x1 = 1
; addi x2, x1, 2  # x2 = 3
; xori x3, x0, 3  # x3 = 3 / 011
; xori x4, x2, 3  # x4 = 0 / 000
; ori x5, x3, 1   # x5 = 3 / 011

; ; # slli WORKS WHEN COMMENTING ori/andi
; addi x1, x0, 1      # x1 = 1
; addi x2, x1, 2      # x2 = 3
; addi x3, x2, 3      # x3 = 6
; addi x15, x0, 2047

; xori x4, x2, 3      # x4 = 000
; ori x5, x2, 3       # x5 = 011
; andi x6, x2, 2      # x6 = 010
; slli x7, x6, 1      # x7 = 100
; srli x8, x15, 1     # x8 = 001
; srai x9, x15, 1     # x9 = 001 ????????????
; slti x10, x2, 4     # x9 = 1
; slti x11, x2, 2     # x10 = 0 
; sltiu x12, x2, 2    # x11 = 0 

# R-TYPES
addi x1, x0, 10
addi x2, x1, 10
add x3, x2, x1
sub x4, x3, x1
xor x5, x4, x2      # 10100 (20) ^ 10100 (20) = 00000 (0)
xor x6, x2, x1      # 01010 (10) ^ 10100 (20) = 11110 (30)

addi x7, x0, 3
addi x8, x0, 1
or x9, x8, x7       # 011 (3) | 001 (1) = 011 (3)
and x10, x8, x7     # 011 (3) | 001 (1) = 001 (1)

sll x11, x7, x8     # 011 (3) << 001 (1) = 110 (6)
srl x12, x7, x8     # 011 (3) >> 001 (1) = 001 (1)
sra x13, x8, x7     # 011 (3) >> 001 (1) = 001 (1)

slt x14, x8, x7     # 011 (3) > 001 (1) = 001 (1)
slt x15, x7, x8     # 011 (3) < 001 (1) = 000 (0)

; sltu x16, x8, x7     # 011 (3) > 001 (1) = 001 (1)
; addi x8, x8, 2
; sltu x17, x8, x7     # 011 (3) > 011 (3) = 000 (0)