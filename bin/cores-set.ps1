$Cores = Get-ComputerInfo | Select-Object -ExpandProperty CsLogicalProcessors
write $Cores
