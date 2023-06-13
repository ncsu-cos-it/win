if ($args.Length -gt 0) {
  $SN=$args[0]
  $FILE="$env:TEMP\$SN.txt"
  <# Write-Host "FILE=$FILE" #>

  $temp=gc "$FILE"
  $array=@()

  $temp | Foreach{
    $elements=$_.split(",")
    $array+= ,@($elements[0],$elements[1],$elements[2],$elements[3])
  }
  <# write-host $elements[0] #>
  $rows=$elements[0] -Split ":"
  $rowsno=$rows[1]
  <# write-host $rowsno #>
  if ( $rowsno -eq 0 ) {
     write-host "COS999999"
  } #>

  $asset=$elements[3] -Split ":"
  $assetno=$asset[1].Trim('"')
  <# write-host $assetno #>
  set-content c:\opt\cos\etc\Tag.txt $assetno
}
else {
  Write-Host "Missing SN"
}