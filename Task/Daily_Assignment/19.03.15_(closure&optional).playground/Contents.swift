import UIKit

// 4. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

/*
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool
    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }
    return isAscending
}
*/

let someClosure: (String, String) -> Bool = { $0 > $1 }
someClosure("fe", "eu")



/*
let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}
*/

let otherClosure: ([Int]) -> Int = { $0.count }
//    var count: Int = 0
//    for _ in $0 {
//        count += 1
//    }
//    return count
//}


// 5. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

// method 1:
func combineString(str1: String?, str2: String?, str3: String?) -> String {
    var result = ""
    if str1 != nil {
        result += str1!
    }
    if str2 != nil {
        result += str2!
    }
    if str3 != nil {
        result += str3!
    }
    return result
}

// method 2:
func combineStr(str1: String?, str2: String?, str3: String?) -> String {
    let str1 = str1 ?? ""
    let str2 = str2 ?? ""
    let str3 = str3 ?? ""
    return str1 + str2 + str3
}

print(combineString(str1: "AB", str2: "CD", str3: "EF"))
print(combineString(str1: "AB", str2: nil, str3: "EF"))
print(combineStr(str1: "AB", str2: "CD", str3: "EF"))
print(combineStr(str1: "AB", str2: nil, str3: "EF"))
