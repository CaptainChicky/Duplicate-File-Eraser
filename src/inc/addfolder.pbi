Procedure AddFolder()
      
  path$ = PathRequester(addfolder$,"")
  
If path$
    
If Liste(path$)=0
  
  AddGadgetItem(#items,-1,path$)
  Liste(path$)=1
  
EndIf

EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP