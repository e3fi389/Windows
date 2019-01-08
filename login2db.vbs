On Error Resume Next
Dim cn

Set objShell = CreateObject("wscript.Shell")   
strLogonServer = objShell.ExpandEnvironmentStrings("%LogonServer%")
strOS = objShell.ExpandEnvironmentStrings("%OS%")
strSESSIONNAME = objShell.ExpandEnvironmentStrings("%SESSIONNAME%")

Set cn = CreateObject("Adodb.Connection")
cn.connectionstring="Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=IGYFK;Data Source=SRV-APPS"
cn.open
cn.execute "INSERT INTO Logininfo (LoginDC,OS,SessionName,Action) VALUES ('" & strLogonServer & "', '" & strOS & "', '" & strSESSIONNAME &"',1)"

cn.close
