function Student(name, kor, mat){
    this.name = name;
    this.kor = kor;
    this.mat = mat;
};
Student.prototype.getSum = function(){
    return this.kor + this.mat;
};
Student.prototype.toString = function(){
    return this.name + '(' + this.kor + ',' + this.mat + ',' + this.getSum() + ')<br>';
};
var students = [new Student("홍", 70, 90),
                new Student("박", 99, 99),
                new Student("윤", 91, 88),
];
var studentsCopy = [...students];
studentsCopy.sort(function(left, right){
    return right.getSum() - left.getSum();
});
console.log('원본');
students.forEach((data, idx)){
    console.log(idx + ',' + data.toString())
});
console.log('정렬된 복사본')
studentsCopy.forEach((data, idx){
    console.log(idx + ',' + data.toString())
});