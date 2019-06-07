Procedure.s AddBackslash(string$)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  t$="\"
CompilerElse
  t$="/"
CompilerEndIf
  
  s$=Right(string$,1)
  
If s$<>t$
  string$=string$+t$
EndIf

  ProcedureReturn string$

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP