function sumAll(){
    if(arguments.length === 0){
        return -999;
    }
    let sum = 0;
    for(let num of arguments){
        sum += num;
    }
    return sum;
}
console.log(sumAll());
console.log(sumAll(1));
console.log(sumAll(1, 2, 3));
console.log(sumAll(10, 20, 30, 40));
