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


<h2> Functions With Multiple Parameters </h2>

Functions can have multiple input parameters, which are written within the function’s parentheses, separated by commas.

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!"
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

    > NOTE
    >
    > Strictly speaking, this version of the `greet(person:)` function *does* still return a value, even though no return value is defined. Functions without a defined return type return a special value of type `Void`. This is simply an empty tuple, which is written as `()`.




