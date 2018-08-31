document.addEventListener('DOMContentLoaded',() => {
  const sidebarLis = Array.from(document.querySelectorAll('.sidebar-nav li'));

  sidebarLis.forEach(el => el.addEventListener('click', event => {
    const text = event.currentTarget.innerText.toLowerCase();
    window.location.hash = text;
  }));
});
