function validateForm(inputInfo, formName) {
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

    for (const { selector, text } of inputInfo) {
        const elem = document.querySelector(selector);
        if (elem.validity.valueMissing || !elem.value) {
            elem.addEventListener('input', () => elem.setCustomValidity(''));
            elem.addEventListener('invalid', () => elem.setCustomValidity(`${text}을/를 입력하세요.`));
            return false;
        }
    }

    document[formName].submit();
}

const userInfo = [
    {
        selector: 'input#user_id',
        text: '아이디',
    },
    {
        selector: 'input#user_pw',
        text: '비밀번호',
    }];
const postContents = [
    {
        selector: 'input#title',
        text: '제목',
    },
    {
        selector: 'textarea#content',
        text: '내용',
    }];

// 위의 세 개는 안됨
// document.LoginForm.addEventListener('submit', function() {
// document.querySelector('form[name=LoginForm]').addEventListener('submit', function() {
// document.querySelector('input#submitBtn').addEventListener('submit', function() {

document.querySelector('form[name="LoginForm"] input#submitBtn')?.addEventListener('click', () => validateForm(userInfo, 'LoginForm'));
document.querySelector('form[name="RegistrationForm"] button#submitBtn')?.addEventListener('click', () => validateForm(postContents, 'RegistrationForm'));
document.querySelector('form[name="EditForm"] button#submitBtn')?.addEventListener('click', () => validateForm(postContents, 'EditForm'));