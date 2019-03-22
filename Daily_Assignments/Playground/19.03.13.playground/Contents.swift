/* 1. 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
 (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100) */

func attachTwoNum(lhs: Int, rhs: Int) -> Int {
    return Int("\(lhs)\(rhs)")!
}

attachTwoNum(lhs: 1, rhs: 5)
attachTwoNum(lhs: 29, rhs: 30)
attachTwoNum(lhs: 6, rhs: 100)

// 2. 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
// method 1
func same(a: String, b: String) -> Bool {
    if a == b {
        return true
    } else {
        return false
    }
}

same(a: "hello", b: "hello")
same(a: "hello", b: "hellow")
//
//method 2
func same2(a: String, b: String) -> Bool {
    return a == b
}

same2(a: "hi", b: "hi")
same2(a: "hello", b: "babo")




// 3. 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func divisor(a: Int) {
    print("\(a)의 약수 :", terminator: " ")
    for i in 1...a {
        if a % i == 0 {
            print(i, terminator: " ")
        }
    }
    print()
}

divisor(a: 15)
divisor(a: 19)
divisor(a: 20)


// 4. 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func prime(a: Int) -> Bool {
    if a <= 1 {
        print("\(a) is not the prime number")
        return false
    } else {
        for i in 2...a - 1 {
            if a % i == 0 {
                return false
            }
        }
    }
    return true
}

prime(a: 8)
prime(a: 19)


// 5. 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//(입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )

func fibonacciNumber(at index: Int) -> Int {
    var op1 = 0, op2 = 1
    
    for i in 0..<index {
        if i % 2 == 0 {
            op1 += op2
        } else {
            op2 += op1
        }
    }
    
    return index % 2 == 0 ? op1 : op2
}

fibonacciNumber(at: 0)
fibonacciNumber(at: 1)
fibonacciNumber(at: 2)
fibonacciNumber(at: 3)
fibonacciNumber(at: 4)
fibonacciNumber(at: 5)
fibonacciNumber(at: 6)



// 6. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func commonMultiple(a: Int, b: Int) {
    print("3과 5의 공배수 : ", terminator: " ")
    for i in 1...100 {
        if i % a == 0 && i % b == 0 {
        print(i, terminator: " ")
        }
    }
}

commonMultiple(a: 3, b: 5)
