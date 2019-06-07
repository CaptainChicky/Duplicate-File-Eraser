Procedure OpenURL(url$)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Linux
 RunProgram("xdg-open",url$,"") 
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
 RunProgram("open",url$,"") 
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
 RunProgram(url$)
CompilerEndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP