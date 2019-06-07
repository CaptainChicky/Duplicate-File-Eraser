Procedure Main()
    
If OpenWindow(#window,0,0,wwidth,wheight, title$,#PB_Window_SystemMenu|#PB_Window_MinimizeGadget|#PB_Window_ScreenCentered|#PB_Window_SizeGadget)
  
  WindowBounds(#window,wwidth,wheight,#PB_Ignore,#PB_Ignore)
  
  wid=WindowID(#window)
  
  Menu()
  
  Toolbar()
  
  CreateStatusBar(#statusbar,wid)
  AddStatusBarField(wwidth-4)
  StatusBarText(#statusbar,0,"",#PB_StatusBar_BorderLess)
  
  y=ToolBarHeight(#toolbar)+MenuHeight()+StatusBarHeight(#statusbar)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  ListViewGadget(#items,2,ToolBarHeight(#toolbar),wwidth-4,wheight-y-2,#PB_ListView_MultiSelect)
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_Linux
  ListViewGadget(#items,2,2,wwidth-4,wheight-y-2,#PB_ListView_MultiSelect)
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
  ListViewGadget(#items,2,2,wwidth-4,wheight-y-2,#PB_ListView_MultiSelect)  
CompilerEndIf
  
  
  EnableGadgetDrop(#items, #PB_Drop_Files, #PB_Drag_Copy)
  
  AddKeyboardShortcut(#window,#PB_Shortcut_Delete,#remove)
  AddKeyboardShortcut(#window,#PB_Shortcut_Control | #PB_Shortcut_A,#selectall)
  
If CreatePopupImageMenu(#popupmenu,#PB_Menu_ModernLook) 
  
  MenuItem(#popupaddfile, addfile$,ImageID(#imgfilesm))
  MenuItem(#popupaddfolder, addfolder$,ImageID(#imgfoldersm))
  MenuItem(#popupremove, remove$,ImageID(#imgremovesm))
  MenuItem(#popupreset, reset$,ImageID(#imgresetsm))
  
EndIf
  
  
Repeat
  
  event = WaitWindowEvent()
  
Select event
    
Case #PB_Event_RightClick
  
  DisplayPopupMenu(#popupmenu, wid)
    
Case #PB_Event_GadgetDrop
  
  files$ = EventDropFiles()
  
  c  = CountString(files$, Chr(10)) + 1
  
For i = 1 To c
  
  AddFileToList(StringField(files$, i, Chr(10)))
  
Next i
  
    
Case #PB_Event_SizeWindow
  
  y=ToolBarHeight(#toolbar)+MenuHeight()+StatusBarHeight(#statusbar)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  ResizeGadget(#items,2,ToolBarHeight(#toolbar),WindowWidth(#window)-4,WindowHeight(#window)-y-2)  
CompilerElse
  ResizeGadget(#items,2,2,WindowWidth(#window)-4,WindowHeight(#window)-y-2)
CompilerEndIf
  
Case #PB_Event_CloseWindow
    
  End
  
Case #PB_Event_Menu
  
Select EventMenu()
    
Case #menuimport
  
  Result(1)
  
Case #selectall
  
  c=CountGadgetItems(#items)
  
If c>0
  
For a=0 To c-1
  
  SetGadgetItemState(#items,a,1)
  
Next
  
EndIf
  
Case #menuupdate,#tbupdate
  
  Update()
  
Case #menuabout,#tbabout
    
  About()
    
Case #menusettings,#tbsettings
    
  Settings()
    
Case #menuscan,#tbscan
    
  Scan()
  
Case #menuquit
  
  End
  
Case #tbweb,#menuweb
  
  OpenWebsite()
    
Case #popupremove,#remove
  
  Remove()

Case #tbreset,#menureset,#popupreset
  
  ClearGadgetItems(#items):ClearMap(Liste()):ClearMap(FileSizes()):ClearMap(Files())
  
Case #tbfile,#menufile,#popupaddfile
  
  AddToList()
  
Case #tbfolder,#menufolder,#popupaddfolder
  
  AddFolder()

Case #tbdonate,#menudonate
  
  Donate()
  
EndSelect
    
EndSelect

ForEver
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = +
; EnableXP