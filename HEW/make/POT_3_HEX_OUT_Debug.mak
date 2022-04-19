################################################
# Make file generated by HEW
#

############################
# Toolchain directory define
# If incorrect, change to the location of the KPIT GNUH8 [ELF] Toolchain toolchain
TC_INSTALL_DIR = c:\program files (x86)\renesas\hew\tools\kpit cummins\gnuh8-elf\v11.02

#####################################################
#
# Details:
#   Project: POT_3_HEX_OUT
#   Configuration: Debug
#   Toolchain: KPIT GNUH8 [ELF] Toolchain
#
#####################################################

################
# Main Defines

# GNU Library Generator01 phase

POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_EXE=h8300-elf-libgen-wrapper.exe
POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_OUTFILESC0="..\POT_3_HEX_OUT\Debug\libPOT_3_HEX_OUT.a"

# GNU Compiler02 phase

POT_3_HEX_OUT_DEBUG_COMPILER02_EXE=h8300-elf-gcc-wrapper.exe
POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC0="..\POT_3_HEX_OUT\Debug\main.o"
POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC1="..\POT_3_HEX_OUT\Debug\vects.o"

# GNU Assembler03 phase

POT_3_HEX_OUT_DEBUG_ASSEMBLER03_EXE=h8300-elf-as-wrapper.exe

# GNU Linker04 phase

POT_3_HEX_OUT_DEBUG_LINKER04_EXE=h8300-elf-ld-wrapper.exe
POT_3_HEX_OUT_DEBUG_LINKER04_INFILESC0="..\POT_3_HEX_OUT\Debug\main.o" "..\POT_3_HEX_OUT\Debug\vects.o"
POT_3_HEX_OUT_DEBUG_LINKER04_OUTFILESC0="..\POT_3_HEX_OUT\Debug\POT_3_HEX_OUT.x"

#######################
# nmake "all" statement

ALL:	POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_ENVC0 \
	$(POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_OUTFILESC0) \
	$(POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC0) \
	$(POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC1) \
	$(POT_3_HEX_OUT_DEBUG_LINKER04_OUTFILESC0)

####################
# Description blocks

!MESSAGE
!MESSAGE Executing GNU Library Generator01 phase
!MESSAGE

POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_ENVC0 : 
	set TARGET_LIB=$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\lib
	set MAKE_MODE=unix
	set PATH=$(TC_INSTALL_DIR)\h8300-elf\bin;$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\bin;$(TC_INSTALL_DIR)\h8300-elf\libexec\gcc\h8300-elf\4.5-GNUH8_v11.02;C:\Windows\SysWOW64\
	set TARGET_M2_LIB=$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\lib\
	set LIB_TARGET_INCLUDE=$(TC_INSTALL_DIR)\h8300-elf\lib\gcc\h8300-elf\4.5-GNUH8_v11.02\include
	set TARGET_INCLUDE=$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\include
	set LIB_M2_LIB=$(TC_INSTALL_DIR)\h8300-elf\lib\gcc\h8300-elf\4.5-GNUH8_v11.02\
	set INCLUDE=$(TC_INSTALL_DIR)\h8300-elf\include

$(POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_OUTFILESC0) : 
	"$(EXEDIR)\$(POT_3_HEX_OUT_DEBUG_LIBRARY_GENERATOR01_EXE)" -subcommand=<<
--compiler-options=-ms,-ms2600,-Os,-fdata-sections,-ffunction-sections,-falign-jumps,-fno-function-cse,-funit-at-a-time
--output="..\POT_3_HEX_OUT\Debug\libPOT_3_HEX_OUT.a"
--select-lib=optlib
--header-files=stdio,stdlib,string
<<

!MESSAGE
!MESSAGE Executing GNU Compiler02 phase
!MESSAGE

$(POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC0) : "..\POT_3_HEX_OUT\main.asm"
	"$(EXEDIR)\$(POT_3_HEX_OUT_DEBUG_COMPILER02_EXE)" -subcommand=<<
-ms -ms2600
-I "$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\optlibinc"
-I "$(TC_INSTALL_DIR)\h8300-elf\lib\gcc\h8300-elf\4.5-GNUH8_v11.02\optlibinc"
-D DEBUG
-g
-g2
-o "..\POT_3_HEX_OUT\Debug\main.o"
-nostdinc
"..\POT_3_HEX_OUT\main.asm"
-Wa,-gdwarf2
<<

$(POT_3_HEX_OUT_DEBUG_COMPILER02_OUTFILESC1) : "..\POT_3_HEX_OUT\vects.c"
	"$(EXEDIR)\$(POT_3_HEX_OUT_DEBUG_COMPILER02_EXE)" -subcommand=<<
-ms -ms2600
-I "$(TC_INSTALL_DIR)\h8300-elf\h8300-elf\optlibinc"
-I "$(TC_INSTALL_DIR)\h8300-elf\lib\gcc\h8300-elf\4.5-GNUH8_v11.02\optlibinc"
-D DEBUG
-g
-g2
-o "..\POT_3_HEX_OUT\Debug\vects.o"
-nostdinc
"..\POT_3_HEX_OUT\vects.c"
<<

!MESSAGE
!MESSAGE Executing GNU Linker04 phase
!MESSAGE

$(POT_3_HEX_OUT_DEBUG_LINKER04_OUTFILESC0) : $(POT_3_HEX_OUT_DEBUG_LINKER04_INFILESC0)
	"$(EXEDIR)\$(POT_3_HEX_OUT_DEBUG_LINKER04_EXE)" -subcommand=<<
noprelink
list "..\POT_3_HEX_OUT\Debug\POT_3_HEX_OUT.map"
nologo
"..\POT_3_HEX_OUT\Debug\main.o"
"..\POT_3_HEX_OUT\Debug\vects.o"
-l "libPOT_3_HEX_OUT.a"
-l "libgcc.a"
output "..\POT_3_HEX_OUT\Debug\POT_3_HEX_OUT.x"
-e _start
<<

