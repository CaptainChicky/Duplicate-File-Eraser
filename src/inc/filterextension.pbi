Procedure FilterExtension(ext$,exclude=0)
  
NewList Extensions.s()

  c=CountString(ext$," ")
  
If c > 0
 
For a=1 To c+1
  
  e$ = StringField(ext$,a," ")
  
If e$<>""
  
  AddElement(Extensions())
  Extensions()=LCase(e$)
  
EndIf
  
Next    

ElseIf Len(ext$)>0
  
  AddElement(Extensions())
  Extensions()=LCase(ext$)
  
Else
  
  FreeList(Extensions())
  ProcedureReturn
  
EndIf

  
If exclude = 1
  
ForEach Files()
  
  e$ = MapKey(Files())
  ext$ = LCase(GetExtensionPart(e$))
  
ForEach Extensions()
  
If ext$=Extensions()
  
  DeleteMapElement(Files())
  
EndIf
  
Next
  
Next

Else
  
ForEach Files()
  
  e$ = MapKey(Files())
  ext$ = LCase(GetExtensionPart(e$))
  d=0
  
ForEach Extensions()
  
If ext$=Extensions()
  
  d=1
  
EndIf
  
Next

If d<>1
  
  DeleteMapElement(Files())
  
EndIf
  
Next
  
EndIf
  
  
  FreeList(Extensions())

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP