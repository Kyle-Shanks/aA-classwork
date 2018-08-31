/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(arr) {\n    this.collection = arr;\n  }\n\n  html(str) {\n    if(str === undefined) {\n      return this.collection[0].innerHTML;\n    } else {\n      this.collection.forEach(el => el.innerHTML = str);\n    }\n  }\n\n  empty() {\n    this.collection.forEach(el => el.innerHTML = '');\n  }\n\n  append(input) {\n    if (typeof input === 'string') {\n      // Does not work with nested elements that have the same selector\n      // this.collection.forEach(el => el.innerHTML+=input);\n      for(let i = this.collection.length-1; i >= 0; i--) {\n        this.collection[i].innerHTML += input;\n      }\n    } else if (input instanceof HTMLElement) {\n      // this.collection.forEach(el => el.innerHTML+=input.outerHTML);\n      for(let i = this.collection.length-1; i >= 0; i--) {\n        this.collection[i].innerHTML += input.outerHTML;\n      }\n    } else if(input instanceof DOMNodeCollection) {\n      // this.collection.forEach(el => {\n      //   input.collection.forEach(inputEl => el.innerHTML += inputEl.outerHTML);\n      // });\n      for(let i = this.collection.length-1; i >= 0; i--) {\n        input.collection.forEach(inputEl => this.collection[i].innerHTML += inputEl.outerHTML);\n      }\n    }\n  }\n\n  attr(attrName, attrVal) {\n    if( attrVal === undefined ) {\n      return this.collection[0].getAttribute(attrName);\n    } else {\n      this.collection.forEach(el => el.setAttribute(attrName, attrVal));\n    }\n  }\n\n  addClass(newClass) {\n    this.collection.forEach(el => {\n      if (!el.className.includes(newClass)) {\n        el.className += \" \"+newClass;\n      }\n    });\n  }\n\n  removeClass(oldClass) {\n    this.collection.forEach(el => {\n      if (el.className.includes(oldClass)) {\n        const classArr = el.className.split(' ');\n        const index = classArr.indexOf(oldClass);\n        classArr.splice(index,1);\n        el.className = classArr.join(' ');\n      }\n    });\n  }\n\n  children() {\n    let childrenArr = [];\n    this.collection.forEach(el => childrenArr = childrenArr.concat(Array.from(el.children)));\n    return new DOMNodeCollection(childrenArr);\n  }\n\n  parent() {\n    const parentArr = [];\n    this.collection.forEach(el => {\n      if(!(parentArr.includes(el.parentElement))) {\n        parentArr.push(el.parentElement);\n      }\n    });\n    return new DOMNodeCollection(parentArr);\n  }\n\n  find(selector) {\n    let target = [];\n    this.collection.forEach(el => target = target.concat(Array.from(el.querySelectorAll(selector))));\n    return new DOMNodeCollection(target);\n  }\n\n  remove() {\n    this.empty();\n    this.collection.forEach(el => {\n      const par = el.parentElement;\n      par.removeChild(el);\n    });\n  }\n\n  // Event Handling\n  on(listenerType, cb) {\n    this.collection.forEach(el => {\n      el.addEventListener(listenerType, cb);\n      el[listenerType+'Callback'] = cb;\n    });\n  }\n\n  off(listenerType) {\n    this.collection.forEach(el => {\n      el.removeEventListener(listenerType, el[listenerType+'Callback']);\n      el[listenerType+'Callback'] = null;\n    });\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\nconst $l = function(input) {\n  if (typeof input === 'function'){\n    document.addEventListener(\"DOMContentLoaded\", input);\n  } else if (input instanceof HTMLElement) {\n    return new DOMNodeCollection([input]);\n  } else if (typeof input === 'string') {\n    const list = Array.from(document.querySelectorAll(input));\n    return new DOMNodeCollection(list);\n  }\n\n};\n\n$l.extend = function(...objs) {\n  if (objs.length <= 1) { return null; }\n  const obj = objs[0];\n  for (var i = 1; i < objs.length; i++) {\n    for (let key in objs[i]) {\n      obj[key] = objs[i][key];\n    }\n  }\n  return obj;\n};\n\n$l.ajax = function(options) {\n  const request = new XMLHttpRequest();\n\n  const defaultOptions = {\n    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',\n    data: {},\n    error: (res) => { console.log('Error!', res); },\n    method: 'GET',\n    success: (res) => { console.log('Success!', res); },\n    url: 'https://api.giphy.com/v1/gifs/random?tag=puppies&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G',\n  };\n\n  options = $l.extend(defaultOptions, options);\n\n  request.open(options.method, options.url, true);\n  request.onload = function () {\n    console.log(request.status);\n    console.log(request.responseType);\n    console.log(request.response);\n  };\n\n  // request.setRequestHeader('Access-Control-Allow-Origin', '*');\n  request.send(JSON.stringify(options.data));\n};\n\nwindow.$l = $l;\n\n$l( () => {\n  console.log('document loaded');\n  $l('li').on('click', ()=>{console.log('click');});\n});\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });