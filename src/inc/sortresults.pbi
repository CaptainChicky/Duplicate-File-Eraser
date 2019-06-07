Procedure SortResults()
  
NewMap MD5()
  
ForEach Files()
  
  k$=Files()\md5 + Files()\sha1 + Files()\crc32
  
If Files()\md5 <> ""
  
  v=MD5(k$)
  
  MD5(k$)=v+1
  
EndIf
  
Next

  g=1

ForEach MD5()
  
If MD5()>1
  
  MD5()=g
  g+1
  
Else
  
  MD5()=-1
  
EndIf
  
Next

ForEach Files()
  
If MD5(Files()\md5 + Files()\sha1 + Files()\crc32)<>-1  And Files()\md5 <> ""
  
  AddElement(Results())
    
  Results()\group=MD5(Files()\md5 + Files()\sha1 + Files()\crc32)
  Results()\name=Files()\name
  Results()\size=Files()\size
  Results()\md5=Files()\md5
  Results()\sha1=Files()\sha1
  Results()\crc32=Files()\crc32
  
EndIf
  
Next

  ClearMap(Files())
  
If ListSize(Results())<2
  
  ClearList(Results())
  ClearMap(Selected())
  FreeMap(MD5())
  HideWindow(#window,0)
  MessageRequester("",noduplicatesfound$)

  ProcedureReturn -1
  
EndIf
    
  SortStructuredList(Results(),#PB_Sort_Ascending,OffsetOf(File\group),TypeOf(File\group))
  FreeMap(MD5())
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = -
; EnableXP