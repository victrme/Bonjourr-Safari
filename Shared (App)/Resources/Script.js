function show(platform, enabled) {
    
    // Removed iOS condition because it doesn't seem to be working
    
    if (platform === "mac") {
        document.querySelector('.state').textContent = enabled ? "Bonjourr is active, you can close this window and open a new tab on Safari !" : "Bonjourr is not active, check Safari preferences !"
        
        const button = document.querySelector("button.open-preferences")
        button.style.display = "block"
        button.style.pointerEvents = "all"
        button.addEventListener("click", openPreferences);
        
       document.querySelector('h1').style.display = "inline"
    }
}

function openPreferences() {
    webkit.messageHandlers.controller.postMessage("open-preferences");
}

window.onload = function() {
    document.body.style.opacity = "1"

}
