import UIKit

/* 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
    ** 강아지 (Dog)
    - 속성: 이름, 나이, 몸무게, 견종
    - 행위: 짖기, 먹기

    ** 학생 (Student)
    - 속성: 이름, 나이, 학교명, 학년
    - 행위: 공부하기, 먹기, 잠자기

    ** 아이폰(IPhone)
    - 속성: 기기명, 가격, faceID 기능 여부(Bool)
    - 행위: 전화 걸기, 문자 전송

    ** 커피(Coffee)
    - 속성: 이름, 가격, 원두 원산지
*/

class Dog {
    let name: String
    let age: Int
    let weight: String
    let breed: String
    
    init(name: String, age: Int, weight: String, breed: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.breed = breed
    }
    
    func bark() {
        print("BowWow")
    }
    
    func eat() {
        print("Yum yum")
    }
}

class Student {
    let name: String
    let age: Int
    let school: String
    let grade: String
    
    init(name: String, age: Int, school: String, grade: String) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
    
    func study() {
        print("I'm studying now")
    }
    
    func eat() {
        print("I'm having my meal now")
    }
    
    func sleep() {
        print("I'm about to sleep now")
    }
}

class IPhone {
    let device: String
    let price: Int
    let faceID: Bool
    
    init(device: String, price: Int, faceID: Bool) {
        self.device = device
        self.price = price
        self.faceID = faceID
    }
    
    func call() {
        print("Calling to ...")
    }
    
    func message() {
        print("Send message to ...")
    }
}

class Coffee {
    let name: String
    let price: Int
    let origin: String
    
    init(name: String, price: Int, origin: String) {
        self.name = name
        self.price = price
        self.origin = origin
    }
}


let kobong = Dog(name: "Kobong", age: 5, weight: "13 kg", breed: "French Bulldok")
kobong.bark()
kobong.eat()
let doyeong = Student(name: "Do Yeong", age: 24, school: "Coventry University", grade: "Year 3")
doyeong.study()
doyeong.eat()
doyeong.sleep()
let iphonex = IPhone(device: "iPhone X", price: 2000, faceID: true)
iphonex.call()
iphonex.message()
let kanu = Coffee(name: "Kanu", price: 5, origin: "South Korea")
kanu.name
kanu.price
kanu.origin


/* 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
    ** 계산기 (Calculator)
    - 속성: 현재 값
    - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화

    ex)
    let calculator = Calculator() // 객체생성

    calculator.value  // 0

    calculator.add(10)    // 10
    calculator.add(5)     // 15

    calculator.subtract(9)  // 6
    calculator.subtract(10) // -4

    calculator.multiply(4)   // -16
    calculator.multiply(-10) // 160

    calculator.divide(10)   // 16
    calculator.reset()      // 0
*/

class Calculator {
    var currentValue = 0
    
    func add(_ value: Int) {
        currentValue += value
        print(currentValue)
    }
    
    func subtract(_ value: Int) {
        currentValue -= value
        print(currentValue)
    }
    
    func multiply(_ value: Int) {
        currentValue *= value
        print(currentValue)
    }
    
    func divide(_ value: Int) {
        currentValue /= value
        print(currentValue)
    }
    
    func reset() {
        currentValue = 0
        print(currentValue)
    }
}

let calculator = Calculator()
calculator.currentValue
calculator.add(10)
calculator.add(5)
calculator.subtract(9)
calculator.subtract(10)
calculator.multiply(4)
calculator.multiply(-10)
calculator.divide(10)
calculator.reset()

//
//
class Drinks {
    let name: String
    let manufacturer: String
    var price: Int
    
    init(name: String, manufacturer: String, price: Int) {
        self.name = name
        self.manufacturer = manufacturer
        self.price = price
    }
}

class VendingMachine {
    
    var money = 0
    func insert(_ money: Int) {
        self.money += money
        print("\(money)원이 입금되었습니다")
    }
    
    func change() {
        print("\(money)원이 반환 되었습니다")
        money = 0
    }
    
    func check() {
        print("\(money)원이 남아 있습니다.")
    }
    
    func purchase(name: String) {
        let drink = Drinks(name: name, manufacturer: "동아오츠카", price: 1500)
        guard drink.price <= self.money else {
            print("잔돈이 부족합니다.")
            return
        }
        print("\(drink.price)원짜리 \(drink.manufacturer)에서 만든 \(drink.name)음료가 나왔습니다.")
        self.money -= drink.price
    }
}

let machine = VendingMachine()
machine.insert(2000)
machine.check()
machine.purchase(name: "포카리스웨트")
machine.change()
