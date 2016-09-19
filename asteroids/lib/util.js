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
