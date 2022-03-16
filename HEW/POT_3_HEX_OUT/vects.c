/***********************************************************************/
/*                                                                     */
/*  FILE        :vects.c                                               */
/*  DATE        :Mon, Mar 14, 2022                                     */
/*  DESCRIPTION :Vector Table                                          */
/*  CPU TYPE    :H8S/Other                                             */
/*                                                                     */
/*  This file is generated by KPIT GNU Project Generator.              */
/*                                                                     */
/***********************************************************************/
     




extern void start(void);
extern void stack (void);

#define VECT_SECT          __attribute__ ((section (".vects")))
const void *HardwareVectors[] VECT_SECT  = {
//;<<VECTOR DATA START (POWER ON RESET)>>
//;0 Power On Reset PC
start
};
