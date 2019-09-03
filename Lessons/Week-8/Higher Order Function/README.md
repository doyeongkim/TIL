# Higher Order Function

### 고차함수란?

- 하나 이상의 함수를 인자로 취하는 함수
- 함수를 결과로 반환하는 함수
- 고차 함수가 되기 위한 조건은 함수가 1급 객체여야 한다.
 
> **1급 객체 (First-class citizen)**
> - 변수나 데이터에 할당할 수 있어야 한다.
> - 객체의 인자로 넘길 수 있어야 한다.
> - 객체의 리턴값으로 리턴할 수 있어야 한다.

Ex)

```swift
func firstClassCitizen() {
  print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
  return parameter
}

let returnValue = function(firstClassCitizen)
returnValue  // 함수자체
returnValue() // 값을 출력할때
```

## forEach

- 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

Ex)

```swift
let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num, terminator: " ")   // 1 2 3 4
}
print() 


immutableArray.forEach { num in
  print(num, terminator: " ")   // 1 2 3 4
}
print()


immutableArray.forEach {
  print($0, terminator: " ")    // 1 2 3 4
}
print()


func printParam(_ num: Int) {
  print(num, terminator: " ")     
}
immutableArray.forEach(printParam(_:))   // 1 2 3 4
print()
```

## map 

- 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환

Ex)

```swift
let names = ["Chris", "Alex", "Bob", "Barry"]

names
  .map { $0 + "'s name" }
  .forEach { print($0) }    

let intArr = Array<Int>(repeating: 2, count: 10)

// for문
for (index, value) in intArr.enumerated() {
    print(index, value)
}

// for문
var myArr = [Int]()
for (index, value) in intArr.enumerated() {
    myArr.append(index + value)
}
print(myArr)

// map
let indexPlusElement = intArr.enumerated().map {
  return $0 + $1
}
print(indexPlusElement)

// array배열에 map을쓰면 array 배열로 반환
// dictionary에 map을 쓰면 dictionary로 반환
```

