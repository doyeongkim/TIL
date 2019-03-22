import UIKit

//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201

func reversed(a: Int) -> Int {
    var b = a
    var c = 0
    
    while b > 0 {
        c = c * 10 + b % 10
        b /= 10
    }
    return c
}

print(reversed(a: 123))
print(reversed(a: 10293))
print(reversed(a: 824))


//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

func pickNonDuplicate() -> [String] {
    var list = ["a", "b", "c", "a", "e", "d", "c"]
    var duplicate: [String] = []
    
    for str1 in 0..<list.count {
        for str2 in str1 + 1..<list.count {
            if list[str1] == list[str2] {
                duplicate.append(list[str2])
            }
        }
    }
    
    for i in 0..<duplicate.count {
        while var index = list.index(of: duplicate[i]) {
            list.remove(at: index)
        }
    }
    return list
}

pickNonDuplicate()


//- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

func evenOdd(list: [Int]) -> [Int] {
    var oddlist: [Int] = []
    var evenlist: [Int] = []
    
    for str in 0..<list.count {   //  for element in list 로 대체할수있음
        if list[str] % 2 != 0 {
            oddlist.append(list[str])
        } else {
            evenlist.append(list[str])
        }
    }
    
    for element in evenlist {
        oddlist.append(element)
    }

    return oddlist
}

evenOdd(list: [2, 8, 7, 1, 4, 3])

//- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현

enum Arithmetic {
    case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    switch op {
    case .addition:
        return operand1 + operand2
    case .subtraction:
        return operand1 - operand2
    case .multiplication:
        return operand1 * operand2
    case .division:
        return operand1 / operand2
    }
}

calculator(operand1: 10, operand2: 10, op: Arithmetic.multiplication)

//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

let dic2: [String: [String]] = ["개": ["자칼", "늑대", "북미산 이리"], "여우": ["아메리카 여우", "유럽 여우"]]
let dic3: [String: [String]] = ["고양이": ["고양이", "살쾡이"], "표범": ["사자", "호랑이"]]
let dic: [String: [String: [String]]] = ["개과": dic2, "고양이과": dic3]

//if let tiger = dic3["표범"] {
//    for i in tiger {
//        print(i)
//    }
//}
if let cat = dic["고양이과"] {
    if let leopard = cat["표범"] {
        for element in leopard {
            print(element)
        }
    }
}

