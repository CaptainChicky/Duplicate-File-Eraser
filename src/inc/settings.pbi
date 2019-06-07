Procedure CBClickA(cb,cbb,sa,sb)
  
If GetGadgetState(cb)=1
  
  DisableGadget(sa,0):SetGadgetState(cbb,0):DisableGadget(sb,1)
  
Else
  
  DisableGadget(sa,1)
  
EndIf
  
EndProcedure

Procedure CBClickB(cb,cbb,sa,sb,sc,sd)
  
If GetGadgetState(cb)=1
  
  SetGadgetState(cbb,0)
  
  DisableGadget(sa,0):DisableGadget(sb,0)
  DisableGadget(sc,1):DisableGadget(sd,1)
  
Else
  
  DisableGadget(sa,1):DisableGadget(sb,1)
  
EndIf
  
EndProcedure

Procedure Settings()
  
  w=508:h=440
  
If OpenWindow(#windowsettings,0,0,w,h,settings$,#PB_Window_WindowCentered|#PB_Window_SystemMenu|#PB_Window_Invisible, wid)
  
  l=ListViewGadget(#PB_Any,12,12,150,h-60)
  
  AddGadgetItem(l,-1,scanalgo$)
  
  ca = ContainerGadget(#PB_Any,GadgetX(l)+GadgetWidth(l)+12,GadgetY(l),w-(GadgetX(l)+GadgetWidth(l)+12),h-60)
  
  FrameGadget(#PB_Any,0,0,GadgetWidth(ca)-15,GadgetHeight(ca),scanalgo$)
  
  md5 = CheckBoxGadget(#PB_Any,20,30,Text_Width(md5$),Text_Height(md5$),md5$)
  sha1 = CheckBoxGadget(#PB_Any,20,60,Text_Width(md5$),Text_Height(sha1$),sha1$)
  crc32 = CheckBoxGadget(#PB_Any,20,90,Text_Width(crc32$),Text_Height(crc32$),crc32$)
    
  SetGadgetState(md5,1)
  DisableGadget(md5,1)
  
  SetGadgetState(sha1,Val(ReadSettings(setsha1$,zero$)))
  SetGadgetState(crc32,Val(ReadSettings(setcrc32$,zero$)))
  
  CloseGadgetList()
  
  SetGadgetItemState(l, 0, 1)
  
  AddGadgetItem(l,-1,searchoptions$)
      
  cb = ContainerGadget(#PB_Any,GadgetX(ca),GadgetY(ca),GadgetWidth(ca),GadgetHeight(ca))
  
  FrameGadget(#PB_Any,0,0,GadgetWidth(ca)-15,GadgetHeight(ca),searchoptions$)
      
  subdir = CheckBoxGadget(#PB_Any,GadgetX(md5),GadgetY(md5),Text_Width(searchinsubdirs$),Text_Height(searchinsubdirs$),searchinsubdirs$)
  
  SetGadgetState(subdir,Val(ReadSettings(setsubdir$,zero$)))
  
  sf = CheckBoxGadget(#PB_Any,GadgetX(subdir),78,Text_Width(searchfor$),Text_Height(searchfor$),searchfor$)
  ft = StringGadget(#PB_Any,GadgetX(sf)+20,GadgetY(sf)+25,250,20,"")
  SetGadgetState(sf,Val(ReadSettings(setsearchfor$,zero$)))
  SetGadgetText(ft, ReadSettings(setextensions$,"",filetypea$))
  
If GetGadgetState(sf)=0
  
  DisableGadget(ft,1)
  
EndIf
  
  GadgetToolTip(ft, tooltipext$)
  
  ecl = CheckBoxGadget(#PB_Any,GadgetX(sf),148,Text_Width(exclude$),Text_Height(exclude$), exclude$)
  eft = StringGadget(#PB_Any,GadgetX(ecl)+20,GadgetY(ecl)+25,250,20,"")
  SetGadgetState(ecl,Val(ReadSettings(setexclude$,zero$)))
  SetGadgetText(eft, ReadSettings(setextensions$,"",filetypeb$))
  
If GetGadgetState(ecl)=0
    
  DisableGadget(eft,1)
  
EndIf
    
  GadgetToolTip(eft, tooltipext$)
  
  sfs = CheckBoxGadget(#PB_Any,GadgetX(ecl),218,Text_Width(searchforsize$),Text_Height(searchforsize$),searchforsize$)
  
  s$ = ReadSettings(setlimit$,"",sizea$)
  
  TextGadget(#PB_Any,GadgetX(sfs)+25,GadgetY(sfs)+33,Text_Width(max$),Text_Height(max$),max$)
  smax = StringGadget(#PB_Any,GadgetX(sfs)+60,GadgetY(sfs)+30,80,20,Trim(StringField(s$,1,",")),#PB_String_Numeric)
  
  GadgetToolTip(smax, tooltipsize$)
  
  TextGadget(#PB_Any,GadgetX(sfs)+155,GadgetY(sfs)+33,Text_Width(min$),Text_Height(min$),min$)
  smin = StringGadget(#PB_Any,GadgetX(sfs)+190,GadgetY(sfs)+30,80,20,Trim(StringField(s$,2,",")),#PB_String_Numeric)
  
  GadgetToolTip(smin, tooltipsize$)
  
  SetGadgetState(sfs,Val(ReadSettings(setsearchforsize$,zero$)))
  
If GetGadgetState(sfs)=0
  
  DisableGadget(smax,1):DisableGadget(smin,1)
  
EndIf
  
  ecs = CheckBoxGadget(#PB_Any,GadgetX(ecl),290,Text_Width(excludeinthesesizes$),Text_Height(excludeinthesesizes$), excludeinthesesizes$)
  
  s$ = ReadSettings(setlimit$,"",sizeb$)
  
  TextGadget(#PB_Any,GadgetX(ecs)+25,GadgetY(ecs)+33,Text_Width(max$),Text_Height(max$),max$)
  esmax = StringGadget(#PB_Any,GadgetX(smax),GadgetY(ecs)+30,80,20,Trim(StringField(s$,1,",")),#PB_String_Numeric)
  
  GadgetToolTip(esmax, tooltipsize$)
  
  TextGadget(#PB_Any,GadgetX(sfs)+155,GadgetY(ecs)+33,Text_Width(min$),Text_Height(min$),min$)
  esmin = StringGadget(#PB_Any,GadgetX(smin),GadgetY(ecs)+30,80,20,Trim(StringField(s$,2,",")),#PB_String_Numeric)
  
  GadgetToolTip(esmin, tooltipsize$)
  
  SetGadgetState(ecs,Val(ReadSettings(setexcludesize$,zero$)))
  
If GetGadgetState(ecs)=0
  
  DisableGadget(esmax,1):DisableGadget(esmin,1)
  
EndIf
  
  CloseGadgetList()
  HideGadget(cb,1)
  
  ok = ButtonGadget(#PB_Any,w/2-80,h-40,160,25,ok$)
  
If GetGadgetState(sf)=1 And GetGadgetState(ecl)=1
  
  SetGadgetState(ecl,0):DisableGadget(eft,1)
  
EndIf

If GetGadgetState(sfs)=1 And GetGadgetState(ecs)=1
  
  SetGadgetState(ecs,0):DisableGadget(esmax,1):DisableGadget(esmin,1)
  
EndIf

  HideWindow(#windowsettings,0)
  
  
Repeat
  
  we=WaitWindowEvent()
  
Select we
    
Case #PB_Event_CloseWindow
    
  CloseWindow(#windowsettings)
  
  Break
  
Case #PB_Event_Gadget
  
Select EventGadget()
    
Case ok
    
  WriteSettings(setsubdir$,Str(GetGadgetState(subdir)))
  WriteSettings(setsha1$,Str(GetGadgetState(sha1)))
  WriteSettings(setcrc32$,Str(GetGadgetState(crc32)))
  WriteSettings(setsearchfor$,Str(GetGadgetState(sf)))
  WriteSettings(setexclude$,Str(GetGadgetState(ecl)))
  WriteSettings(setsearchforsize$,Str(GetGadgetState(sfs)))
  WriteSettings(setexcludesize$,Str(GetGadgetState(ecs))) 
  WriteSettings(setextensions$,GetGadgetText(ft),filetypea$) 
  WriteSettings(setextensions$,GetGadgetText(eft),filetypeb$) 
  
  WriteSettings(setlimit$,GetGadgetText(smax)+" , "+GetGadgetText(smin),sizea$) 
  WriteSettings(setlimit$,GetGadgetText(esmax)+" , "+GetGadgetText(esmin),sizeb$) 
  
  
If Val(GetGadgetText(smin))=>Val(GetGadgetText(smax))
  WriteSettings(setlimit$," , "+GetGadgetText(smin),sizea$) 
EndIf

If Val(GetGadgetText(esmin))=>Val(GetGadgetText(esmax))
  WriteSettings(setlimit$," , "+GetGadgetText(esmin),sizeb$) 
EndIf

  CloseWindow(#windowsettings)
  Break
  
Case l
  
If GetGadgetItemState(l,0) = 1
  
  HideGadget(ca,0):HideGadget(cb,1)
  
ElseIf GetGadgetItemState(l,1) = 1
  
  HideGadget(ca,1):HideGadget(cb,0)
  
EndIf

Case sfs
  
  CBClickB(sfs,ecs,smax,smin,esmax,esmin)

Case ecs
  
  CBClickB(ecs,sfs,esmax,esmin,smax,smin)
  
Case sf
  
  CBClickA(sf,ecl,ft,eft)
  
Case ecl
  
  CBClickA(ecl,sf,eft,ft)
  
EndSelect
    
EndSelect
    
ForEver

EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 5
; EnableXP