const Asteroid = require('./asteroid.js');

function Game (xDim, yDim) {
  this.DIM_X = xDim;
  this.DIM_Y = yDim;
  this.NUM_ASTEROIDS = 20;

  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    this.asteroids.push(new Asteroid(this.randomPosition()));
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
  let curX = pos[0]
  let curY = pos[1]

  if (curX > this.DIM_X) {
    let curX = 0;
    let curY = Math.random() * this.DIM_Y;
  } else if (curX < 0) {
    let curX = this.DIM_X;
    let curY = Math.random() * this.DIM_Y;
  } else if (curY > this.DIM_Y) {
    let curY = 0;
    let curX =  = Math.random() * this.DIM_X;
  }
}

module.exports = Game;
