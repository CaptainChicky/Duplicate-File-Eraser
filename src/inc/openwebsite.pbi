Procedure OpenWebsite()
  
If ReadSettings(setmsg$,zero$)=one$
    
  OpenURL(url$)
  ProcedureReturn
  
EndIf
  
  w = OpenWindow(#PB_Any, 0, 0, 300, 160, website$, #PB_Window_SystemMenu | #PB_Window_WindowCentered, wid)
  
If w
  
  TextGadget(#PB_Any,20,20,260,80, zeronetclient$)
  cb = CheckBoxGadget(#PB_Any,20,65,260,25,donotshow$)
  web = ButtonGadget(#PB_Any,30,100,120,25, visitwebsite$)
  znweb = ButtonGadget(#PB_Any,150,100,120,25,zeronetio$)
  
Repeat
  
  Event = WaitWindowEvent()
    
If Event = #PB_Event_CloseWindow
  
  Break
  
EndIf

If Event = #PB_Event_Gadget
  
  
Select EventGadget()
    
Case web
    
  OpenURL(url$)
  
Case znweb
  
  OpenURL(zeroneturl$)
    
Case cb
  
  WriteSettings(setmsg$,Str(GetGadgetState(cb)))
    
EndSelect
    
EndIf
  
ForEver
  
 CloseWindow(w)
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP