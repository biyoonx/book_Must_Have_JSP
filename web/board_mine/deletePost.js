function deletePost(formName) {
    const answer = confirm("정말로 삭제하시겠습니까?");
    if (answer) {
        const form = document[formName];
        form.method = 'post';
        form.action = 'DeleteProcess.jsp';
        form.submit();
    } else {
        return false;
    }
}

document.querySelector('form[name="DetailForm"] button#deleteBtn')?.addEventListener('click', () => deletePost('DetailForm'));