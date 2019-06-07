Procedure AddToList()
      
  files$ = OpenFileRequester(addfile$,"","*.*",0,#PB_Requester_MultiSelection)
  
If files$
  
  AddFileToList(files$)
  
While files$ 
  
  files$ = NextSelectedFileName()
  
  AddFileToList(files$)
  
Wend 

EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP