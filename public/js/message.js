let messageBox = document.querySelector('#alert-5');

/* parfois message box est pas la  !
ex: quand il est sur son cellier sans avoir rien modifier ou ajouter
il y aura une erreur messagebox not defined */
if (messageBox) {
    messageBox.addEventListener('onBlur', ()=>{
        messageBox.remove()
        window.location.href = '/bouteille/cellier';
    })
    let xButton = document.querySelector('[data-dismiss-target]')
    xButton.addEventListener('click', ()=>{
        console.log('x')
        messageBox.remove();
        window.location.href = '/bouteille/cellier';
    })
    
}