Procedure GetFiles(directory.s)
  
  directory=AddBackslash(directory)
  
If ExamineDirectory(0, directory, "*.*")  

While NextDirectoryEntry(0)
  
If Kill()=1
  FinishDirectory(0)
  ProcedureReturn
EndIf
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  e$ = directory+DirectoryEntryName(0)
  
  AddFSMapItem(e$)
  
EndIf

Wend

  FinishDirectory(0)

EndIf

  ProcedureReturn 1

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP