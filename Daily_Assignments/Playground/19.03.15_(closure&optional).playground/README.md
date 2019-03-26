<h3> 19.03.15 과제 </h3>

- 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

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
