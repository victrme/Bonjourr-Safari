const show = (enabled) => document.body.className = enabled ? 'on' : 'off'
const postMessage = msg => webkit.messageHandlers.controller.postMessage(msg)

document.querySelector("button.open-preferences").addEventListener("click", () => postMessage('open-preferences'));
document.querySelector("button.close-window").addEventListener("click", () => postMessage('close-window'));

