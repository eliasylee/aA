const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

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
