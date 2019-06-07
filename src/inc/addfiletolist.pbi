Procedure AddFileToList(filename$)
  
If FileExists(filename$) Or IsFolder(filename$)
  
If Liste(filename$)=0 And Trim(filename$)<>""
  
  AddGadgetItem(#items,-1,filename$)
  Liste(filename$)=1
  
EndIf

EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = -
; EnableXP