$UnityID = Read-Host "Enter Unity Id of user to be allowed ADMIN access" | Write-Output

$ADDomain = $env:USERDOMAIN
# write-host "$ADDOMAIN\$UnityID"
Add-LocalGroupMember -Group "Administrators" -Member $ADDomain\$UnityID 
write-host "$UnityID added to Administrators Group."
