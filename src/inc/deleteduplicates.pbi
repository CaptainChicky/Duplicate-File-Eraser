Procedure DeleteDuplicates()
  
  c=CountGadgetItems(#results)
  
If c>0
  
For a=0 To c-1
        
If GetGadgetItemState(#results,a) => #PB_ListIcon_Checked
  yes=1
  Break
EndIf

Next

If yes<>1
  MessageRequester("",nothingselected$)
  ProcedureReturn
EndIf
  
  
  NewMap ToDelete()
  NewList R.items()
 
For a=0 To c-1
  
  i$ = GetGadgetItemText(#results,a,1)
  
  
If GetGadgetItemState(#results,a) => #PB_ListIcon_Checked

  ToDelete(i$)=1
  d=1
 
EndIf

  AddElement(R())
  R()\group=Val(GetGadgetItemText(#results,a,0))
  R()\name=i$
  R()\size=GetGadgetItemText(#results,a,2)
  R()\md5=GetGadgetItemText(#results,a,3)
  R()\sha1=GetGadgetItemText(#results,a,4)
  R()\crc32=GetGadgetItemText(#results,a,5)

Next

If d=1
  
If MessageRequester("",questiondelete$,#PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
  
  pw=OpenWindow(#PB_Any,0,0,200,50,pleasewait$,#PB_Window_WindowCentered|#PB_Window_BorderLess,WindowID(#windowresults))
  
ForEach ToDelete()
  
  WindowEvent()
  
  key$=MapKey(ToDelete())
  
If DeleteFile(key$)=0
  ToDelete(key$)=0
  errdel$=errdel$+key$+Chr(10)
EndIf
  
  
Next

  CloseWindow(pw)
  
Else
  
  FreeList(R())
  FreeMap(ToDelete())
      
  ProcedureReturn
  
EndIf
  
EndIf

  ClearGadgetItems(#results)
  
  SortStructuredList(R(),#PB_Sort_Ascending,OffsetOf(items\group), TypeOf(items\group))
  
ForEach R()
  
  key$=R()\name
  
If ToDelete(key$)<>1
  
  AddGadgetItem(#results,-1,"")
  
  p=CountGadgetItems(#results)-1
    
  SetGadgetItemText(#results,p,Str(r()\group),0)
  SetGadgetItemText(#results,p,R()\name,1)
  SetGadgetItemText(#results,p,R()\size,2)
  SetGadgetItemText(#results,p,R()\md5,3)
  SetGadgetItemText(#results,p,R()\sha1,4)
  SetGadgetItemText(#results,p,R()\crc32,5)
  
EndIf
  
Next

  FreeList(R())
  FreeMap(ToDelete())

EndIf

If errdel$<>""
  MessageRequester(errdelfile$,errdel$,#PB_MessageRequester_Error)
EndIf
  
ProcedureReturn

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP