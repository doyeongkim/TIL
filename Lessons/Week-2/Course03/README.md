Mar 11, 2019 (Mon)

<h1> Function </h1>

- Functions are self-contained chunks of code that perform a specific task. 
- We give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.
- Type
  - Having both Input & Output (Function)
  - Only Output without Input (Generator)
  - Only Input without Output (Consumer)
  - Neither Input nor Output


<h2> Function Syntax </h2>

```swift
func functionName(parameter) -> ReturnType {
    statements
}

//Parameter Declaration Syntax

(name1: Type, name2: Type)
```


<h2> Functions Without Parameters </h2>

Functions are not required to define input parameters. Here’s a function with no input parameters, which always returns the same String message whenever it is called:

```swift
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"
```


<h2> Functions Without Return Values </h2>

Functions are not required to define a return type. Here’s a version of the greet(person:) function, which prints its own String value rather than returning it:

```swift
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// Prints "Hello, Dave!"
```

**_Note_**

Functions without a defined return type return a special value of type `Void`. This is simply an empty tuple, which is written as `()`:

```swift
func say(number: Int) {
  print(number)
}

func say(word: String) -> Void {
  print(word)
}

func say(something: String) -> () {
  print(something)
}
```


<h2> Functions With Params And Return Values </h2>

```swift
func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}

greet(person: "Anna")
greet(person: "Brian")


// Combine the message creation and the return statement into one line

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

greetAgain(person: "Anna")


// Function with Multiple Parameters

func addNumbers(a: Int, b: Int) -> Int {
  return a + b
}

addNumbers(a: 10, b: 20)
addNumbers(a: 3, b: 5)
addNumbers(a: addNumbers(a: 10, b: 20), b: addNumbers(a: 3, b: 5))
```


<h2> Argument Label </h2>

<p align="center">
<img width="500" alt="스크린샷 2019-03-23 오전 1 01 21" src="https://user-images.githubusercontent.com/29372705/54836328-548ac080-4d07-11e9-849d-3a7c7d0a5e83.png">
</p>

- By default, parameters use their parameter name as their argument label.

```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

someFunction(firstParameterName: 1, secondParameterName: 2)
```

- Omitting Argument Labels

If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.

```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
  print(firstParameterName, secondParameterName)
}

someFunction(1, secondParameterName: 2)
```

- Specifying Argument Labels

You write an argument label before the parameter name, separated by a space:

```swift
func someFunction(argumentLabel parameterName: Int) {
  // parameterName refers to the argument value for that parameter.
  print(parameterName)
}

someFunction(argumentLabel: 10)
```


<h2> Question
  - 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
  - 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
  - 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
  </h2>

```swift
func print(name: String) {
  print(name)
}
print(name: "Tory")


func printAge(_ age: Int) {
  print(age)
}
printAge(4)


func sayHello(to name: String) {
  print(name)
}
sayHello(to: "Lilly")
```


<h2> Default Parameter Values </h2>

We can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, we can omit that parameter when calling the function.

```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If we omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)   // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4)    // parameterWithDefault is 12
```


<h2> Variadic Parameters </h2>

A variadic parameter accepts zero or more values of a specified type. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```


<h2> Argument vs Parameter </h2>

<p align="center">
<img width="400" alt="스크린샷 2019-03-23 오전 1 01 21" src="https://user-images.githubusercontent.com/29372705/54837946-eba54780-4d0a-11e9-9094-ca00d35e5865.png">
</p>
  
- Parameter
  - 매개변수 = 인자 = Parameter
  - 인수를 담는 변수의 한 종류로서 해당 함수 내부 스코프에만 영향
  - 대부분 call by value 가 기본
  - call by reference 는 호출할 때 사용한 전달인자에까지 영향

- Argument
  
  - 전달인자 = 인수 = 실인수 = Argument
  - 함수 호출 시 그에 필요한 데이터를 전달


<h2> Nested Functions </h2>

It can be used by nesting functions to be used only inside the functions while hiding them from the external.

```swift
func chooseStepFunction(backward: Bool, value: Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  
  if backward {
    return stepBackward(input: value)
  } else {
    return stepForward(input: value)
  }
}


var value = 4
chooseStepFunction(backward: true, value: value)
chooseStepFunction(backward: false, value: value)
```

