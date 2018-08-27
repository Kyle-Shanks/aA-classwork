Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

// For testing
// function Animal(name) {
//     this.name = name;
// }
//
// Animal.prototype.eat = function(food) { return `${this.name} eats ${food}.`; };
//
// function Cat(name, color) {
// 	Animal.call(this,name);
// 	this.color = color;
// }
// Cat.prototype.meow = function() { return 'Meow!'; };
//
// Cat.inherits(Animal)
