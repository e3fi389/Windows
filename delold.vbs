'Const sSource = "C:\Program Files\Far Manager"
Const sSource = "D:\proba"
Const MaxAge = 7

Set oFSO = CreateObject("Scripting.FileSystemObject")
CheckFolder oFSO.GetFolder(sSource)

Sub CheckFolder (oFldr)
	For Each oFile In oFldr.Files
		If DateDiff("D", oFile.DateLastAccessed, Now()) > MaxAge Then 
			WScript.Echo "File: " & oFile.Path
			oFile.Delete
		End If
	Next

	For Each oSubfolder In oFldr.Subfolders
		if InStr(oSubfolder,"DfsrPrivate") = 0 then
			CheckFolder(oSubfolder)
		End If
	Next

	If oFldr.Files.Count = 0 And oFldr.SubFolders.Count = 0 And sSource <> oFldr then
		WScript.Echo "Dire: " & oFldr
		oFldr.Delete
	End If

End Sub

