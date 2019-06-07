Procedure FilterSizeC()
  
  s$ = ReadSettings(setlimit$,"",sizeb$)
  max = Val(Trim(StringField(s$,1,",")))
  min = Val(Trim(StringField(s$,2,",")))
  
If min > 0 And max > 0 And max > min
  
ForEach Files() 
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
    
If fs=>min And fs<=max
  
  DeleteMapElement(Files()) 
  
EndIf


Next

EndIf
 

If min > 0 And max < 1
  
ForEach Files() 
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
    
If fs=>min
      
  DeleteMapElement(Files()) 
  
EndIf


Next

EndIf
  

If min < 1 And max > 0
  
ForEach Files() 
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
    
If fs<=max
      
  DeleteMapElement(Files()) 
  
EndIf


Next

EndIf
  
EndProcedure
Procedure FilterSizeB()
  
  s$ = ReadSettings(setlimit$,"",sizea$)
  max = Val(Trim(StringField(s$,1,",")))
  min = Val(Trim(StringField(s$,2,",")))
  
If min > 0
  
ForEach Files() 
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
    
If fs<min
  
  DeleteMapElement(Files()) 
  
EndIf


Next

EndIf

If max > 0 And max > min
  
ForEach Files() 
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
    
If fs>max
  
  DeleteMapElement(Files()) 
  
EndIf


Next

EndIf

EndProcedure
Procedure FilterSize()
  
ForEach Files()
  
If Kill()=1
  ProcedureReturn
EndIf
  
  e$ = MapKey(Files())
  fs = Files(e$)\size
  
If FileSizes(Str(fs))<2
  
  DeleteMapElement(Files())
  
EndIf

Next

If ReadSettings(setsearchforsize$,zero$)=one$
  
  FilterSizeB()
  
ElseIf ReadSettings(setexcludesize$,zero$)=one$
  
  FilterSizeC()
    
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = 5
; EnableXP