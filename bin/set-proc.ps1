$OProcessor = Get-ComputerInfo | Select-Object -ExpandProperty CsProcessors  | Select-Object -ExpandProperty Name
$Processor =  $OProcessor -replace ' ','_'
write $Processor
