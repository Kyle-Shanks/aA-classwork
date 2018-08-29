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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: 'json'
    });
  },

  unfollowUser: id => {
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: 'json'
    });
  },

  searchUsers(queryVal, successCB) {
    return $.ajax({
      method: 'GET',
      url: '/users/search',
      data: { query: queryVal },
      dataType: 'json',
      success: successCB
    });
  },

  createTweet(data) {
    return $.ajax({
      method: 'POST',
      url: '/tweets',
      data: data,
      dataType: 'json'
    });
  }
};

module.exports = APIUtil;


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = (this.$el.data('user-id') || options.userId);
    this.followState = (this.$el.data('initial-follow-state') || options.followState);
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    let buttonText;
    if (this.followState === 'followed') {
      buttonText = 'Unfollow!';
    } else if (this.followState === 'unfollowed') {
      buttonText = 'Follow!';
    }
    this.$el.text( buttonText );
  }

  handleClick(event) {
    event.preventDefault();
    this.$el.prop('disabled', true);

    const onSuccessFunc = (newStatus) => {
      this.followState = newStatus;
      this.render();

    };

    if (this.followState === 'followed') {
      this.$el.text('Unfollowing...');
      APIUtil.unfollowUser(this.userId).then((response) => {
        onSuccessFunc('unfollowed');
        console.log(response);
        this.$el.prop('disabled', false);
      });
    } else if (this.followState === 'unfollowed') {
      this.$el.text('Following...');
      APIUtil.followUser(this.userId).then((response) => {
        onSuccessFunc('followed');
        console.log(response);
        this.$el.prop('disabled', false);
      });
    }
  }
}

module.exports = FollowToggle;


/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on('submit', this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    this.$el.children('input').prop('disabled', true);
    APIUtil.createTweet(this.$el.serializeJSON()).then(this.handleSuccess.bind(this));
  }

  clearInput() {
    this.$el.find('textarea, select').val("");
  }

  handleSuccess(response) {
    this.clearInput();
    this.$el.children('input').prop('disabled', false);
    const $li = $('<li>');
    $li.html(`${response.content} -- <a href="/users/${response.user.id}">
              ${response.user.username}</a> -- ${response.created_at}`);

    // Also do mentions ul

    $(this.$el.data('tweets-ul')).prepend($li);
  }
}

module.exports = TweetCompose;


/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet_compose.js */ "./frontend/tweet_compose.js");

$(() => {
  $('button.follow-toggle').each(function(idx, el) {
    new FollowToggle(el);
  });

  $('.users-search').each(function(idx, el) {
    new UsersSearch(el,
                    document.getElementById('user-name'),
                    document.getElementsByClassName('users')[0]
                   );
  });

  $('.tweet-compose').each(function(idx,el) {
    new TweetCompose(el);
  });
});


/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

class UsersSearch {
  constructor(el, input, ul) {
    this.$el = $(el);
    this.$input = $(input);
    this.$ul = $(ul);

    this.$input.on('keydown', this.handleInput.bind(this));
  }

  handleInput(event) {

    const successCB = (response) => {
      this.renderResults(response);
    };

    APIUtil.searchUsers(this.$input.val(), successCB);
  }

  renderResults(users) {
    this.$ul.empty();

    for (const idx in users) {
      const options = {
        userId: users[idx].id,
        followState: users[idx].followed ? 'followed' : 'unfollowed'
      };
      const $button = $('<button class="follow-toggle">');

      const $li = $(`<li><a href="/users/${users[idx].id}">
                      ${users[idx].username}
                    </a></li>`);
      $li.append($button);
      this.$ul.append($li);

      new FollowToggle($button[0], options);
    }
  }
}

module.exports = UsersSearch;


/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map