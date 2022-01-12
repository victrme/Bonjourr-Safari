function show(enabled) {
    if (typeof enabled === "boolean") {
        document.body.classList.toggle(`on`, enabled);
        document.body.classList.toggle(`off`, !enabled);
    } else {
        document.body.classList.remove(`on`);
        document.body.classList.remove(`off`);
    }
}

document.querySelector("button.open-preferences").addEventListener("click", () => webkit.messageHandlers.controller.postMessage('open-preferences'));
