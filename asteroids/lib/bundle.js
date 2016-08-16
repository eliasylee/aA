/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./game.js\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	const GameView = __webpack_require__(5);

	document.addEventListener("DOMContentLoaded", function() {
	  const canvas = document.getElementById("game-canvas");
	  canvas.height = window.innerHeight;
	  canvas.width = window.innerWidth;

	  let ctx = canvas.getContext('2d');
	  let game = new Game(canvas.width, canvas.height);

	  new GameView(game, ctx).start();
	});


/***/ },

/***/ 5:
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./game.js\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

	function GameView (game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	}

	GameView.prototype.start = function () {
	  let gameView = this;

	  function step() {
	    gameView.game.draw(gameView.ctx)
	    gameView.game.moveObjects()
	    window.requestAnimationFrame(step)
	  }

	  step()
	}

	module.exports = GameView;


/***/ }

/******/ });