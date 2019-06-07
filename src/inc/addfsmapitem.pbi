Procedure AddFSMapItem(e$)
  
  Files(e$)\name=e$
  fs=FileSize(e$)
  Files(e$)\size=fs
  c=FileSizes(Str(fs))
  FileSizes(Str(fs))=c+1
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP