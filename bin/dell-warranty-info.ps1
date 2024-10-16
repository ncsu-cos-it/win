    Param(  
        [Parameter(Mandatory = $true)]  
        $ServiceTags,
        [Parameter(Mandatory = $false)]  
        $ApiKey,
        [Parameter(Mandatory = $false)]
        $KeySecret
    ) 
    $ApiKey="l73295568a0b3a495285bc584a5f0594e7"
    $KeySecret="979f3851d09448bf8862ceda062921fb"

    [String]$servicetags = $ServiceTags -join ", "
    $AuthURI = "https://apigtwb2c.us.dell.com/auth/oauth/v2/token"
    $OAuth = "$ApiKey`:$KeySecret"
    $Bytes = [System.Text.Encoding]::ASCII.GetBytes($OAuth)
    $EncodedOAuth = [Convert]::ToBase64String($Bytes)
    $Headers = @{ }
    $Headers.Add("authorization", "Basic $EncodedOAuth")
    $Authbody = 'grant_type=client_credentials'
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Try {
        $AuthResult = Invoke-RESTMethod -Method Post -Uri $AuthURI -Body $AuthBody -Headers $Headers
        $Global:token = $AuthResult.access_token
    }
    Catch {
        $ErrorMessage = $Error[0]
        Write-Error $ErrorMessage
        BREAK        
    }
    <# Write-Host "Access Token is: $token`n" #>

    $headers = @{"Accept" = "application/json" }
    $headers.Add("Authorization", "Bearer $token")

    $params = @{ }
    $params = @{servicetags = $servicetags; Method = "GET" }

    $Global:response = Invoke-RestMethod -Uri "https://apigtwb2c.us.dell.com/PROD/sbil/eapi/v5/asset-entitlements" -Headers $headers -Body $params -Method Get -ContentType "application/json"

    foreach ($Record in $response) {
        $servicetag = $Record.servicetag
        $Json = $Record | ConvertTo-Json
        $Record = $Json | ConvertFrom-Json 
        $Device = $Record.productLineDescription
        $StartDate = ($Record.entitlements | Select -Last 1).startDate
        $StartDate = $StartDate | Get-Date -f "yyyy-MM-dd"
        $EndDate = ($Record.entitlements | Select -Last 1).endDate
        $Support = ($Record.entitlements | Select -Last 1).serviceLevelDescription
<#        $EndDate = $EndDate | Get-Date -f "MM-dd-y" #>
        $EndDate = $EndDate | Get-Date -f "yyyy-MM-dd"
        $today = get-date

        Write-Host -ForegroundColor White -BackgroundColor "DarkRed" $Computer
        Write-Host "Service Tag   : $servicetag"
        Write-Host "Model         : $Device"
        Write-Host "Warranty Beg. : $StartDate"
        if ($today -ge $EndDate) { Write-Host -NoNewLine "Warranty Exp. : $EndDate  "; Write-Host -ForegroundColor "Yellow" "[WARRANTY EXPIRED]" }
        else { Write-Host "Warranty Exp. : $EndDate" } 

<#        Write-Host "$servicetag,$StartDate,$EndDate" #>

        if (!($ClearEMS)) {
            $i = 0
            foreach ($Item in ($($WarrantyInfo.entitlements.serviceLevelDescription | select -Unique | Sort-Object -Descending))) {
                $i++
                Write-Host -NoNewLine "Service Level : $Item`n"
            }

        }
        else {
            $i = 0
            foreach ($Item in ($($WarrantyInfo.entitlements.serviceLevelDescription | select -Unique | Sort-Object -Descending))) {
                $i++
                Write-Host "Service Level : $Item`n"
            }
        }
    }
