#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setKeyDelay, 50, 50

$F9::

WinGet, id, List, ahk_exe Teams.exe
Loop, %id%
{
    this_id := id%A_Index%
    WinGetTitle, this_title, ahk_id %this_id%
	suffix := ") | Microsoft Teams"
	IfNotInString, this_title, %suffix%
	{
		
		WinActivate, ahk_id %this_id%
		WinWaitActive, ahk_id %this_id%
		ControlSend, ahk_parent, ^+{M}

		while (getKeyState("F9", "P"))
			sleep, 100

		ControlSend, ahk_parent, ^+{M}

	}
}

return
