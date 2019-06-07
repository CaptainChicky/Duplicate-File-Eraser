Procedure Msg()

  w = OpenWindow(#PB_Any, 0, 0, 300, 160, update$, #PB_Window_SystemMenu | #PB_Window_WindowCentered, wid)
  
If w
  
  TextGadget(#PB_Any,20,20,260,80, zeronetclientb$)
  cb = CheckBoxGadget(#PB_Any,20,65,260,25,donotshow$)
  ok = ButtonGadget(#PB_Any,30,100,120,25, ok$)
  znweb = ButtonGadget(#PB_Any,150,100,120,25,zeronetio$)
  
Repeat
  
  Event = WaitWindowEvent()
    
If Event = #PB_Event_CloseWindow
  
  Break
  
EndIf

If Event = #PB_Event_Gadget
  
Select EventGadget()
    
Case ok
  
  CloseWindow(w)
  ProcedureReturn 1
  
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
Procedure Update()
  
If ReadSettings(setmsg$,zero$)<>one$
  
If Msg()<>1
  ProcedureReturn
EndIf
  
EndIf

If InitNetwork()
  
  t$ = GetTemporaryDirectory()
  t$ = AddBackslash(t$)
  
  *download = ReceiveHTTPMemory(updateurl$)
  
  
If *download
    
  a=1
  
Repeat
  
  temp$=t$+Str(a)
  
If IsFolder(temp$)<>1
  
  Break
  
EndIf

  a+1
  
ForEver

If CreateDirectory(temp$)
  
  fn$ = GetFilePart(updateurl$)
  p$ = AddBackslash(temp$)
  
 
  f$=p$+fn$
  
If CreateFile(0,f$)
  
  s=MemorySize(*download)
  WriteData(0,*download,s)
  CloseFile(0)
  
If OpenPack(0, f$,#PB_PackerPlugin_Zip ) 
  
If ExaminePack(0)
  
  NextPackEntry(0)
  UncompressPackFile(0, p$ + PackEntryName(0))
  
  
If OpenFile(0, p$ + PackEntryName(0))
  
  s$ = ReadString(0,#PB_UTF8)
  CloseFile(0)
  
  r = FindString(s$,hash$)
    
If r
  
  g=1
  
  ver$ = Trim(Left(RemoveString(s$,hash$),32))
  
If ver$=version$
  
  MessageRequester(update$,noupdates$,#PB_MessageRequester_Info)
  
Else
  
  r=MessageRequester(update$,updateavailable$,#PB_MessageRequester_Info|#PB_MessageRequester_YesNo)
    
If r = #PB_MessageRequester_Yes
  
  OpenURL(url$)
    
EndIf
  
EndIf
  
EndIf
  
EndIf
  
EndIf

  ClosePack(0)
  
EndIf

  DeleteDirectory(temp$,"*.*")

EndIf
    
EndIf

EndIf
  
EndIf

If g<>1
  
  MessageRequester(update$,updatefail$,#PB_MessageRequester_Error)
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 9
; EnableXP