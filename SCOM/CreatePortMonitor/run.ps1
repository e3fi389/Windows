$csvinfo = Import-CSV i:\temp\script\list.csv
ForEach ($line in $csvinfo) {
Write-Host "IP=: ($line.IP)"
i:\temp\script\CreatePortMonitoring.ps1 -serverName:$line.IP -portNumber:$line.PORT -pollIntervalSeconds:'240' -watcherNodes:$line.SERVER -displayName:$line.DESC -targetMP:$line.MPACK
}


