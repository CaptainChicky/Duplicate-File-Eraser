Procedure IsFolder(name$)
  
If ExamineDirectory(0,name$,"*.*")
  FinishDirectory(0)
  r=1
EndIf

  ProcedureReturn r

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP