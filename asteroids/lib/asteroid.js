const Util = require('./util');
const MovingObject = require('./moving_object');

function Asteroid(pos) {
  let options = { pos: pos,
                  color: "d3d3d3",
                  radius: 25,
                  vel: Util.randomVec()
                };

  new MovingObject(options).bind(this);
}
Util.inherits(Asteroid, MovingObject);
