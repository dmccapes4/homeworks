// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// //
// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

// mysteryScoping1();
// mysteryScoping2();
// mysteryScoping3();
// mysteryScoping4();
// mysteryScoping5();


function madLib(verb, adjective, noun) {
  console.log('We shall ' + verb.toUpperCase() + ' the '
   + adjective.toUpperCase() + ' ' + noun.toUpperCase());
}

// madLib("go", "red", "school")

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));
}

// isSubstring("time to program", "time");
// isSubstring("jump for joy", "joys");

function fizzbuzz(arr) {
  out = [];
  arr.forEach((element) => {
    if (element % 3 === 0 || element % 5 === 0) {
      out.push(element)
    }
  });
  console.log(out);
}

// fizzbuzz([1, 3, 5]);

const isPrime = num => {
  for(let i = 2; i < num; i++)
    if(num % i === 0) return false;
  return num !== 1;
}

// isPrime(5);
// isPrime(8);

const sumOfNPrimes = num => {
  out = 0;
  n = 1;
  for (i = 0; i < num; n++) {
    if (isPrime(n)) {
      i++;
      out += n;
    }
  }
  return out;
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(1));
// console.log(sumOfNPrimes(4));
