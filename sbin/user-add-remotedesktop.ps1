$UnityID = Read-Host "Enter Unity Id of user to be allowed RemoteDeesktop access" | Write-Output

$ADDomain = $env:USERDOMAIN
write-host "$ADDOMAIN\$UnityID"
Add-LocalGroupMember -Group "Users" -Member $ADDomain\$UnityID -Verbose
#Add-LocalGroupMember -Group "Remote Desktop Users" -Member $ADDomain\$UnityID           
write-host "$UnityID added to Users and Remote Desktop Users."
