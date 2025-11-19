# Prestages new AD computers via .csv list
# Computers are only added to the OU specified 
# Make a COPY and mod. DO NOT CHANGE THIS FILE!!
#
# ** I HIGHLY SUGGEST RUNNING from Powershell ISE **
#
# ********* REQUIREMENTS *********** 
#        1. Computer Name (Name)
#        2. Physical MAC Address - from BIOS - no spaces, symbols ie: aa22cc33dd44 (netboot GUID)
#        3. Complete OU Path Attribute in Quotes - (Copy from ADUC Attribute 'Distinguished Name" ie: "OU=Laptops,OU=Holding,OU=COS,OU=NCSU,DC=wolftech,DC=ad,DC=ncsu,DC=edu")
#            You can get the DN from OU Properties ADUC Attribute -- Change at line 36 Col 64  -- Replace "OU DN GOES HERE between the spaces"     
#        4. Description of Computer in Quotes  
#        5. .csv file
#                Example Format: 
#                name,mac,description
#                cos-testpc,aa22cc33dd44,"description of this computer"
#
#

Import-Module ActiveDirectory

$CsvPath = Read-host "-- Enter full path/filename list CSV: " | write-output

Clear-Host
Write-Host "File Path Entered: " $CsvPath
Write-Host "------------------   "

Import-CSV -path $CsvPath | ForEach-Object{ 

    $name = $_.Name
    $MAC = $_.Mac
    $description = $_.Description
   
   
    $CheckExists = Get-ADobject -Filter {(ObjectClass -eq "computer") -and (Name -eq $name)}  #it´s $NULL if the computer doesn´t exist
   
       
    if ($CheckExists -eq $NULL){
        [guid]$nbGUID = "00000000000000000000$MAC"  # transform MAC to netbootGUID
        New-ADComputer -Name $name -SamAccountName $name -Path "OU=Desktops,OU=Staff,OU=DEANOFFICE,OU=Staff,OU=COS,OU=NCSU,DC=wolftech,DC=ad,DC=ncsu,DC=edu" -Description $description -OtherAttributes @{'netbootGUID'=$nbGUID}
                  
        Write-Host $name " - " $nbGUID " - " $oupath
      }
      else {
        Write-Host "$name already in use."
        }
       
}
