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
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/asteroids.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/asteroid.js":
/*!*************************!*\
  !*** ./lib/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./lib/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./lib/moving_object.js\");\n\nconst COLOR = '#ccc';\nconst RADIUS = 40;\nconst LENGTH = 2.2;\n\nfunction Asteroid(pos, game) {\n  MovingObject.call(this, {\n    pos: pos,\n    vel: Util.randomVec((Math.random() * LENGTH)+0.3),\n    color: COLOR,\n    radius: RADIUS,\n    game: game\n  });\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./lib/asteroid.js?");

/***/ }),

/***/ "./lib/asteroids.js":
/*!**************************!*\
  !*** ./lib/asteroids.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("\nconsole.log('safety');\nconst CNV_WIDTH = 900;\nconst CNV_HEIGHT = 700;\n\ndocument.addEventListener('DOMContentLoaded', function() {\n  console.log('safety 2');\n\n  const CNV = document.getElementById('canvas');\n  CNV.height = CNV_HEIGHT;\n  CNV.width = CNV_WIDTH;\n\n  const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./lib/asteroid.js\");\n\n  const Bullet = __webpack_require__(/*! ./bullet.js */ \"./lib/bullet.js\");\n\n  const GameView = __webpack_require__(/*! ./game_view.js */ \"./lib/game_view.js\");\n\n  const Game = __webpack_require__(/*! ./game.js */ \"./lib/game.js\");\n\n  const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./lib/moving_object.js\");\n\n  const Ship = __webpack_require__(/*! ./ship.js */ \"./lib/ship.js\");\n\n  const Util = __webpack_require__(/*! ./util.js */ \"./lib/util.js\");\n\n  console.log('Webpack is working!');\n\n  window.gameView = new GameView(new Game(), CNV);\n});\n\n\n//# sourceURL=webpack:///./lib/asteroids.js?");

/***/ }),

/***/ "./lib/bullet.js":
/*!***********************!*\
  !*** ./lib/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function Bullet() {}\n\nmodule.exports = Bullet;\n\n\n//# sourceURL=webpack:///./lib/bullet.js?");

/***/ }),

/***/ "./lib/game.js":
/*!*********************!*\
  !*** ./lib/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./lib/asteroid.js\");\n\nconst DIM_X = 950;\nconst DIM_Y = 750;\nconst NUM_ASTEROIDS = 12;\n\nfunction Game() {\n  this.asteroids = [];\n  this.addAsteroids();\n}\n\nGame.prototype.randomPosition = function () {\n  return [Math.random() * DIM_X, Math.random() * DIM_Y];\n};\n\nGame.prototype.addAsteroids = function () {\n  for (var i = 0; i < NUM_ASTEROIDS; i++) {\n    this.asteroids.push(new Asteroid(this.randomPosition(), this));\n  }\n};\n\nGame.prototype.draw = function (ctx) {\n  ctx.clearRect(0, 0, DIM_X, DIM_Y);\n  this.asteroids.forEach((asteroid) => asteroid.draw(ctx));\n};\n\nGame.prototype.wrap = function(pos) {\n  let x = pos[0];\n  let y = pos[1];\n\n  if(x < -50) {\n    x = DIM_X;\n  } else if (x > DIM_X) {\n    x = -50;\n  }\n\n  if(y < -50) {\n    y = DIM_Y;\n  } else if (y > DIM_Y) {\n    y = -50;\n  }\n  return [x,y];\n};\n\nGame.prototype.moveObjects = function () {\n  this.asteroids.forEach((asteroid) => asteroid.move());\n  // this.checkCollisions();\n};\n\nGame.prototype.checkCollisions = function () {\n  for (var i = 0; i < this.asteroids.length - 1; i++) {\n    for (var j = i + 1; j < this.asteroids.length; j++) {\n      let asteroid1 = this.asteroids[i];\n      let asteroid2 = this.asteroids[j];\n\n      if (asteroid1.isCollidedWith(asteroid2)) {\n        console.log(\"COLLISION!\");\n        this.asteroids.splice(j,1);\n        this.asteroids.splice(i,1);\n      }\n    }\n  }\n};\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./lib/game.js?");

/***/ }),

/***/ "./lib/game_view.js":
/*!**************************!*\
  !*** ./lib/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function GameView(game, cnv) {\n  this.game = game;\n  this.ctx = cnv.getContext('2d');\n  this.start();\n}\n\nGameView.prototype.start = function() {\n  const view = this;\n  setInterval(function() {\n    view.game.moveObjects();\n    view.game.draw(view.ctx);\n  }, 20);\n};\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./lib/game_view.js?");

/***/ }),

/***/ "./lib/moving_object.js":
/*!******************************!*\
  !*** ./lib/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./lib/util.js\");\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function () {\n  // debugger\n  const x = this.pos[0] + this.vel[0];\n  const y = this.pos[1] + this.vel[1];\n  [this.pos[0],this.pos[1]] = this.game.wrap([x,y]);\n};\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n  let sumRadius = this.radius + otherObject.radius;\n\n  return sumRadius > Util.distance(this.pos, otherObject.pos);\n};\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./lib/moving_object.js?");

/***/ }),

/***/ "./lib/ship.js":
/*!*********************!*\
  !*** ./lib/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function Ship() {}\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./lib/ship.js?");

/***/ }),

/***/ "./lib/util.js":
/*!*********************!*\
  !*** ./lib/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  distance: function (pos1, pos2) {\n    const [x1, x2, y1, y2] = [pos1[0], pos2[0], pos1[1], pos2[1]];\n\n    return Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));\n  },\n\n  inherits: function (Child, Parent) {\n    function Surrogate() {}\n    Surrogate.prototype = Parent.prototype;\n    Child.prototype = new Surrogate();\n    Child.prototype.constructor = Child;\n  },\n\n  randomVec: function (length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  scale: function (vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./lib/util.js?");

/***/ })

/******/ });