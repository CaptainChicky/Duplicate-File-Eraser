Macro Menu()

  CreateImageMenu(#menu,wid)
  MenuTitle(file$)
  MenuItem(#menufile,addfile$,ImageID(#imgfilesm))
  MenuItem(#menufolder,addfolder$,ImageID(#imgfoldersm))
  MenuItem(#menureset,reset$,ImageID(#imgresetsm))
  MenuBar()
  MenuItem(#menuimport,imp$,ImageID(#imgimportsm))
  MenuBar()
  MenuItem(#menuscan,scan$,ImageID(#imgscansm))
  MenuBar()
  MenuItem(#menusettings,settings$,ImageID(#imgsettingssm))
  MenuBar()
  MenuItem(#menuquit,quit$,ImageID(#imgquit))
  MenuTitle("?")
  MenuItem(#menuupdate,update$,ImageID(#imgupdatesm))
  MenuItem(#menuweb,website$,ImageID(#imgwebsm))
  MenuItem(#menuabout,about$,ImageID(#imgaboutsm))
  MenuBar()
  MenuItem(#menudonate,donate$,ImageID(#imgdonatesm))
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; Folding = -
; EnableXP