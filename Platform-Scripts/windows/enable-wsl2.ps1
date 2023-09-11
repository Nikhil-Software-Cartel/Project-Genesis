# Reference: https://learn.microsoft.com/en-us/windows/wsl/install-manual
# Description: Enable WSL2 on Windows 10 for use with Docker Desktop and other tools

# get elevation
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
     Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}
# Enable WSL2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Download the Linux kernel update package
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi

# Install the Linux kernel update package
Start-Process msiexec.exe -Wait -ArgumentList '/I wsl_update_x64.msi /quiet'

# Set WSL2 as default
wsl --set-default-version 2
wsl.exe --install   