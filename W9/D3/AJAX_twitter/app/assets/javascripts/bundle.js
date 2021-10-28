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

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

// const webpack = require("webpack");


class FollowToggle {
    constructor(el) {
        // when using .dataset: use on a regular HTML element (NOT A jQuery obj), and switch attribute name
        // to camelcase
        // Also add "data-" in front on HTML attributes on the element
        // this.userId = el.dataset.userId;
        // this.followState = el.dataset.initialFollowState;

        // when using .data: MUST use it on a jQuery obj.
        // to make a jQuery obj: grab HTML ele, wrap HTML ele in $(ele)
        // Then call ".data("html-attribute-name")"
        this.userId = $(el).data("user-id");
        this.followState = $(el).data("initial-follow-state");
        
        this.el = el;
        this.render();
    }

    render() {
        const followState = $(this.el).data("initial-follow-state");
        if (followState === "Unfollowed") {
            $(this.el).text("Follow");
        } else {
            $(this.el).text("Unfollow");
        } //this.$el.innerHTML("follow"), why does this not work?
    }

    handleClick() {
        let button = this.el;

        $(button).on("click", e => { 
            e.preventDefault();
            debugger
            if (button.followState !== "Unfollowed") {
                return $.ajax ({ // return a promise object
                    method: 'POST',
                    url: `/users/${button.userId}/follow`,
                    data: {
                        button: button
                    },
                    dataType: "json"
                }).then(response => {
                    debugger
                    button.data("initial-follow-state", button.followState);
                });

            } else {
                return $.ajax ({ // returns a promise object
                    method: "DELETE",
                    url: `/users/${button.userId}/follow`,
                    data: {
                        button: button
                    },
                    dataType: "json"
                }).then(response => {
                    debugger
                    button.data("initial-follow-state", button.followState);
                });
            }
        });
    }
}

module.exports = FollowToggle;

// const $newImage = $(`<img user-id="${button.user-id}" initial-follow-state="${button.followState}">`);
// $gifDisplay.data("initial-follow-state", button.followState);

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(document).ready(function() {
    let $buttons = $(".follow-toggle");
    $buttons.each(function(idx, button) {
        new FollowToggle(button);
    });
});

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map