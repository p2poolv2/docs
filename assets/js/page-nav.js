// A link to the next page, placed at the end of each page. Readers go
// back with the browser, so there is no previous link.
//
// The sidebar already lists every page in navigation order, including
// pages inside collapsed sections, so the order is read from it rather
// than recomputed. Moving a page or changing its nav_order needs no
// change here.
(function () {
  function normalize(path) {
    return path.replace(/index\.html$/, "").replace(/\/+$/, "") || "/";
  }

  function nextLink(link) {
    var anchor = document.createElement("a");
    anchor.href = link.getAttribute("href");
    anchor.className = "page-nav-link";
    anchor.rel = "next";

    var label = document.createElement("span");
    label.className = "page-nav-label";
    label.textContent = "Next →";

    var title = document.createElement("span");
    title.className = "page-nav-title";
    title.textContent = link.textContent.trim();

    anchor.append(label, title);
    return anchor;
  }

  function addPageNav() {
    var links = Array.prototype.slice.call(
      document.querySelectorAll("#site-nav a.nav-list-link")
    );
    var here = normalize(window.location.pathname);
    var index = links.findIndex(function (link) {
      return normalize(new URL(link.href, window.location.href).pathname) === here;
    });
    var main = document.querySelector("#main-content main");
    if (index < 0 || index === links.length - 1 || !main) {
      return;
    }

    var nav = document.createElement("nav");
    nav.className = "page-nav";
    nav.setAttribute("aria-label", "Next page");
    nav.append(nextLink(links[index + 1]));
    main.append(nav);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", addPageNav);
  } else {
    addPageNav();
  }
})();
