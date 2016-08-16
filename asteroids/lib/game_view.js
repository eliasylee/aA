const Game = require('./game.js');

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
