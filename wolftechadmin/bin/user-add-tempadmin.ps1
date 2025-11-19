$UnityID = Read-Host "Enter Unity Id of user to be added to COS-TempAdmin" | Write-Output

$UnityIDCheck = Get-ADUser -Identity $UnityID -properties * | format-list Name,DisplayName,Department

write-output $UnityIDCheck

    if ($UnityIDCheck -ne $null){
        write-host "$UnityID found in Active Directory."
        Add-ADGroupMember -Identity COS-TempAdmin-User -Members $UnityID           
    }
    else { 
        write-host "$UnityID NOT found in Active Directory.Please start over"
    }
