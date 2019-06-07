Procedure ExportCSV()

  Static deffile$
  
  c=CountGadgetItems(#results)
  
If c<1
  ProcedureReturn
EndIf

  f$ = SaveFileRequester(saveas$,deffile$,patterncsv$,0)

If f$
  
If LCase(GetExtensionPart(f$))<>csv$
  
  f$=f$ + "." + csv$
  
If CreateFile(0,f$)
      
  WriteString(0, GetGadgetItemText(#results,-1,0) + "," )
  WriteString(0, GetGadgetItemText(#results,-1,1) + "," )
  WriteString(0, GetGadgetItemText(#results,-1,2) + "," )
  WriteString(0, GetGadgetItemText(#results,-1,3) + "," )
  WriteString(0, GetGadgetItemText(#results,-1,4) + "," )
  WriteStringN(0, GetGadgetItemText(#results,-1,5) )
  
  GetGadgetItemText(#results,-1,0)
  
  
  
For a=0 To c-1
  
  WriteString(0,Chr(34)+GetGadgetItemText(#results,a,0)+Chr(34)+",")
  WriteString(0,Chr(34)+GetGadgetItemText(#results,a,1)+Chr(34)+",")
  WriteString(0,Chr(34)+GetGadgetItemText(#results,a,2)+Chr(34)+",")
  WriteString(0,Chr(34)+GetGadgetItemText(#results,a,3)+Chr(34)+",")
  WriteString(0,Chr(34)+GetGadgetItemText(#results,a,4)+Chr(34)+",")
  WriteStringN(0,Chr(34)+GetGadgetItemText(#results,a,5)+Chr(34))
    
Next
  
  CloseFile(0)
  MessageRequester("",filesaved$)
    
Else
  
  MessageRequester(error$,errfile$,#PB_MessageRequester_Error)
  
EndIf
  
EndIf
  
  deffile$=f$
  
EndIf
      
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP