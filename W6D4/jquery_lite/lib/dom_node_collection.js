class DOMNodeCollection {
  constructor(arr) {
    this.collection = arr;
  }

  html(str) {
    if(str === undefined) {
      return this.collection[0].innerHTML;
    } else {
      this.collection.forEach(el => el.innerHTML = str);
    }
  }

  empty() {
    this.collection.forEach(el => el.innerHTML = '');
  }

  append(input) {
    if (typeof input === 'string') {
      // Does not work with nested elements that have the same selector
      // this.collection.forEach(el => el.innerHTML+=input);
      for(let i = this.collection.length-1; i >= 0; i--) {
        this.collection[i].innerHTML += input;
      }
    } else if (input instanceof HTMLElement) {
      // this.collection.forEach(el => el.innerHTML+=input.outerHTML);
      for(let i = this.collection.length-1; i >= 0; i--) {
        this.collection[i].innerHTML += input.outerHTML;
      }
    } else if(input instanceof DOMNodeCollection) {
      // this.collection.forEach(el => {
      //   input.collection.forEach(inputEl => el.innerHTML += inputEl.outerHTML);
      // });
      for(let i = this.collection.length-1; i >= 0; i--) {
        input.collection.forEach(inputEl => this.collection[i].innerHTML += inputEl.outerHTML);
      }
    }
  }

  attr(attrName, attrVal) {
    if( attrVal === undefined ) {
      return this.collection[0].getAttribute(attrName);
    } else {
      this.collection.forEach(el => el.setAttribute(attrName, attrVal));
    }
  }

  addClass(newClass) {
    this.collection.forEach(el => {
      if (!el.className.includes(newClass)) {
        el.className += " "+newClass;
      }
    });
  }

  removeClass(oldClass) {
    this.collection.forEach(el => {
      if (el.className.includes(oldClass)) {
        const classArr = el.className.split(' ');
        const index = classArr.indexOf(oldClass);
        classArr.splice(index,1);
        el.className = classArr.join(' ');
      }
    });
  }

  children() {
    let childrenArr = [];
    this.collection.forEach(el => childrenArr = childrenArr.concat(Array.from(el.children)));
    return new DOMNodeCollection(childrenArr);
  }

  parent() {
    const parentArr = [];
    this.collection.forEach(el => {
      if(!(parentArr.includes(el.parentElement))) {
        parentArr.push(el.parentElement);
      }
    });
    return new DOMNodeCollection(parentArr);
  }

  find(selector) {
    let target = [];
    this.collection.forEach(el => target = target.concat(Array.from(el.querySelectorAll(selector))));
    return new DOMNodeCollection(target);
  }

  remove() {
    this.empty();
    this.collection.forEach(el => {
      const par = el.parentElement;
      par.removeChild(el);
    });
  }

  // Event Handling
  on(listenerType, cb) {
    this.collection.forEach(el => {
      el.addEventListener(listenerType, cb);
      el[listenerType+'Callback'] = cb;
    });
  }

  off(listenerType) {
    this.collection.forEach(el => {
      el.removeEventListener(listenerType, el[listenerType+'Callback']);
      el[listenerType+'Callback'] = null;
    });
  }
}

module.exports = DOMNodeCollection;
