$OModel= Get-ComputerInfo | Select-Object -ExpandProperty CsModel
$Model =  $OModel -replace ' ','_' 
write $Model
