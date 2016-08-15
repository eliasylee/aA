const Util = require('./util.js');


function Asteroid() {
  this.color = "d3d3d3";
  this.radius = 25;
}
Util.inherits(Asteroid, MovingObject);
