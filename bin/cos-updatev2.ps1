# Define the repository URL and local path
$repoUrl = "https://github.com/ncsu-cos-it/win"
$localPath = "C:\opt\cos"

# Check if the local repository exists
if (Test-Path $localPath) {
    # If it exists, navigate to the repository and pull the latest changes
    # Write-Output "Repository exists. Pulling latest changes..."
    Set-Location $localPath
    git config --global --add safe.directory c:/Opt/cos
    git pull
} else {
    # If it doesn't exist, clone the repository
    # Write-Output "Repository does not exist. Cloning repository..."
    git clone $repoUrl $localPath
    $Acl = Get-ACL $localPath
    $AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $localPath $Acl
}
