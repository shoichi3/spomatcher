function topPage() {
  const posts = document.querySelectorAll(".post-link");

  posts.forEach((post) => {
    post.addEventListener("mouseover", () => {
      post.setAttribute("style", "text-decoration: none; color: black ;");
    });
  });
  posts.forEach((post) => {
    post.addEventListener("mouseout", () => {
      post.removeAttribute("style", "text-decoration: none; color: black ;");
    });
  });
}

const pathName = location.pathname;
if (pathName == '/') {
  window.addEventListener("load", topPage);
}