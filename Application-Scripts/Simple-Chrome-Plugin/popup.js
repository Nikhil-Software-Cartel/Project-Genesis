document.getElementById("logHello").addEventListener("click", () => {
  chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
    const code = 'console.log("Hello, World!")';
    console.log(tabs[0]);
    console.log(document)
    // log window
    console.log(window)
    // wrap body element to half pixels
    document.body.style.backgroundColor = "red";

    
  });
});

