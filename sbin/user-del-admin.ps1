$UnityID = Read-Host "Enter Unity Id of user to be removed from RemoteDeesktop access" | Write-Output

$ADDomain = $env:USERDOMAIN
# write-host "$ADDOMAIN\$UnityID"
Remove-LocalGroupMember -Group "Administrators" -Member $ADDomain\$UnityID 
write-host "$UnityID removed from Administrators group."
