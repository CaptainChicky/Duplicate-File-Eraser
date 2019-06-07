Procedure ImportCSV()
  
  Static deffile$
  
  f$ = OpenFileRequester(loadfile$,deffile$,patterncsv$,0)
  
If f$
  
If ReadFile(0,f$)
  
  s$ = ReadString(0)
  
Repeat
  
  s$ = ReadString(0)
    
If CountString(s$,",") <> 5 Or  CountString(s$,Chr(34)) <> 12
  
  CloseFile(0)
    
  ProcedureReturn -1
  
EndIf
  
Until Eof(0)

  FileSeek(0,0)
  
  ClearGadgetItems(#results)
  ReadString(0)
    
Repeat
  
  s$=ReadString(0)
  
  AddGadgetItem(#results,a,RemoveString(StringField(s$,1,","),Chr(34)))
  
For b=0 To 5
  SetGadgetItemText(#results,a,RemoveString(StringField(s$,b+1,","),Chr(34)),b)
Next
  
  a+1
  
Until Eof(0)  
  
  CloseFile(0)
  
Else
  
  MessageRequester(error$,errfiler$,#PB_MessageRequester_Error)
    
EndIf
  
  deffile$=f$
  
Else
  
  ProcedureReturn -2
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP