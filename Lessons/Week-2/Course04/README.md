Mar 12, 2019 (Tue)

<h1> Conditional Statements </h1>

<h2> if Statements </h2>

An if statement is used for executing code based on the evaluation of one or more conditions.

There are 2 basic forms of an if statement where each form needs to have the opening and closing braces. 

__The first form__ - allows code to be executed only when a condition is true and has the following form: 

```swift
 if condition {
   code
 }
 ```
 
__The second form__ - provide an additional _else clause_ and is used for executing one part of code when the condition is true and another part of code when the same condition is false.
 
 i ) When there's only one else clause :
 
 ```swift
 if condition {
   statements  // to execute if condition is true
 } else {
   statements  // to execute if condition is false
 }
 ```
 
 ii) When there are more than one condition :
 
 ```swift
 if condition 1 {
   statements  // to execute if condition 1 is true
 } else if condition 2 {
   statements  // to execute if condition 2 is true
 } else {
   statements  // to execute if both conditions are false
 }
 ```
 
 The value of any condition in an if statement must be of type *__Bool__* or a type bridged to Bool.
 
 Ex)
 
 ```swift
 // if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else { // (32 < x < 86)
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}
 ```
 
 
 
 
 
 
