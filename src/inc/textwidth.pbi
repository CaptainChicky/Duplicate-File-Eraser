Procedure Text_Width(text$)
  
  StartDrawing(ImageOutput(image)) 
  DrawingFont(#PB_Default) 
  w=TextWidth(text$)
  StopDrawing()
  
CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
  
  ProcedureReturn w+50
  
CompilerElse
  
  ProcedureReturn w+25
  
CompilerEndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP