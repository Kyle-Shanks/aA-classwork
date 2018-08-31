class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    document.addEventListener('hashchange', (event) => {
      this.render();
    });
  }

  render() {
    this.node.innerHTML = "";
    const routeName = this.activeRoute();
    const p = document.createElement('p');
    p.innerHTML = routeName;
    this.node.appendChild(p);
  }

  activeRoute() {
    return window.location.hash.slice(1);
  }
}
