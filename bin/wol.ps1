#######################################################
##
## Wake-on-LAN.ps1, v1.1, 2021
##
## Adapted by Ammaar Limbada and Jeroen Wiert Pluimers
## Original Author: Matthijs ten Seldam, Microsoft (see: http://blogs.technet.com/matthts)
##
#######################################################
## Source:  https://gist.github.com/jpluimers/344ed287b784048349769a334f116b46
##
<#
.SYNOPSIS
Starts a list of physical machines by using Wake On LAN.
 
.DESCRIPTION
Wake sends a Wake On LAN magic packet to a given machine's MAC address.
 
# .PARAMETER MacAddress
# MacAddress of target machine to wake.
 
.EXAMPLE
Wake A0DEF169BE02
 
.INPUTS
None
 
.OUTPUTS
None
 
.NOTES
Supports all these MAC addresses formats:
- xx:xx:xx:xx:xx:xx (canonical)
- xx-xx-xx-xx-xx-xx (Windows)
- xxxxxx-xxxxxx (Hewlett-Packard switches)
- xxxxxxxxxxxx (Intel Landesk)
- xxxx.xxxx.xxxx (Cisco)
#>
 
 
param(
    [Parameter(HelpMessage = "MAC address of target machine to wake up")]
    [string] $MacAddress
) 
 
Set-StrictMode -Version Latest

function Send-Packet([string]$MacAddressString) {
    <#
    .SYNOPSIS
    Sends a number of magic packets using UDP broadcast.
 
    .DESCRIPTION
    Send-Packet sends a specified number of magic packets to a MAC address in order to wake up the machine.  
 
    .PARAMETER MacAddressString
    String with the MAC address of the machine to wake up.
    #>
 
    try {
        $Broadcast = ([System.Net.IPAddress]::Broadcast)
 
        ## Create UDP client instance
        $UdpClient = New-Object Net.Sockets.UdpClient
 
        ## Create IP endpoints for each port
        $IPEndPoint = New-Object Net.IPEndPoint $Broadcast, 9

        $BareMacAddressString = $MacAddress.ToUpper() -split "[:\.-]" -join "" # \ because it is a regular expression
 
        ## Construct physical address instance for the hardware MAC address of the machine (string to byte array)
        $MAC = [Net.NetworkInformation.PhysicalAddress]::Parse($BareMacAddressString)
 
        ## Construct the Magic Packet frame
        $Packet = [Byte[]](, 0xFF * 6) + ($MAC.GetAddressBytes() * 16)
 
        ## Broadcast UDP packets to the IP endpoint of the machine
        $UdpClient.Send($Packet, $Packet.Length, $IPEndPoint) | Out-Null
        $UdpClient.Close()
    }
    catch {
        $UdpClient.Dispose()
        $Error | Write-Error;
    }
}

## Send magic packet to wake machine


$Data='wol-macs.txt'
$MACAddresses = Get-Content $Data #This would be the full path to your text or csv file.
Foreach ($MACAddress in $MACAddresses) {
   Write-Output "Waking... $MacAddress"
   Send-Packet $MacAddress
   Start-Sleep -Seconds 2
   }
