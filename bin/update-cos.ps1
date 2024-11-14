# Define the repository URL and local path
$repoUrl = "https://github.com/ncsu-cos-it/win"
$localPath = "C:\opt\cos"

# Check if the local repository exists
if (Test-Path $localPath) {
    # If it exists, navigate to the repository and pull the latest changes
    Write-Output "Repository exists. Pulling latest changes..."
    Set-Location $localPath
    git pull
} else {
    # If it doesn't exist, clone the repository
    Write-Output "Repository does not exist. Cloning repository..."
    git clone $repoUrl $localPath
}
