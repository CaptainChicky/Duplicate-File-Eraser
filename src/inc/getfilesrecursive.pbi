Procedure.s GetFilesRecursive(directory.s , directoryid)
  
  directory=AddBackslash(directory)
  
If ExamineDirectory(directoryid,directory,"*.*")

  dirid=NextDirectoryEntry(directoryid)

While dirid
  
If Kill()=1
  FinishDirectory(directoryid)
  ProcedureReturn
EndIf
  
  dirtype = DirectoryEntryType(directoryid)

Select dirtype

Case #PB_DirectoryEntry_File

  e$=directory+DirectoryEntryName(directoryid)
  
  AddFSMapItem(e$)
  
Case #PB_DirectoryEntry_Directory

If DirectoryEntryName(directoryid)<>"." And DirectoryEntryName(directoryid)<>".."     
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  GetFilesRecursive(directory+DirectoryEntryName(directoryid)+"\", directoryid+1)  
CompilerElse
  GetFilesRecursive(directory+DirectoryEntryName(directoryid)+"/", directoryid+1)  
CompilerEndIf
    
EndIf

EndSelect

  dirid=NextDirectoryEntry(directoryid)

Wend

EndIf

  ProcedureReturn ""

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP