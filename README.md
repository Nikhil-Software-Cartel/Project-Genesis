# About this repository

<!-- write a brief overview
    this project is project for creating projects. it has 1 click installers and builders to setup your project in seconds. recommend powershell for windows users. 
 -->

This project is project for creating projects. it has 1 click installers and builders to setup your project in seconds.

## Setup the Language Interpreters

these language interpreters are required to run any scripts/applications. windows does not provide them by default. npm is package manager for nodejs. pip is package manager for python. open cmd or powershell and run the following commands to install them.

- nodejs
  - `winget install -e --id OpenJS.Nodejs`
- python
  - `winget install -e --id Python.Python`

## Setup the Installers

these installers will allow you to install the project in 1 click. they are not installed in default windows distro, and you need to install them manually. most are provided here to give you the best developer experience and save your time. open cmd or powershell and run the following commands to install them.

- powershell
  - `winget install -e --id Microsoft.PowerShell`
- chocolatey for windows users. 1 click installer
