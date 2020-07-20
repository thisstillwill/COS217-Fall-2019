/*--------------------------------------------------------------------*/
/* miniassembler.h                                                    */
/* Author: Bob Dondero                                                */
/*--------------------------------------------------------------------*/

#ifndef MINIASSEMBLER_INCLUDED
#define MINIASSEMBLER_INCLUDED

/*--------------------------------------------------------------------*/

/* Return the machine language equivalent of "mov reg, immed" where
   reg is a W register.
   
   Parameters:
      uiReg: the number of reg.
      uiImmed: the immed value. */
   
unsigned int MiniAssembler_mov(unsigned int uiReg,
   unsigned int uiImmed);

/*--------------------------------------------------------------------*/

/* Return the machine language equivalent of "adr reg, addr". 

   Parameters:
      uiReg: the number of reg.
      ulAddr: the address denoted by addr.
      ulAddrOfThisInstr: the address of the adr instruction itself. */

unsigned int MiniAssembler_adr(unsigned int uiReg, unsigned long ulAddr,
   unsigned long ulAddrOfThisInstr);

/*--------------------------------------------------------------------*/

/* Return the machine language equivalent of "strb fromreg,[toreg]", 
   where fromreg is a W register and toreg is a X register.

   Parameters:
      uiFromReg: the number of fromreg.
      uiToReg: the number of toreg. */

unsigned int MiniAssembler_strb(unsigned int uiFromReg,
   unsigned int uiToReg);

/*--------------------------------------------------------------------*/

/* Return the machine language equivalent of "b addr". 
   
   Parameters:
      ulAddr: the address denoted by addr, that is, the address to
         which the branch should occur.
      ulAddrOfThisInstr: the address of the b instruction itself. */

unsigned int MiniAssembler_b(unsigned long ulAddr,
   unsigned long ulAddrOfThisInstr);

#endif
