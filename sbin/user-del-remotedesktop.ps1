$UnityID = Read-Host "Enter Unity Id of user to be removed from RemoteDeesktop access" | Write-Output

# $ADDomain = $env:USERDOMAIN
# write-host "$ADDOMAIN\$UnityID"
Remove-LocalGroupMember -Group "Users" -Member $ADDomain\$UnityID 
Remove-LocalGroupMember -Group "Remote Desktop Users" -Member $ADDomain\$UnityID 
write-host "$UnityID added to Users and Remote Desktop Users."
