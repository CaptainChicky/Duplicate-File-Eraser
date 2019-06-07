Procedure Move(cp=0)
  
If cp=1
  
ForEach ToMove()
  
  key$=MapKey(ToMove())
  
If CopyFile(key$,destinationpath$+GetFilePart(key$))=0
  
  ToMove(key$)=0
  errmove$=errmove$+key$+Chr(10)
  
EndIf

  citem+1
  
Next
  
Else
  
ForEach ToMove()
  
  key$=MapKey(ToMove())
  
If RenameFile(key$,destinationpath$+GetFilePart(key$))=0
  
  ToMove(key$)=0
  errmove$=errmove$+key$+Chr(10)
  
EndIf

  citem+1
  
Next

EndIf

  destinationpath$=""
  
  ProcedureReturn 1

EndProcedure
Procedure Status(cp=0)
  
If cp=1
  
  t$=copying$
  
Else
  
  t$=moving$
 
EndIf
  
If OpenWindow(#windowstatusmove,0,0,200,50,t$,#PB_Window_WindowCentered|#PB_Window_SystemMenu|#PB_Window_MinimizeGadget,WindowID(#windowresults))
  
  s=MapSize(ToMove())
  pb=ProgressBarGadget(#PB_Any,10,10,180,20,0,s)
  AddWindowTimer(#windowstatusmove,0,50)
  
  citem=0
  t=CreateThread(@Move(),cp)
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_CloseWindow
  
  CloseWindow(#windowstatusmove)
  KillThread(t)
  
  ProcedureReturn -1
  
Case #PB_Event_Timer
  
  SetGadgetState(pb, citem)
  
If IsThread(t)=0
  
  CloseWindow(#windowstatusmove)
  Break
  
EndIf
    
EndSelect
    
ForEver
    
  
EndIf
  
  destinationpath$=""
  citem=0
  
  ProcedureReturn
  
EndProcedure
Procedure MoveDuplicates(cp=0)
  
  Static lastpath$
  
  c=CountGadgetItems(#results)
  
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

If cp=1
  
  q$=questioncopy$
  errtitle$=errcopyfile$
  
Else
  
  q$=questionmove$
  errtitle$=errmovefile$
  
EndIf

  errmove$=""
  p$ = PathRequester(choosedestination$,lastpath$)
  
If p$
  
  lastpath$=p$
  
Else
  ProcedureReturn
EndIf

  p$=AddBackslash(p$)
  
      
If c>0
  
  NewList R.items()
 
For a=0 To c-1
  
  i$ = GetGadgetItemText(#results,a,1)
  
  
If GetGadgetItemState(#results,a) => #PB_ListIcon_Checked

  ToMove(i$)=1
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

  destinationpath$=p$
  

If d=1
  
If MessageRequester("",q$,#PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
  
If Status(cp) = -1
  
  FreeList(R())
  ClearMap(ToMove())
  
  ProcedureReturn -1
  
EndIf

Else
  
  FreeList(R())
  ClearMap(ToMove())
  ProcedureReturn
  
EndIf
  
EndIf

If cp<>1

  ClearGadgetItems(#results)
  
  SortStructuredList(R(),#PB_Sort_Ascending,OffsetOf(items\group), TypeOf(items\group))
  
ForEach R()
  
  key$=R()\name
  
If ToMove(key$)<>1
  
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

EndIf

  FreeList(R())
  ClearMap(ToMove())

EndIf

If errmove$<>""
  MessageRequester(errtitle$,errmove$,#PB_MessageRequester_Error)
EndIf

  errmove$=""

  ProcedureReturn

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 5
; EnableXP