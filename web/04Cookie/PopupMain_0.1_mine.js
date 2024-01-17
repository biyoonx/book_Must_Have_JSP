const closePopup= document.querySelector('#closePopup');
if (closePopup) {
    closePopup.addEventListener('click', () => {
        document.querySelector('#popup').style.display = 'none';
        const isPopupMode = document.querySelector('#inactivePopup');
        if (isPopupMode.checked) {
            fetchPopupMode(isPopupMode.value)
                .then(res => {
                    window.location.reload();
                });
        }
    })
}

async function fetchPopupMode(data) {
    const url = `./PopupCookie.jsp?isPopupMode=${data}`
    const request = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        }
    }
    await fetch(url, request);
}