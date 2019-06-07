Procedure DisableCommaQuotation(exp)
  
  c=CountGadgetItems(#results)
  
If c>0
  
For a=0 To c-1
  
  f$=GetGadgetItemText(#results,a,1)
  
If FindString(f$,",") Or FindString(f$,Chr(34))
  
  DisableGadget(exp,1)
  ProcedureReturn
  
EndIf
  
Next

  DisableGadget(exp,0)

EndIf

EndProcedure
Procedure Result(skip=0)
  
If skip=0
  SortResults()
  
If ListSize(Results())<1
  ProcedureReturn
EndIf
  
EndIf

  
  HideWindow(#window,1)
  
  ww=wwidth*125/100:wh=wheight*125/100
  
If OpenWindow(#windowresults,0,0,ww,wh,duplicates$,#PB_Window_ScreenCentered|#PB_Window_Invisible|#PB_Window_SystemMenu|#PB_Window_MinimizeGadget)
  
  ListIconGadget(#results,2,2,WindowWidth(#windowresults)-4,WindowHeight(#windowresults)-64, group$, 80, #PB_ListIcon_CheckBoxes|#PB_ListIcon_FullRowSelect)
    
  AddGadgetColumn(#results,1,resfilename$,300)
  
  cw=ww/8
  
  AddGadgetColumn(#results,2,ressize$,cw)
  AddGadgetColumn(#results,3,md5$,cw)
  AddGadgetColumn(#results,4,sha1$,cw)
  AddGadgetColumn(#results,5,crc32$,cw)
  
If skip=0
  
ForEach Results()
  
  AddGadgetItem(#results,-1,"")
  
  p=CountGadgetItems(#results)-1
  
  SetGadgetItemText(#results,p,Str(Results()\group),0)
  SetGadgetItemText(#results,p,Results()\name,1)
  SetGadgetItemText(#results,p,FormatByteSize(Results()\size),2)
  SetGadgetItemText(#results,p,Results()\md5,3)
  SetGadgetItemText(#results,p,Results()\sha1,4)
  SetGadgetItemText(#results,p,Results()\crc32,5)
  
Next

Else
  
  icsv=ImportCSV()
  
If icsv = -1
  
  CloseWindow(#windowresults)
  ClearList(Results()):ClearMap(Selected()):HideWindow(#window,0):SetActiveWindow(#window)  
  MessageRequester(error$,errimport$,#PB_MessageRequester_Error)
  ProcedureReturn
  
ElseIf icsv = -2
  
  CloseWindow(#windowresults)
  ClearList(Results()):ClearMap(Selected()):HideWindow(#window,0):SetActiveWindow(#window)  
  
  ProcedureReturn
  
EndIf
  
EndIf

CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
  y=wh-55
CompilerElse
  y=wh-60
CompilerEndIf
  
  bw=ww/4-2
  bh=25
  
  selectall = ButtonGadget(#PB_Any, 1,y,bw,bh,selectall$)
  deselectall = ButtonGadget(#PB_Any, bw+3,y,bw,bh,deselectall$)
  selectduplicates = ButtonGadget(#PB_Any, bw*2+5,y,bw,bh,selectduplicates$)
  invert = ButtonGadget(#PB_Any, bw*3+7,y,bw,bh,invert$)  
  
  del = ButtonGadget(#PB_Any, GadgetX(selectall),y+30,bw,bh,delete$)  
  copy = ButtonGadget(#PB_Any, GadgetX(deselectall),y+30,bw,bh,copy$)  
  move = ButtonGadget(#PB_Any, GadgetX(selectduplicates),y+30,bw,bh,move$)  
  exp = ButtonGadget(#PB_Any, GadgetX(invert),y+30,bw,bh,exp$) 
  
  ;move = ButtonGadget(#PB_Any, GadgetX(deselectall),y+30,bw,bh,move$)  
  ;imp = ButtonGadget(#PB_Any, GadgetX(selectduplicates),y+30,bw,bh,imp$)  
  ;exp = ButtonGadget(#PB_Any, GadgetX(invert),y+30,bw,bh,exp$)  
  
  DisableCommaQuotation(exp)
  
  HideWindow(#windowresults,0)
  SetActiveWindow(#windowresults)
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_CloseWindow
  
  CloseWindow(#windowresults)
  Break
  
Case #PB_Event_Gadget
  
Select EventGadget()
    
Case move
    
  m=MoveDuplicates() 
  
If m=-1
  
  MessageRequester("",operationcancelled$)
  CloseWindow(#windowresults)
  Break
  
EndIf

Case copy
    
  c=MoveDuplicates(1) 
  
If c=-1
  
  MessageRequester("",operationcancelled$)
  CloseWindow(#windowresults)
  Break
  
EndIf

Case del
    
  DeleteDuplicates()  
    
  
Case exp
  
  ExportCSV()
  
Case invert
  
  Invert()
  
Case selectduplicates
  
  SelectDuplicates()
    
Case selectall
  
  c=CountGadgetItems(#results):For a=0 To c-1:SetGadgetItemState(#results,a,#PB_ListIcon_Checked):Next
  
Case deselectall
  
  c=CountGadgetItems(#results):For a=0 To c-1:SetGadgetItemState(#results,a,0):Next

EndSelect
    
EndSelect

ForEver
  
EndIf

  ClearList(Results()):ClearMap(Selected()):HideWindow(#window,0):SetActiveWindow(#window)
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 9
; EnableXP