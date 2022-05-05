function show(enabled) {
    
    document.body.querySelector('.state').textContent = enabled ? "Bonjourr is active, you can close this window and open a new tab on Safari !" : "Bonjourr is not active, check Safari preferences !"
}

function openPreferences() {
    webkit.messageHandlers.controller.postMessage("open-preferences");
}

document.querySelector("button.open-preferences").addEventListener("click", openPreferences);
