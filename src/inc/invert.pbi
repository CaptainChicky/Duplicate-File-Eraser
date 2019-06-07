Procedure Invert()
  
  c=CountGadgetItems(#results)
  
For a=0 To c-1
  
If GetGadgetItemState(#results,a) = #PB_ListIcon_Checked
  
  SetGadgetItemState(#results,a,0)
  
Else
  
  SetGadgetItemState(#results,a,#PB_ListIcon_Checked)
  
EndIf
  
Next
 
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP