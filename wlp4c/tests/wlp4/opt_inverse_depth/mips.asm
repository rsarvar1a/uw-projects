 
 
 
; ;;;;;;;;;;;;;;;;;;;;;;;; ;
;                          ;
;           wain           ;
;                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;; ;
 
 
Fwain:
 
;              ;
;  begin pre   ;
;              ;
 
; begin conventions
 
; special registers for procedures
 
 ; ease-of-use values 1 and 4
lis $4 ; $4 contains 4
.word 4
 
lis $8 ; $8 contains 8 - good stack bump tradeoff!
.word 8
 
lis $11 ; 11 contains 1
.word 1
 
sw $1, -4($30) ; save reg state, allowing $1 to be scratch
sw $2, -8($30) ; save reg state, allowing $2 to be scratch
sub $30, $30, $8 ; making space for original registers
sub $30, $30, $8 ; making space for parameters
 
sub $29, $30, $4
 
add $3, $0, $0
add $5, $0, $0
sub $30, $30, $5
 
 
sw $1, 8($29) ; location of wain's first 'argument'
sw $2, 4($29) ; location of wain's second 'argument'
 
;              ;
;  begin body  ;
;              ;
 
lw $5, 8($29)
; wrote direct in op, removed guard
; optimized out push, wrote to 5 instead
; 
lw $3, 4($29)
; no-oped
; optimized out pop, wrote to 5 instead
; 
add $5, $5, $3
; wrote direct in op, removed guard
; optimized out push, wrote to 5 instead
; 
lw $3, 8($29)
; no-oped
; optimized out pop, wrote to 5 instead
; 
sub $6, $5, $3
; wrote direct in op, removed guard
; optimized out push, wrote to 6 instead
; 
lw $3, 4($29)
; no-oped
sub $3, $0, $0
; no-oped
; optimized out pop, wrote to 6 instead
; 
add $3, $6, $3
; no-oped
 
;              ;
;  begin epi   ;
;              ;
 
 
add $5, $0, $0
add $30, $30, $5
 
 
add $30, $30, $8
add $30, $30, $8
lw $2, -8($30) ; restoring initial $2
lw $1, -4($30) ; restoring initial $1
add $29, $30, $0 ; restore frame pointer
 
jr $31
