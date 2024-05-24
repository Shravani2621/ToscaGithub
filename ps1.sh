cd C:\Tosca_Projects\ToscaGithub
# Define the directory to monitor
$directory = "C:\Tosca_Projects\ToscaGithub "

# Create a file system watcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $directory
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Define the action to take when changes are detected
$action = {
    $changeType = $Event.SourceEventArgs.ChangeType
    $path = $Event.SourceEventArgs.FullPath
    Write-Host "Change detected: $changeType - $path"
    
    # Prompt for confirmation
    $confirmation = Read-Host "Do you want to execute the Bash script? (Type 'ok' to confirm)"
    if ($confirmation -eq "ok") {
        # Execute your Bash script here
        Invoke-Expression -Command "C:\Tosca_Projects\ToscaGithub\push_pull_github.sh"
    } else {
        Write-Host "Bash script execution canceled."
    }
}
# Register the event handler
Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $action
# Keep the script running
while ($true) {
    Start-Sleep -Seconds 1
}

 
