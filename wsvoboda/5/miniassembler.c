/*--------------------------------------------------------------------*/
/* miniassembler.c                                                    */
/* Author: Bob Dondero and William Svoboda and Will Drury             */
/*--------------------------------------------------------------------*/

#include "miniassembler.h"

/*--------------------------------------------------------------------*/

unsigned int MiniAssembler_adr(unsigned int uiReg, unsigned long ulAddr,
   unsigned long ulAddrOfThisInstr)
{
   unsigned int uiInstr;
   unsigned int uiDisp;
   unsigned int uiDispLo;
   unsigned int uiDispHi;
         
   uiInstr = 0x10000000;
   
   uiInstr |= uiReg;
    
   uiDisp = (unsigned int)(ulAddr - ulAddrOfThisInstr);

   uiDispLo = uiDisp & 0x3;
   uiDispLo = uiDispLo << 29;
   uiInstr |= uiDispLo;
   
   uiDispHi = uiDisp >> 2;
   uiDispHi = uiDispHi << 5;
   uiDispHi &= 0x00ffffe0;
   uiInstr |= uiDispHi;
   
   return uiInstr;
}

unsigned int MiniAssembler_mov(unsigned int uiReg, unsigned int uiImmed)
{
   unsigned int uiInstr;
   unsigned int uiImmShift;

   /* 0 (omitted) 10 100101 00 0000000000000000 00000 */
   uiInstr = 0x52800000;
   
   uiInstr |= uiReg; /* last five bits of uiInstr contain uiReg */

   uiImmShift = uiImmed << 5; /* shift left by 5 bits because of Rd */
   uiImmShift &= 0x1FFFE0; /* isolates middle 16 bits */
   uiInstr |= uiImmShift;   

   return uiInstr;
}

unsigned int MiniAssembler_strb(unsigned int uiFromReg,
                                unsigned int uiToReg)
{
   unsigned int uiInstr;
   unsigned int uiToShift;
   
   /* We are using the unsigned offset variant of STRB  */
   /* 00 (omitted) 111 0 01 00 000000000000 00000 00000 */
   uiInstr = 0x39000000;

   uiInstr |= uiFromReg; /* last five bits of uiInstr contain uiToReg */

   uiToShift = uiToReg << 5; /* shift left by 5 bits due to Rt */
   uiToShift &= 0x3E0; /* isolates 5 bits of Rn  */
   uiInstr |= uiToShift;
   
   return uiInstr;
}

unsigned int MiniAssembler_b(unsigned long ulAddr,
                             unsigned long ulAddrOfThisInstr)
{
   unsigned int uiInstr;
   unsigned int uiDisp;

   /* 0 (omitted) 00(omitted)101 00000000000000000000000000 */
   uiInstr = 0x14000000;

   uiDisp = (unsigned int)(ulAddr - ulAddrOfThisInstr);
   uiDisp = uiDisp >> 2;
   uiDisp &= 0x3FFFFFF;
   uiInstr |= uiDisp; /* last 26 bits of contain PC-relative offset */

   return uiInstr;
}
