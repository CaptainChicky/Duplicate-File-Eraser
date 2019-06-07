Macro Toolbar()

  CreateToolBar(#toolbar,wid,#PB_ToolBar_Large|#PB_ToolBar_Text)
  ToolBarImageButton(#tbfile,ImageID(#imgfilelg),#PB_ToolBar_Normal,addfile$)
  ToolBarSeparator()
  ToolBarImageButton(#tbfolder,ImageID(#imgfolderlg),#PB_ToolBar_Normal,addfolder$)
  ToolBarSeparator()
  ToolBarImageButton(#tbreset,ImageID(#imgresetlg),#PB_ToolBar_Normal,reset$)
  ToolBarSeparator()
  ToolBarImageButton(#tbscan,ImageID(#imgscanlg),#PB_ToolBar_Normal,scan$)
  ToolBarSeparator()
  ToolBarImageButton(#tbsettings,ImageID(#imgsettingslg),#PB_ToolBar_Normal,settings$)
  ToolBarSeparator()
  ToolBarImageButton(#tbupdate,ImageID(#imgupdatelg),#PB_ToolBar_Normal,update$)
  ToolBarSeparator()
  ToolBarImageButton(#tbweb,ImageID(#imgweblg),#PB_ToolBar_Normal,website$)
  ToolBarSeparator()
  ToolBarImageButton(#tbabout,ImageID(#imgaboutlg),#PB_ToolBar_Normal,about$)
  ToolBarSeparator()
  ToolBarImageButton(#tbdonate,ImageID(#imgdonatelg),#PB_ToolBar_Normal,donate$)
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = -
; EnableXP