$Cores = Get-ComputerInfo | Select-Object -ExpandProperty CsNumberOfLogicalProcessors
write $Cores
