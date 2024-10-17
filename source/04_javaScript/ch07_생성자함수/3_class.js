// class : ECMA Script 6
// caniuse.com
class Person{
    constructor(name, first, second){//생성자 함수 이름은 무조건 constructor
        console.log('생성자 함수 호출');
        this.name = name;
        this.first = first;
        this.second = second;
    }
    sum(){
        return this.first + this.second;
    }
}
var hong = new Person('홍길동', 90, 97); // {'name':'홍길동', 'first':90, 'second':97,'sum':fu~}
console.log(hong.name, ',', hong.first, ',', hong.second);
console.log('합계 : ' + hong.sum());
console.log(hong)