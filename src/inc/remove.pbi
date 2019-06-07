Macro Remove()

  c=CountGadgetItems(#items)
  
If c > 0
  
For a = 0 To c-1
  
  t$=GetGadgetItemText(#items,a)
  
If GetGadgetItemState(#items,a)=0
  
  t$=GetGadgetItemText(#items,a)
  AddElement(Keep())
  Keep()=t$
  
EndIf
  
Next

  ClearMap(Liste())
  ClearGadgetItems(#items) 


ForEach Keep()
  
  AddFileToList(Keep())
  
Next

EndIf

  ClearList(Keep())
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP