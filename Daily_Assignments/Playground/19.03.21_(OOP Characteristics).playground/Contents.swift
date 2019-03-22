import UIKit

//  1. 첨부된 이미지를 보고 상속을 이용해 구현해보기

class Animal {
    let brain: Bool
    var legs: Int
    
    init(brain: Bool = true, legs: Int = 0) {
        self.brain = brain
        self.legs = legs
    }
}

class Human: Animal {
    init(legs: Int) {
        super.init(legs: legs)
    }
}

class Pet: Animal {
    var fleas: Int
    
    init(legs: Int = 4, fleas: Int) {
        self.fleas = fleas
        super.init(legs: legs)
    }
}

class Dog: Pet {
    init(fleas: Int) {
        super.init(fleas: fleas)
    }
}

class Cat: Pet {
    init(fleas: Int) {
        super.init(fleas: fleas)
    }
}


let animal = Animal(brain: true, legs: 0)

let human = Human(legs: 2)
human.legs      //2

let pet = Pet(legs: 4, fleas: 0)
pet.legs        //4
pet.fleas       //0

let dog = Dog(fleas: 8)
dog.fleas       //8
dog.legs        //4

let cat = Cat(fleas: 4)
cat.fleas       //4
cat.legs        //4



/*  2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고
 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
 (클래스 구현 연습)
 */

//class Square {
//    var side = 5
//
//    func area() {
//        print(side * side)
//    }
//
//    func perimeter() {
//        print(4 * side)
//    }
//}
//
//let square = Square()
//square.area()
//square.perimeter()
//square.side = 6
//square.area()

class Square {
    var side: Int
    
    init(side: Int) {
        self.side = side
    }
    
    func area() -> Int {
        return side * side
    }
    
    func perimeter() -> Int {
        return 4 * side
    }
}

let square1 = Square(side: 5)
square1.area()
square1.perimeter()
let square2 = Square(side: 10)
square2.area()
square2.perimeter()


class Cube: Square {
    override init(side: Int) {
        super.init(side: side)
    }
    
    func volume() -> Int {
        return side * side * side
    }
}

let cube = Cube(side: 8)
cube.volume()


class Rectangle {
    var width: Int
    var length: Int
    
    init(width: Int, length: Int) {
        self.width = width
        self.length = length
    }
    
    func area() -> Int {
        return length * width
    }
    
    func perimeter() -> Int {
        return 2 * length + 2 * width
    }
}

let rectangle = Rectangle(width: 5, length: 10)
rectangle.area()
rectangle.perimeter()


class RectangularSolid: Rectangle {
    var height: Int
    
    init(width: Int, length: Int, height: Int) {
        self.height = height
        super.init(width: width, length: length)
    }
    
    func volume(area: Int) -> Int {
    
        return height * area
    }
}

let rectSolid = RectangularSolid(width: 5, length: 10, height: 6)
//rectSolid.volume()
rectSolid.area()
rectSolid.volume(area: rectSolid.area())

class Circle {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
    func circumference () -> Double {
        return 2 * 3.14 * radius
    }
}

let circle = Circle(radius: 6)
circle.area()
circle.circumference()

class Cylinder: Circle {
    var height: Double
    
    init(radius: Double, height: Double) {
        self.height = height
        super.init(radius: radius)
    }
    
    func volume(area: Double) -> Double {
        return height * area
    }
}

let cylinder = Cylinder(radius: 5, height: 12)
cylinder.volume(area: cylinder.area())


class Triangle {
    var bottom: Double
    var height: Double
    
    init(bottom: Double, height: Double) {
        self.bottom = bottom
        self.height = height
    }
    
    func area() -> Double {
        return bottom * height / 2
    }
}

let triangle = Triangle(bottom: 15, height: 8)
triangle.area()

class Cone {
    var radius: Double
    var height: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
    
    func volume() -> Double {
//        pow(x, 3)
//        x * x * x
        return Double.pi * pow(radius, 2) * height / 3
    }
}

let cone = Cone(radius: 5, height: 10)
cone.volume()


class Trapezoid {
    var a: Double
    var b: Double
    var height: Double
    
    init(a: Double, b: Double, height: Double) {
        self.a = a
        self.b = b
        self.height = height
    }
    
    func area() -> Double {
        return height * (a + b) / 2
    }
}

let trapezoid = Trapezoid(a: 15, b: 8, height: 7)
trapezoid.area()


class Sphere {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func volume() -> Double {
        return Double.pi * pow(radius, 3) * 4 / 3
    }
}

let sphere = Sphere(radius: 10)
sphere.volume()
