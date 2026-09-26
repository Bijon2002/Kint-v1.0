Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)

' Check for Conda pythonw first, then fallback to system pythonw
pythonwPath = "A:\conda\pythonw.exe"
If Not fso.FileExists(pythonwPath) Then
    pythonwPath = "pythonw.exe"
End If

cmd = """" & pythonwPath & """ """ & scriptDir & "\main.py"""
WshShell.CurrentDirectory = scriptDir
WshShell.Run cmd, 0, False

Set fso = Nothing
Set WshShell = Nothing
