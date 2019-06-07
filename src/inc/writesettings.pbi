Procedure WriteSettings(key$,value$,group$="")
  
If FileExists(settingsini$)
  OpenPreferences(settingsini$)
Else
  CreatePreferences(settingsini$)
EndIf

If group$<>""
  PreferenceGroup(group$)
EndIf
  
  WritePreferenceString(key$,value$)
  ClosePreferences()
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP