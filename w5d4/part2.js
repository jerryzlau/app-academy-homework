//Phase I
//attempt 1
function titlelize(array, callback){
  let titlelized = array.map(el => `Mx. ${el} Jingleheimer Schmidt`);
  callback(titlelized);
};

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});


//attempt 2
function titlelize(el){
  el = `Mx. ${el} Jingleheimer Schmidt`;
  console.log(el);
};

["Mary", "Brian", "Leo"].forEach(el => titlelize(el));

//attempt 3
function titlelize(array){
  return array.map(el => `Mx. ${el} Jingleheimer Schmidt`);
};

titlelize(["Mary", "Brian", "Leo"]).forEach(el => console.log(el));


//Phase II
function Elephant(name, height, tricks_array){
  this.name = name;
  this.height = height;
  this.tricks_array = tricks_array;
}

Elephant.prototype.trumpet = function(){
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function(){
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick){
  this.tricks_array.push(trick);
};

Elephant.prototype.play = function(){
  index = Math.floor(Math.random() * this.tricks_array.length);
  console.log(`${this.name} is ${this.tricks_array[index]}!`);
};


//Phase III
Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};
