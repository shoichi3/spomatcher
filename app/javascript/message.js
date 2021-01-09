function message() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formData = new FormData(document.getElementById("form"));
    const url = location.pathname
    const XHR = new XMLHttpRequest();
    XHR.open("POST", url, true);
    XHR.responseText = "json";
    XHR.send(formData);
  })
}