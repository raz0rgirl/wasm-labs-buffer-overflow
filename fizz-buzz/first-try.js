/**
 * @param {number} n
 * @return {string[]}
 */
var fizzBuzz = function(n) {
    let answer = [];
    
    for(i = 1; i <= n; i++) {
        let shouldBeFizz = i % 3 === 0;
        let shouldBeBuzz = i % 5 === 0;
        let shouldBeFizzBuzz = i % 3 === 0 && i % 5 === 0;

        if(shouldBeFizzBuzz) {
            answer.push("FizzBuzz");
        }else if(shouldBeFizz) {
            answer.push("Fizz");
        } else if(shouldBeBuzz){
            answer.push("Buzz");
        } else { 
            answer.push(`${i}`);
        }
    
    }

    return answer;

}

console.log(fizzBuzz(3));
console.log(fizzBuzz(5));
console.log(fizzBuzz(15));