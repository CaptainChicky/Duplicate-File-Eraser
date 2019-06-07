Procedure SelectDuplicates()
  
  c=CountGadgetItems(#results)
  
For a=0 To c-1
  
  g$=GetGadgetItemText(#results,a,0)
  
If Selected(g$)=1
  SetGadgetItemState(#results,a,#PB_ListIcon_Checked)
Else
  SetGadgetItemState(#results,a,0)
  Selected(g$)=1
EndIf
    
Next

  ClearMap(Selected())

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP