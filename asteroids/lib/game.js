const Asteroid = require('./asteroid');

function Game(xDim, yDim) {
  this.DIM_X = xDim;
  this.DIM_Y = yDim;
  this.NUM_ASTEROIDS = (xDim * yDim)/375;

  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    this.asteroids.push(new Asteroid(this.randomPosition));
  }
};

Game.prototype.randomPosition = function () {
  let xPos = Math.random() * this.xDim;
  let yPos = Math.random() * this.yDim;

  return [xPos, yPos];
};


Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  this.asteroids.forEach(function (asteroid) {
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(function (asteroid) {
    asteroid.move();
  });
};
