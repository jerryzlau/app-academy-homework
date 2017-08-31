function madLib(verb, adjective, noun){
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
};

function isSubstring(searchString, subString){
  // return searchString.indexOf(subString) !== -1
  return searchString.includes(subString);
};

function fizzBuzz(array){
  const fizzed = [];

  array.forEach(el => {
    if ((el%3 === 0) || (el % 5 === 0)){
      fizzed.push(el);
    }
  });
  return fizzed;
};

function isPrime(n){
  if (n<2) return false;
  for(i = 2; i < n; i++){
    if (n%i === 0){
      return false;
    };
  }
  return true;
};

function sumOfPrimes(n){
  let result = 0;
  for(let i=2; i<=n;i++){
    if (isPrime(i)){
      result += i;
    }
  }
  return result;
};
