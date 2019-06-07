Procedure Scan()
  
  c=CountGadgetItems(#items)
  
If c<1
  MessageRequester("",nothingtoscan$)
  ProcedureReturn
EndIf

  WindowBounds(#window,#PB_Ignore,#PB_Ignore,WindowWidth(#window),WindowHeight(#window))
  
  StatusBarText(#statusbar,0,retrieving$)
  
  ClearMap(FileSizes()):ClearMap(Files())

  tr=CreateThread(@RetrieveFiles(),0)
  
If OpenWindow(#windowscan,0,0,280,75,scan$,#PB_Window_WindowCentered|#PB_Window_SystemMenu, wid)
  
  progress = ProgressBarGadget(#PB_Any, 20, 20, 240, 25,1,10000)
  
  AddWindowTimer(#windowscan,0,250)
  
Repeat
  
  we=WaitWindowEvent()
  
Select we
    
Case #PB_Event_Timer
  
  t=Timer(tr,progress)
  
Select t
   
Case 1
  
  StatusBarText(#statusbar,0,""):RemoveWindowTimer(#windowscan,0):CloseWindow(#windowscan)
  
  Result()
  Break
  
Case 2
  
  StatusBarText(#statusbar,0,""):RemoveWindowTimer(#windowscan,0):CloseWindow(#windowscan):MessageRequester("",noduplicatesfound$):Break
  
Case 3
  
  kill=1:WaitThread(tr):kill=0
  StatusBarText(#statusbar,0,""):RemoveWindowTimer(#windowscan,0):CloseWindow(#windowscan):Break
  
EndSelect
    
  
Case #PB_Event_CloseWindow
  
If IsThread(tr)
  
  KillThread(tr)
  
EndIf

If IsWindow(#windowscan)

  RemoveWindowTimer(#windowscan,0)
  CloseWindow(#windowscan)
  
EndIf

  Break
  
  
EndSelect
    
ForEver
  
EndIf

  StatusBarText(#statusbar,0,"")
  
  DisableWindow(#window,0)
  
  WindowBounds(#window,800,450,maxwidth,maxheight)
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP