!macro stabilize {

 lda #<WedgeIRQ
    sta $fffe
    lda #>WedgeIRQ
    sta $ffff

    inc $d012

    lda #$01
    sta $d019

    tsx

    cli

    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

WedgeIRQ

    txs

    ldx #$08   
    dex        
    bne *-1    
    bit $00   
               

    lda $d012
    cmp $d012 

    beq *+2
}