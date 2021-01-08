function messagePartner () {
  const lists = document.querySelectorAll(".user-list");
  const links = document.querySelectorAll(".message-link");

  lists.forEach((list) => {
    list.addEventListener("mouseover", () => {
      list.setAttribute("style", "background-color: #f5f5f5;");
    });
  });
  lists.forEach((list) => {
    list.addEventListener("mouseout", () => {
      list.removeAttribute("style", "background-color: #f5f5f5;");
    });
  });
  links.forEach((link) => {
    link.addEventListener("mouseover", () => {
      link.setAttribute("style", "text-decoration: none; color: black;");
    });
  });
  links.forEach((link) => {
    link.addEventListener("mouseout", () => {
      link.removeAttribute("style", "text-decoration: none; color: black;");
    });
  });
}

window.addEventListener("load", messagePartner);