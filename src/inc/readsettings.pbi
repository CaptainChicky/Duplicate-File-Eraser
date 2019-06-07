Procedure.s ReadSettings(key$,def$,group$="")
  
  OpenPreferences(settingsini$)
  
If group$<>""
  PreferenceGroup(group$)
EndIf
  
  s$=ReadPreferenceString(key$,def$)
  ClosePreferences()
  
  ProcedureReturn s$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP