export default function validateForm(form) {
        const alertFocus = (type, text) => {
            if (!form[type].value) {
                alert(`${"${text}"}을 입력하세요.`);
                form[type].focus();
                return false;
            }
        };

        const resultTitle = alertFocus('title', '제목');
        const resultContent = alertFocus('content', '내용');
        return resultTitle && resultContent;
}

    /* function validateForm(form) {
        if (form.title.value == '') {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == '') {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
    } */