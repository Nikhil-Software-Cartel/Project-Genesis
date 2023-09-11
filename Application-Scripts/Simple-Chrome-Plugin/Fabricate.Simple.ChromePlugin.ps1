# Specify extension details
$extensionName = "Simple-Chrome-Plugin"

$extensionPath = Join-Path $pwd $extensionName
echo "Creating extension at $extensionPath"

<# $chromeExePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"  #>
$chromeExePath = "C:\Program Files\Google\Chrome Dev\Application\chrome.exe" # Use this if you have Chrome Dev installed
$imagesFolderPath = Join-Path $extensionPath "images"
$default_icon = "./images/Genesis-Search.png"

# File Output Paths
$manifestPath = Join-Path $extensionPath "manifest.json"
$popupPath = Join-Path $extensionPath "popup.html"
$popupJsPath = Join-Path $extensionPath "popup.js"
$contentJsPath = Join-Path $extensionPath "content.js"


# Create extension folder
New-Item -Path $extensionPath -ItemType Directory -Force | Out-Null

# Create manifest.json
$manifestContent = @"
{
  "manifest_version": 3,
  "name": "$extensionName",
  "version": "1.0",
  "description": "Change the background color of the page",
  "permissions": ["activeTab"],
  "action": {
    "default_popup": "popup.html",
    "default_icon": {
      "16": "$default_icon",
      "48": "$default_icon",
      "128": "$default_icon"
    }
  },
  "icons": {
    "16": "$default_icon",
    "48": "$default_icon",
    "128": "$default_icon"
  },
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["content.js"]
    }
  ]
}
"@

# Create popup.html
$popupContent = @"
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      width: 150px;
    }
  </style>
</head>
<body>
  <button id="logHello">Log Hello</button>
  <script src="popup.js"></script>
</body>
</html>
"@


# Create popup.js
$popupJsContent = @"
document.getElementById("logHello").addEventListener("click", () => {
  chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
    const code = `
      console.log("Hello, World!");
    `;

    chrome.scripting.executeScript({
      target: { tabId: tabs[0].id },
      function: (code) => {
        chrome.scripting.executeScript({
          target: { tabId: tabs[0].id },
          function: eval(code)
        });
      },
      args: [code]
    });
  });
});

"@


# Create content.js
$contentJsContent = @"
// This script is injected into the content of the page
console.log("Content script loaded.");
"@

# Materialize The Content
$manifestContent | Out-File -FilePath $manifestPath -Encoding utf8
$popupContent | Out-File -FilePath $popupPath -Encoding utf8
$popupJsContent | Out-File -FilePath $popupJsPath -Encoding utf8
$contentJsContent | Out-File -FilePath $contentJsPath -Encoding utf8

# Create images folder and add icon images
New-Item -Path $imagesFolderPath -ItemType Directory -Force | Out-Null
Copy-Item -Path "./assets/Genesis-Search.png" -Destination $imagesFolderPath -Force


# Launch Chrome with the extension
Start-Process -FilePath $chromeExePath -ArgumentList "--load-extension=$extensionPath"
