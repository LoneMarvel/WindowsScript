# Declare variables needed for the Script
$instanceName = 'DESKTOP-RTCARLP\SEMANTICINST' # The Name that is used in SqlManagement
$ignoreDb = ('master','model','msdb','tempdb') # Array contains the DataBases that you don't want to backed up
$dateExt = Get-Date -Format 'ddMMyyyyHHmmss' # This variable is used as name extension (not file extension) for unique reason
$bckDir = 'C:\tmp\SqlBackup\' # Temporary local directory
$netDir = 'Y:\BackupSql\' # Network directory finally destination
# Script is starting
$dbList = Get-SqlDatabase -ServerInstance $instanceName

foreach($dbTable in $dbList){    
    $dbName = $dbTable.Name    
    if ( !$ignoreDb.Contains($dbName) ){
        $fileName = $dbName+'-'+$dateExt+'.bak'
        Backup-SqlDatabase -ServerInstance $instanceName -Database $dbName -BackupFile $bckDir$fileName
        Copy-Item $bckDir$fileName -Destination $netDir
        Remove-Item $bckDir$fileName
    }
}

