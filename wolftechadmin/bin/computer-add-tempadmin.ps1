$NameInput = Read-Host "Enter Computer Name of computer to be added to COS-TempAdmin-Computer" | Write-Output

$ComputerCheck = Get-ADComputer -Identity $NameInput | Select-Object Name, DNSHostName, IPv4Address, DistinguishedName

# write-output $ComputerCheck

    if ($ComputerCheck -ne $null){
	write-host " "
        write-host "$NameInput added to group COS-TempAdmin-Computer."
	$PCName = $NameInput + '$'
        Add-ADGroupMember -Identity COS-TempAdmin-Computer -Members $PCName
    }
    else { 
        write-host "$NameInput NOT found in Active Directory. Please start over"
    }
