function pullDown() {
  const icon = document.getElementById("icon");
  const pullDownParents = document.getElementById("pull-down");
  const pullDownChild = document.querySelectorAll(".pull-down-list");

  icon.addEventListener("click", function () {
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;");
    } else {
      pullDownParents.setAttribute("style", "display:block;");
    }
  });
  pullDownChild.forEach( function(list) {
    list.addEventListener("mouseover", function() {
      list.setAttribute("style", "text-decoration:none;");
      list.setAttribute("style", "color:#ff7f50;");
    });
  });
  pullDownChild.forEach( function(list) {
    list.addEventListener("mouseout", function() {
      list.removeAttribute("style", "text-decoration:none;");
      list.removeAttribute("style", "color:#ff7f50;");
    });
  });
}

window.addEventListener("load", pullDown);
