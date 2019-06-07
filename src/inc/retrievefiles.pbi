Procedure RetrieveFiles(var=0)
  
If ReadSettings(setsubdir$,zero$) = one$
  
ForEach Liste()
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Liste())
    
If IsFolder(e$)
  
  GetFilesRecursive(e$,0)
  
Else
  
  AddFSMapItem(e$)
  
EndIf
  
Next
  
Else
  
ForEach Liste()
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Liste())
  
If IsFolder(e$)
  
  GetFiles(e$)
  
Else
  
  AddFSMapItem(e$)
  
EndIf
  
Next
  
EndIf

  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP