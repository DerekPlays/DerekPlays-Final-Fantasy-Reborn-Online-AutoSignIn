; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


Final:
IfExist, C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV - A Realm Reborn\boot\ffxivboot.exe
{
    Run, C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV - A Realm Reborn\boot\ffxivboot.exe
    Goto, start
}
IfExist, C:\Users\%A_UserName%\AppData\Local\location.txt
{
    FileRead, loc2, C:\Users\%A_UserName%\AppData\Local\location.txt
    Run, ffxivboot.exe, %loc2%
    Goto, start
}
FileSelectFolder, Location, , , Please select your SquareEnix directory containing final fantasy.
FileAppend, %Location%\FINAL FANTASY XIV - A Realm Reborn\boot\, C:\Users\%A_UserName%\AppData\Local\location.txt
FileRead, loc, C:\Users\%A_UserName%\AppData\Local\location.txt
Run, ffxivboot.exe, %loc%
start:
WinWaitActive, FFXIVLauncher
Sleep, 333
Loop, 50
{
    CoordMode, Pixel, Window
    ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, C:\Users\User\Documents\ShareX\Screenshots\2017-10\ffxivlauncher_2017-10-23_21-31-35.png
    CenterImgSrchCoords("C:\Users\User\Documents\ShareX\Screenshots\2017-10\ffxivlauncher_2017-10-23_21-31-35.png", FoundX, FoundY)
    If ErrorLevel = 0
    	Click, %FoundX%, %FoundY% Left, 1
    Sleep, 100
}
Until ErrorLevel = 0
IfNotExist, C:\Users\%A_UserName%\AppData\Local\password.txt
{
    InputBox, Password, Please enter a password. (First time only), Please enter a password. (First time only), , , 100
    FileAppend, %Password%, C:\Users\%A_UserName%\AppData\Local\password.txt
    FileRead, Read, C:\Users\%A_UserName%\AppData\Local\password.txt
    ControlClick, Internet Explorer_Server1, ahk_class FFXIVLauncher,, Left, 1,  x858 y137 NA
    Sleep, 10
    SendRaw, %Read%
    Sleep, 100
    ControlClick, Internet Explorer_Server1, FFXIVLauncher,, Left, 1,  x810 y256 NA
    Sleep, 10
    Loop, 50
    {
        CoordMode, Pixel, Window
        PixelSearch, FoundX, FoundY, 675, 216, 954, 309, 0x6BAB04, 0, Fast RGB
        If ErrorLevel = 0
        	Click, %FoundX%, %FoundY% Left, 1
        Sleep, 100
    }
    Until ErrorLevel = 0
    ExitApp
}
IfExist, C:\Users\%A_UserName%\AppData\Local\password.txt
{
    FileRead, Read, C:\Users\%A_UserName%\AppData\Local\password.txt
    ControlClick, Internet Explorer_Server1, ahk_class FFXIVLauncher,, Left, 1,  x858 y137 NA
    Sleep, 10
    SendRaw, %Read%
    Sleep, 100
    ControlClick, Internet Explorer_Server1, FFXIVLauncher,, Left, 1,  x810 y256 NA
    Sleep, 10
    Loop, 50
    {
        CoordMode, Pixel, Window
        PixelSearch, FoundX, FoundY, 675, 216, 954, 309, 0x6BAB04, 0, Fast RGB
        If ErrorLevel = 0
        	Click, %FoundX%, %FoundY% Left, 1
        Sleep, 100
    }
    Until ErrorLevel = 0
    ExitApp
}
Return


F7::ExitApp

CenterImgSrchCoords(File, ByRef CoordX, ByRef CoordY)
{
	static LoadedPic
	LastEL := ErrorLevel
	Gui, Pict:Add, Pic, vLoadedPic, %File%
	GuiControlGet, LoadedPic, Pict:Pos
	Gui, Pict:Destroy
	CoordX += LoadedPicW // 2
	CoordY += LoadedPicH // 2
	ErrorLevel := LastEL
}
