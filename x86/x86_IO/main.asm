.386
.MODEL flat, stdcall
.stack 1024

 STD_INPUT_HANDLE  EQU -10
 STD_OUTPUT_HANDLE EQU -11
 STD_ERROR_HANDLE  EQU -12

 GetStdHandle PROTO, nStdHandle: DWORD
 WriteConsoleA PROTO, handle: DWORD, lpBuffer:PTR BYTE, nNumberOfBytesToWrite:DWORD, lpNumberOfBytesWritten:PTR DWORD, lpReserved:DWORD
 ReadConsoleA PROTO,  handle: DWORD, lpBuffer:PTR BYTE, nNumberOfBytesToRead:DWORD, lpNumberOfCharsRead:PTR DWORD, pInputControl:DWORD
 ExitProcess PROTO, dwExitCode: DWORD 

 .data
 consoleOutHandler dd ?
 consoleInHandler  dd ?

 msg	db "Hello World",13,10,0	;\r\n
 buffer db	128 DUP(?)
 bytes	dd ? 

 .code
 main PROC
  ;get output handler
  INVOKE GetStdHandle, STD_OUTPUT_HANDLE
  mov consoleOutHandler, eax
  
  ;get input handler
  INVOKE GetStdHandle, STD_INPUT_HANDLE
  mov consoleInHandler, eax

  ;output
  INVOKE WriteConsoleA, consoleOutHandler, offset msg, lengthof msg, offset bytes, 0
  
  ;input
  INVOKE ReadConsoleA, consoleInHandler, offset buffer, lengthof buffer, offset bytes, 0
  
  ;echo
  INVOKE WriteConsoleA, consoleOutHandler, offset buffer, [bytes], offset bytes, 0

  INVOKE ExitProcess,0 
 main ENDP

END main