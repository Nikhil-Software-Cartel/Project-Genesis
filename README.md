<img src="./banner.gif" width="100%" height="auto" />

# Welcome to Project-Genesis
![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)
![GitHub license](https://img.shields.io/badge/PyPI-Python-blue)
![GitHub license](https://img.shields.io/badge/npmjs-Javascript-yellow)
![GitHub license](https://img.shields.io/badge/setup-WinGet-black)

Are you ready to simplify your project creation process and streamline your development workflow? Look no further! This repository is your one-stop solution for making project setup a breeze. windows for now, but linux and mac support is coming soon. you can run powershell scripts on linux and mac as its cross platform, but you'll have to install the language interpreters manually.

  - Application-Scripts : contains kickstart code to publish your application on the global platform.
    - npm package : contains kickstart code to publish your npm package to npm registry.
    - python package : contains kickstart code to publish your python package to pypi registry.
    - chrome extension : contains kickstart code to publish your chrome extension to chrome web store.

  - Platform-Scripts: has helper scripts to automate your development workflow, and setup any prerequsites

## Setting Up Language Interpreters
Before you can run any scripts or applications, you need to ensure that the necessary language interpreters are installed. Windows doesn't include them by default, so you'll have to install them manually. these do not interfere with each other. and are available as executables. for example after installing node.js, you can run `node` in your terminal to start the node.js interpreter. a restart may be required after installation to update paths of newly installed packages, most of the time closing all terminals and reopening them is enough.

### Node.js
```
winget install -e --id OpenJS.Nodejs
```
### Python
```
winget install -e --id Python.Python
```
### PowerShell
```
winget install -e --id Microsoft.PowerShell
```
### Chocolatey (For Windows Users)
```
winget install -e --id Chocolatey.Chocolatey
```