if ($args.Length -gt 0) {
 $SN=$args[0]
 $headers=@{}
$headers.Add("accept", "application/json")
$headers.Add("Authorization", "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjliOGFjNzA5YzI5NmI2NTVkM2U4ZjUzMjc4OTg5ZWNhYWQzZDg4ZWU5NDMzNTE5M2ZjNjRjYWUwZTRkMTAzYzUzOWNmN2UwNDJkOTUwYmUiLCJpYXQiOjE2ODYzOTUwOTMsIm5iZiI6MTY4NjM5NTA5MywiZXhwIjoyMTU5Nzg0MjkzLCJzdWIiOiIxOTQwIiwic2NvcGVzIjpbXX0.ClscvAJJTMO6csUGZGV2_xfMctDfVNRKLaeEsgS2TnIb59pF4WU5rwQBVOv4vfC8pMKtBgWHc0OPVQ9viFpBxAy0bRsexsOWtZJbWWT2BUayrWhRrp0-ARUIhtvNr8_AWrxFFFhDrTkzkGtkCtDzarE60kQdsdaT_Qtdpy49AfcxoNiXoydt8ZaeddRDEhtoU5sTgMjZAD5hfpL4ZeYZvOrmfi_N_mC6g2f60JvTb4XM53M7OKBsTdyUg-b3VHLIY2EezwTIC7f8td5XkMq7vaOskzF3vNPXuKTlDw7UReqyZguWAa2IEWsgiGQNs1z7d3iaWYF0v4IXeMn8MeLr-EFtNpw0em4tKhnh0ipLIIQeVnItWumF42QV0VdVucxLEXAxKptDkRSoxZ_X9zBPpFWrlk-Cb5gSaQGWT4YYZRr4ilz__oWPJBWty7vAiiP-06pAwvJVjkCTaipX5grN4znTNyNGp5dEVIk7K5oAv3ezXoMfCcXUEVBc-CazXHDkib3YdiW2FgK-Qqsrs_UPdxGNlNCMn2xMbXWlOo_VlmRojfp4UE05OYDvhmghtR598Hn79OD0IZw4lOTy8Ldt6slTeT9IOIysvWbODCVwvxf3orwSYNFBQV9VIYoFPCeVHmQ0yM_kDe2WYE8pcaX6DnpQF0ZyTxHOswxteAC-xMg")
$webaddr1="https://inventory.cos.ncsu.edu/api/v1/hardware/byserial/"
$webaddr2="?deleted=false"
$webaddress=$webaddr1+$SN+$webaddr2
$response = Invoke-WebRequest -Uri $webaddress -UseBasicParsing -Method GET -Headers $headers
   Write-Host "$response"
}
else {
   Write-Host "Missing SN"
}
