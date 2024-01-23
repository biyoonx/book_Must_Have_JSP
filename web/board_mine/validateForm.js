function validateForm(form) {
    // const userId = document.querySelector('input#user_id');
    // const userPw = document.querySelector('input#user_pw');
    // if (userId.validity.valueMissing || !userId.value) {
    //     userId.addEventListener('input', () => userId.setCustomValidity(''));
    //     userId.addEventListener('invalid', () => userId.setCustomValidity('아이디를 입력하세요.'));
    //     return false;
    // } else if (userPw.validity.valueMissing || !userPw.value) {
    //     userPw.addEventListener('input', () => userPw.setCustomValidity(''));
    //     userPw.addEventListener('invalid', () => userPw.setCustomValidity('비밀번호를 입력하세요.'));
    //     return false;
    // }

    const userInfo = [
        {
            selector: 'input#user_id',
            text: '아이디',
        },
        {
            selector: 'input#user_pw',
            text: '비밀번호',
        }];
    for (const { selector, text } of userInfo) {
        const elem = document.querySelector(selector);
        if (elem.validity.valueMissing || !elem.value) {
            elem.addEventListener('input', () => elem.setCustomValidity(''));
            elem.addEventListener('invalid', () => elem.setCustomValidity(`${text}를 입력하세요.`));
            return false;
        }
    }

    form.submit();
}

// 위의 세 개는 안됨
// document.LoginForm.addEventListener('submit', function() {
// document.querySelector('form[name=LoginForm]').addEventListener('submit', function() {
// document.querySelector('input#submitBtn').addEventListener('submit', function() {
document.querySelector('input#submitBtn').addEventListener('click', function() {
    return validateForm(this);
})