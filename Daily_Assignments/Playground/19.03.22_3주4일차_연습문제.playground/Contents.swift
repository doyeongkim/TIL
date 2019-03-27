import UIKit

// [ 연습 문제 ]

//# 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

func addNum(num: Int) -> Int {
    let num1 = min(1, num)
    let num2 = max(1, num)
    var result = 0
    for i in num1...num2 {
        result += i
    }
    return result
}

addNum(num: 5)
addNum(num: -2)
addNum(num: -5)


//# 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
//e.g.  123 -> 6 ,  5678 -> 26

func digits(num: Int) -> Int {
    var num = num
    var r = 0
    var sum = 0
    
    while num > 0 {
        r = num % 10
        num /= 10
        sum += r
    }
    return sum
}

digits(num: 123)
digits(num: 5678)


//# 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

func three69(a: Int) {
//    String(a).contains("3")
//    String(a).contains("6")
//    String(a).contains("9")
    
    for i in 1...a {
        var q = i
        var boolean = true
        while q > 0 {
            let r = q % 10
            q = q / 10
            
            if r == 3 || r == 6 || r == 9 {
                boolean = false
                break
            }
        }
        if boolean == true {
            print(i, terminator: " ")
        } else {
            print("*", terminator: " ")
        }
    }
}

three69(a: 90)

print("")


//# 하샤드 수 구하기
//- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
//e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.

func harshad(num: Int) {
    var num2 = num
    var sum = 0
    while num2 > 0 {
        let r = num2 % 10
        num2 /= 10
        sum += r
    }
    if num % sum == 0 {
        print("\(num) is Harshad number")
    } else {
        print("\(num) is not Harshad number")
    }
}

// Harshad O
harshad(num: 10)
harshad(num: 12)
harshad(num: 18)

// Harshad X
harshad(num: 15)
harshad(num: 22)


//# 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3



//// 최대공약수
//// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
//// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복



//// 최소 공배수
//// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수


func calculate(a: Int, b: Int) {
    var gcf = 0
    var lcm = 0
    var maxNum = max(a, b)
    var minNum = min(a, b)
    var cal1 = maxNum % minNum
    
    if cal1 == 0 {
        gcf = minNum
    }
    
    while cal1 != 0 {
        maxNum = minNum
        minNum = cal1
        cal1 = maxNum % minNum
        
        if cal1 == 0 {
            gcf = minNum
        }
    }
    
    lcm = (a * b) / gcf
    print("Input : \(a), \(b) -> Output : \(lcm), \(gcf)")
}

calculate(a: 10, b: 20)
calculate(a: 60, b: 45)
calculate(a: 6, b: 9)
