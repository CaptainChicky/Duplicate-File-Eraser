Procedure About()
  
If OpenWindow(#windowabout,0,0,370,170,about$,#PB_Window_WindowCentered|#PB_Window_SystemMenu, wid)
  
  ImageGadget(#PB_Any,10,10,260,20,ImageID(#imgicon))
  TextGadget(#PB_Any,150,25,220,20,title$)
  TextGadget(#PB_Any,150,55,220,20,updated$)
  TextGadget(#PB_Any,150,85,220,20,copyright$)
  ok = ButtonGadget(#PB_Any,150,125,80,25,ok$)
  
Repeat
  
  we=WaitWindowEvent()
  
Select we
    
Case #PB_Event_CloseWindow
    
  CloseWindow(#windowabout)
  Break
  
Case #PB_Event_Gadget
  
If EventGadget()=ok
  
  CloseWindow(#windowabout)
  Break
  
EndIf
  
EndSelect
    
ForEver

EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP