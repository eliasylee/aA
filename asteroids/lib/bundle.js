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
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
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
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(2);

	function Game (xDim, yDim) {
	  this.DIM_X = xDim;
	  this.DIM_Y = yDim;
	  this.NUM_ASTEROIDS = 20;

	  this.asteroids = [];
	  this.addAsteroids();
	}

	Game.prototype.addAsteroids = function () {
	  while (this.asteroids.length < this.NUM_ASTEROIDS) {
	    this.asteroids.push(new Asteroid(this.randomPosition(), this));
	  }
	};

	Game.prototype.randomPosition = function () {
	  let xPos = Math.random() * this.DIM_X;
	  let yPos = Math.random() * this.DIM_Y;
	  return [xPos, yPos];
	};


	Game.prototype.draw = function (ctx) {
	  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
	  ctx.fillStyle = 'white';
	  ctx.fillRect(0, 0, this.DIM_X, this.DIM_Y);

	  this.asteroids.forEach(function (asteroid) {
	    asteroid.draw(ctx);
	  });
	};

	Game.prototype.moveObjects = function() {
	  this.asteroids.forEach(function (asteroid) {
	    asteroid.move();
	  });
	};

	Game.prototype.wrap = function (pos) {
	  let curX = pos[0];
	  let curY = pos[1];

	  if (curX > this.DIM_X) {
	    curX = 0;
	    curY = Math.random() * this.DIM_Y;
	  } else if (curX < 0) {
	    curX = this.DIM_X;
	    curY = Math.random() * this.DIM_Y;
	  } else if (curY > this.DIM_Y) {
	    curY = 0;
	    curX = Math.random() * this.DIM_X;
	  } else if (curY < 0) {
	    curY = this.DIM_Y;
	    curX = Math.random() * this.DIM_X;
	  }

	  return [curX, curY];
	};

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(3);
	const MovingObject = __webpack_require__(4);

	function Asteroid(pos, game) {
	  let options = { pos: pos,
	                  color: "gray",
	                  radius: 25,
	                  vel: Util.randomVec(10),
	                  game: game
	                };

	  MovingObject.call(this, options);
	}
	Util.inherits(Asteroid, MovingObject);

	module.exports = Asteroid;


/***/ },
/* 3 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate () {}
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  randomVec (length) {
	    let dx = (Math.random() * length) - 1;
	    let dy = (Math.random() * length) - 1;
	    return [dx, dy];
	  }
	};

	module.exports = Util;


/***/ },
/* 4 */
/***/ function(module, exports) {

	function MovingObject (options) {
	  this.pos = options.pos;
	  this.vel = options.vel;
	  this.radius = options.radius;
	  this.color = options.color;
	  this.game = options.game;
	}

	MovingObject.prototype.draw = function (ctx) {
	  ctx.fillStyle = this.color;
	  ctx.beginPath();
	  ctx.arc(
	    this.pos[0], //x
	    this.pos[1], //y
	    this.radius, //radius
	    0,
	    2 * Math.PI,
	    true
	  );

	  ctx.fill();
	};

	MovingObject.prototype.move = function () {
	  this.pos = this.game.wrap(this.pos);
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	};

	module.exports = MovingObject;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);

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
/******/ ]);