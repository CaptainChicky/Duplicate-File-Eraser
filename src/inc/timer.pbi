Procedure MD5Check(no=0)
  
  Files()\md5 = FileFingerprint(Files()\name,#PB_Cipher_MD5)
  
  CallFunctionFast(*sha1)
  CallFunctionFast(*crc32)
  
  ProcedureReturn
  
EndProcedure

Procedure Timer(tr,progress)
  
If ReadSettings(setsha1$,zero$)=one$
  *sha1=@SHA1()  
Else  
  *sha1=@Nothing()
EndIf

If ReadSettings(setcrc32$,zero$)=one$
  *crc32=@CRC32()  
Else  
  *crc32=@Nothing()
EndIf

If IsThread(tr)=0
  
  FilterSize()
  
If ReadSettings(setsearchfor$,zero$) = one$
    
  ext$ = Trim(ReadSettings(setextensions$,"",filetypea$))
  FilterExtension(ext$)
  
ElseIf ReadSettings(setexclude$,zero$) = one$
  
  ext$ = Trim(ReadSettings(setextensions$,"",filetypeb$))
  FilterExtension(ext$,1)
  
EndIf
  
  RemoveWindowTimer(#windowscan,0)
  
  s = MapSize(Files())
  
If s<1
  
  ProcedureReturn 2
  
Else
  
  SetGadgetAttribute(progress, #PB_ProgressBar_Minimum, 0)
  SetGadgetAttribute(progress, #PB_ProgressBar_Maximum, s)
  
EndIf

EndIf

ForEach Files()
  
  i+1
  
If a % 500 = 0
  
If IsThread(tr)
  
  l = Len(d$)
  d$ = RSet(d$,l+1,".")
   
  StatusBarText(#statusbar,0,retrieving$+d$)
    
If Len(d$)=>3
  d$=""
EndIf
  
EndIf

EndIf

  a+1
  
  md5 = CreateThread(@MD5Check(),#Null)
  
While IsThread(md5)
  
  we = WindowEvent()
  
If we=#PB_Event_CloseWindow
  
  KillThread(md5)
  
  ProcedureReturn 3
  
EndIf

  Delay(1)

Wend
  
  SetGadgetState(progress,i)
  StatusBarText(#statusbar,0,checking$+": "+Files()\name)
  
  a+1
  
If a % 20 = 0
  
  Delay(2)
  
EndIf
  
Next

  SetGadgetState(progress,s)
  
  ProcedureReturn 1


EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 9
; EnableXP