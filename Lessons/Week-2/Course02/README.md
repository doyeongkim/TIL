Mar 11, 2019 (Mon)

<h1> Basic Operators </h2>

<h2> Terminology </h2>

```swift
let a = 123
let b = 456
let c: Int? = 789
```

<img width="800" alt="스크린샷 2019-03-22 오후 9 35 11" src="https://user-images.githubusercontent.com/29372705/54823198-6dd14400-4cea-11e9-9b37-16de1dc62740.png">


<h2> Assignment Operators </h2>

<img width="800" alt="스크린샷 2019-03-22 오후 9 38 42" src="https://user-images.githubusercontent.com/29372705/54823342-e2a47e00-4cea-11e9-8527-dd6e57b99c5d.png">


<h2> Arithmetic Operators </h2>

<div>
<img width="800" alt="스크린샷 2019-03-22 오후 9 41 46" src="https://user-images.githubusercontent.com/29372705/54823484-55adf480-4ceb-11e9-941d-9e5bd0998767.png">
<img width="800" alt="스크린샷 2019-03-22 오후 9 42 21" src="https://user-images.githubusercontent.com/29372705/54823502-65c5d400-4ceb-11e9-9699-1e1a6c4297d5.png">
</div>


<h2> Precedence </h2>

<img width="800" alt="스크린샷 2019-03-22 오후 9 45 33" src="https://user-images.githubusercontent.com/29372705/54823655-d79e1d80-4ceb-11e9-98d5-16a2743a5ba2.png">


<h2> Comparison Operators </h2>

```swift
// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b
```


```swift

// String Comparison

"iOS" > "Apple"       //true
"Application" > "Steve Jobs"        // false
"Application2" > "Application1"       //true
"Application" == "Application"        //true
```


<h2> Logical Operators </h2>

<div>
<img width="602" alt="스크린샷 2019-03-22 오후 11 37 45" src="https://user-images.githubusercontent.com/29372705/54830259-84cc6200-4cfb-11e9-8133-87566c6367aa.png">
<img width="602" alt="스크린샷 2019-03-22 오후 11 37 45" src="https://user-images.githubusercontent.com/29372705/54830316-9e6da980-4cfb-11e9-8b7f-ed999256d1e8.png">
</div>


<h2> Ternary Conditional Operator </h2>

The ternary conditional operator is a special operator with three parts, which takes the form `question ? answer1 : answer2`. It’s a shortcut for evaluating one of two expressions based on whether question is true or false. If question is true, it evaluates answer1 and returns its value; otherwise, it evaluates answer2 and returns its value.

```swift
a > 0 ? "positive" : "zero or negative"    //"positive"

if a > 0 {
  "positive"          //positive
} else {
  "zero or negative"
}
```


<h2> Range Operators </h2>

- **Closed Range Operator**

The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.

The closed range operator is useful when iterating over a range in which you want all of the values to be used, such as with a for-in loop:

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

- **Half-Open Range Operator**

The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b.

Half-open ranges are particularly useful when you work with zero-based lists such as arrays, where it’s useful to count up to (but not including) the length of the list:

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
```

- **One-Sided Ranges**

The closed range operator has an alternative form for ranges that continue as far as possible in one direction—for example, a range that includes all the elements of an array from index 2 to the end of the array. In these cases, you can omit the value from one side of the range operator.

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
```

The half-open range operator also has a one-sided form that’s written with only its final value. For example:

```swift
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

$**Question**$

How to apply the following range operator in reversed (descending order)?

```swift
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}
```


```swift
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}

for index in (1...5).reversed() {
    print("\(index) times 5 is \(index * 5)")
}
// 5 times 5 is 25
// 4 times 5 is 20
// 3 times 5 is 15
// 2 times 5 is 10
// 1 times 5 is 5

for index in stride(from: 5, to: 0, by: -1) {
    print("\(index) times 5 is \(index * 5)")
}
// 5 times 5 is 25
// 4 times 5 is 20
// 3 times 5 is 15
// 2 times 5 is 10
// 1 times 5 is 5
```
