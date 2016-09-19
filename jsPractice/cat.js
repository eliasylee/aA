function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(`Everyone loves ${this.name}`);
}

let cat1 = new Cat("Bob", "Bob");
let cat2 = new Cat("Jackie", "Obama");
let cat3 = new Cat("Eli", "Obama");
let cat4 = new Cat("Sally", "Stukov");
let cat5 = new Cat("Curie", "Markov");

cat1.cuteStatement();
cat2.cuteStatement();
cat3.cuteStatement();
cat4.cuteStatement();
cat5.cuteStatement();

Cat.prototype.meow = function() {
  console.log(`Meow my name is ${this.name}`);
}

cat1.meow = function() {
  console.log(`ROOOOAR`);
}

cat1.meow();
cat2.meow();
cat3.meow();
cat4.meow();
cat5.meow();
