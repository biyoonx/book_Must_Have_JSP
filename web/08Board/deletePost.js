export default function deletePost() {
    const confirmed = confirm("정말로 삭제하시겠습니까?");
    if (confirmed) {
        const form = document.viewFrm;
        form.method = "post"; // 기본적으로 get, post만 제공
        form.action = "DeleteProcess.jsp";
        form.submit();
    }
}
window.deletePost = deletePost;