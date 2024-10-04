$SerialNumber = Get-ComputerInfo | Select-Object -ExpandProperty BiosSeralNumber
write $SerialNumber
