import-module Activedirectory

<#csv format example
name,mac,oupath,description
scit-br-0001,aabbcc112233,"COS00001 Jackie desktop OP9020","OU=Desktops,OU=Staff,OU=DEANOFFICE,OU=Staff,OU=COS,OU=NCSU,DC=wolftech,DC=ad,DC=ncsu,DC=edu"
#>


$ListPath = Read-Host "Enter path/filename to CSV:  " | write-output


import-csv -path $ListPath | foreach-object{ 

    $name = $_.Name
    $MAC = $_.Mac
    $OUPath = $_.OUPath #OUPath in Distinguished Name format
    $description = $_.description
  
   
    $CheckExists = get-adobject -Filter {(ObjectClass -eq "computer") -and (Name -eq $name)}  #it´s $NULL if the computer doesn´t exist
   
    
    if ($CheckExists -eq $NULL){
        [guid]$nbGUID = "00000000-0000-0000-0000-$MAC"  # transform MAC to netbootGUID
        new-adcomputer -Name $name -SamAccountName $name -Path $OUPath -Description $description -OtherAttributes @{'netbootGUID'=$nbGUID}        
        write-output " ........................" "       $name - $nbGUID" " ........................"
      }
      else {
        write-output "$name already in use."
        }
       
}
