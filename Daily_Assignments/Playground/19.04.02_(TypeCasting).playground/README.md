<h3> 19.04.02 과제 </h3>

1.

```swift
func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)
```

위와 같이 task1 이라는 변수가 있을 때
task1 + task1 의 결과가 제대로 출력되도록 할 것

**[ 도전 과제 ]**

2. 

`let task2: Any = addTwoValues`

위와 같이 task2 라는 변수가 있을 때,

task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)

3. 

```swift
class Car {}
let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
```

위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
