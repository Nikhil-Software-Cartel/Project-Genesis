# Define your project name and directory
echo $PSVersionTable
$projectName = "bci"
$projectDirectory = "C:\GitHub\OpenSource\Project-Genesis\Applicatrion-Scripts\Create-Python-Package\$projectName"

# Define required dependencies (replace with actual dependencies)
$dependencies = @(
    "requests",
    "python-socketio",
    "pymongo"
)

# Function to install dependencies
function Install-Dependencies {
    Write-Host "Installing $dependency..."
    # join dependencies into a single string
    pip install $dependencies
    Write-Host "$dependency installed."
}

# Function to create project structure
function Create-ProjectStructure {
    Write-Host "Creating project structure..."
    
    # Create project directory if it doesn't exist
    if (-not (Test-Path -Path $projectDirectory -PathType Container)) {
        New-Item -Path $projectDirectory -ItemType Directory | Out-Null
    }

    

    Write-Host "Project structure created."
}

# Main script
try {
    Install-Dependencies
    Create-ProjectStructure
    Write-Host "Project setup completed successfully."
}
catch {
    Write-Host "Error: $_"
}
