// capialize a word
const capitalize = (word) => {
  const firstLetter = word[0].toUpperCase();
  // whole word lower case
  const restOfWord = word.substring(1);
  // return firstLetter + restOfWord;
  return `${firstLetter}${restOfWord}`;
};

capitalize('ron');
capitalize('roN');
console.log(capitalize('rON'));
//=> Ron
