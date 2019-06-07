Structure File
  group.i
  name.s
  size.i
  md5.s
  sha1.s
  crc32.s
EndStructure

Structure items
  group.i
  name.s
  size.s
  md5.s
  sha1.s
  crc32.s
EndStructure

Global NewMap Files.File()

Global NewMap Liste.b()

Global NewMap FileSizes.b()

Global NewMap Selected()

Global NewMap ToMove()

Global NewList Keep.s()

Global NewList Results.File()

Global settingsini$=AddBackslash(GetPathPart(ProgramFilename()))+"settings.ini"

Global image = CreateImage(#PB_Any,800,480)

Global kill

Global wid

Global citem

Global *sha1
Global *crc32

Global wwidth=800
Global wheight=450

ExamineDesktops()

Global maxwidth=DesktopWidth(0)
Global maxheight=DesktopHeight(0)

Global duplicates$="Duplicates"

Global resfilename$="Name"
Global ressize$="Size"

Global group$="Group"

Global file$="File"
Global scan$="Scan"
Global addfile$="Add file(s)"
Global addfolder$="Add folder"
Global update$="Update"
Global about$="About"
Global donate$="Donate"
Global website$="Website"
Global ok$="OK"
Global settings$="Settings"
Global remove$="Remove"
Global reset$="Reset"
Global quit$="Quit"
Global donatetext$ = "Duplicate File Eraser is free - Please donate to support the development!"
Global url$ = "http://127.0.0.1:43110/17SWVnHoujG92yYGSZvCzPgZEpGVfRF8wi"
Global updateurl$ = url$+"/dfe/downloads/v.zip"

Global selectall$="Select all"
Global deselectall$="Deselect all"
Global selectduplicates$="Select duplicates"
Global invert$="Invert selection"
Global imp$="Import"
Global exp$="Export"
Global delete$="Delete"
Global move$="Move"
Global copy$="Copy"

Global moving$="Moving..."
Global copying$="Copying..."

Global loadfile$="Load file"
Global saveas$="Save file as..."
Global filesaved$="File saved"

Global csv$="csv"
Global patterncsv$="CSV (*.csv)|*.csv"

Global choosedestination$="Choose the destination path"
Global destinationpath$

Global noduplicatesfound$="No duplicates found"
Global nothingtoscan$="Nothing to scan"

Global visitwebsite$="Visit website"
Global zeronetio$="Zeronet.io"
Global zeroneturl$="https://zeronet.io"

Global error$="Error"
Global errcopyfile$="Unable to copy..."
Global errmovefile$="Unable to move..."
Global errdelfile$="Unable to delete..."
Global errfile$="Unable to write file"
Global errfiler$="Unable to read file"
Global errimport$="Unable to import file"
Global errmove$
Global questiondelete$="Delete selected files?"
Global questionmove$="Move selected files to destination path?"
Global questioncopy$="Copy selected files to destination path?"

Global operationcancelled$="Operation cancelled"

Global donotshow$="Do not show this message again"

Global nothingselected$="Nothing selected"

Global pleasewait$="Please wait"

Global zeronetclient$="You need the Zeronet client software running to access the website."
Global zeronetclientb$="You need the Zeronet client software running to use the update function."

Global noupdates$="You already have the newest version."
Global updateavailable$="A newer version is available."+Chr(10)+Chr(10)+"Download now?"
Global updatefail$="Update check failed"

Global searchinsubdirs$ = "Search in subdirectories"
Global exclude$ = "Exclude these filetypes"
Global searchfor$ = "Search for these filetypes"
Global searchforsize$ = "Search for files in these sizes"
Global excludeinthesesizes$ = "Exclude files in these sizes"
Global searchoptions$="Search options"
Global scanalgo$="Scan algorithm"
Global checking$="Checking"
Global retrieving$="Retrieving files"
Global max$="Max"
Global min$="Min"
Global md5$="MD5"
Global sha1$="SHA1"
Global crc32$="CRC32"

Global tooltipext$ = "File extension(s) seperated by space"+Chr(10)+Chr(10)+"Example: jpg png mp4"
Global tooltipsize$ = "Size in bytes"

Global setmsg$="msg"

Global setsearchfor$="searchfor"
Global setexclude$="exclude"

Global setsearchforsize$="searchforsize"
Global setexcludesize$="excludesize"

Global setsubdir$="subdir"
Global setsha1$="sha1"
Global setcrc32$="crc32"

Global filetypea$="filetype1"
Global filetypeb$="filetype2"

Global sizea$="size1"
Global sizeb$="size2"

Global setextensions$="extensions"
Global setlimit$="limit"

Global version$="2.1"
Global title$="Duplicate File Eraser v" + version$

Global hash$="6f16fc5159482693a35b3b5386be5ff8"

Global zero$="0"
Global one$="1"

Global updated$="2019-06-07"
Global copyright$="Copyright (c) 2019 Fatih Kodak"
; IDE Options = PureBasic 5.70 LTS (Linux - x64)
; EnableXP