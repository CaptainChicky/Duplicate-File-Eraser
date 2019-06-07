Procedure Text_Height(text$)
  
  StartDrawing(ImageOutput(image)) 
  DrawingFont(#PB_Default) 
  h=TextHeight(text$)
  StopDrawing()
  
  ProcedureReturn h

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP