$str= wmic bios get serialnumber
$sn= $str[2]
$sn.trim()
