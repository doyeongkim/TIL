<h3> 19.03.15 과제 </h3>

1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

```swift
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}
```

```swift
let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}
```

2. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

```swift
func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
// combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
// combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"
```
