Mar 11, 2019 (Mon)

<h2>The Basics</h2>

### 1. Hello, world!

- **Free Function for log output**


```swift
print(3.14)

var num = 1
print(num)

print("숫자", num)

print("숫자 \(num)")

print("숫자 " + String(num))
```

<br />

- **Comment**

  - //        :  1 line comment (Command + /)

  - ///       :  1 line comment + [Quick Help Markup](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/SymbolDocumentation.html)

  - /* */   : Multi line comment ('Nested' is possible)


  ```swift
  print("Hello, world!")
  // print("Hello, world!")
  /// print("Hello, world!")
  
  /*
   print("Hello, world!")
   print("Hello, world!")
   */
  
  /* This is also a comment
   but is written over multiple lines. */
  ```



- **Semicolon (;)**

  - It is an option to put semicolon at the end of each line
  - A semicolon is required if you want to use multiple statements (multiple commands) on a line.


  ```swift
  print(1); print(2); print(3);
  //print(1);
  //print(2);
  //print(3);
  ```



### 2. Constants & Variables

Constants and variables are containers that contain values, attributes, etc. for the current data.

- **Constants**  : The value of a *constant* can’t be changed once it’s set
- **Variables**    : A *variable* can be set to a different value in the future

Constants and variables must be declared before they’re used. We declare constants with the `let` keyword and variables with the `var` keyword.


```swift
let maximumNumberOfLoginAttempts = 10
// maximumNumberOfLoginAttempts = 20  (cannot change the value)
```

```swift
var currentLoginAttempt = 0
currentLoginAttempt = 1		// currentLoginAttempt = 1
```



We can **declare multiple constants or multiple variables** on a single line, separated by commas:


```swift
var x = 0.0, y = 0.0, z = 0.0
x = 1
y = 2
z = 3
```



- **Naming**

In addition to English, most of characters including unicode can be used to name the constants and variables.


```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // If it's keword used in Swift, use backquote(`)

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)

/***************************************************
 Those can't be used as variable name:

 1. Reapeated name in the same scope range {}
 2. Spaces between character
 3. Mathematical symbols (√, ∑ etc.)
 4. Arrows (→, ← etc.)
 5. Names starting with numeric numbers (can be used except the start part)
 ***************************************************/

// e.g.)
// let 한글 = "ㄱ"
// let 공 백 = "X"
// let √ = "root"
// let → = "arrow"
// let 369Game = "12 clap 45 clap..."
```



### 3. Type Annotation & Type Inference

- **Type Annotation**

  Specifying clearly about the type of values the constant or variable can store when declaring a variable or constant.

  You can write a type annotation by placing a *colon(;)* after the constant or variable name, followed by a *space*, followed by the *name of the type* to use.


  ```swift
  let year: Int = 2019
  
  let language: String
  language = "Swift"
  
  var red, green, blue: Double
  red = 255.0
  green = 150.123
  blue = 75
  ```



- **Type Inference**

  Inferring the type of a variable through the type of value used for initialization when declaring a variable.


  ```swift
  var weight = 6.4
  // type(of: weight)
  //Double.type
  
  var spelling = ["T", "O", "R", "I"]
  // type(of: spelling)
  //Array<String>.type
  ```

  

### 4. Literals & Types

- Constant - a symbol / identifier having a fixed value (memory address)

- Literal

  - The character (data) itself represented by a fixed value in the source code
  - Integer / Real number / Character / String / Boolean literal and so on

  

  **1. Numeric Literals**

  ```swift
  var signedInteger = 123
  signedInteger = +123
  signedInteger = -123
  type(of: signedInteger)
  
  let decimalInteger = 17
  let binaryInteger = 0b10001 // 앞에 0b를 붙히면 2진수로 인식
  type(of: binaryInteger)
  let octalInteger = 0o21 //0o를 붙히면 8진수로 인식
  let hexadecimalInteger = 0x11 //0x를 붙히면 16진수로 인식
  
  var bigNumber = 1_000_000_000
  bigNumber = 000_001_000_000_000
  bigNumber = 0b1000_1000_0000
  bigNumber = 0xAB_00_FF_00_FF
  ```

  

  **2. Integer Types**

  - 8-bit : Int8, UInt8
  - 16-bit : Int16, UInt16
  - 32-bit : Int32, UInt32
  - 64-bit : Int64, UInt64
  - Platform dependent : Int, UInt (64-bit on modern devices)

  

  **3. Overflow Operators**

  ```swift
  // Overflow addition
  //var add: Int8 = Int8.max + 1
  var add: Int8 = Int8.max &+ 1		//-128
  
  Int8.max &+ 1			//-128
  Int32.max &+ 1    //-2147483648
  Int64.max &+ 1    //-9223372036854775808
  
  // Overflow subtraction
  //var subtract: Int8 = Int8.min - 1			
  var subtract: Int8 = Int8.min &- 1			//127
  
  Int8.min &- 1						//127
  Int32.min &- 1					//2147483647
  Int64.min &- 1					//9223372036854775807
  
  
  // Overflow multiplication
  //var multiplication: Int8 = Int8.max * 2
  var multiplication: Int8 = Int8.max &* 2		//-2
  
  Int8.max &* 2				//-2
  Int32.max &* 2			//-2
  Int64.max &* 2			//-2
  ```

  

  **4. Boolean Literal**

  ```swift
  var isBool = true
  type(of: isBool)		//Bool.type
  
  is Bool = false				
  //isBool = False		--->   Swift can only use 'true or false'
  //isBool = 1     		--->   cannot be replaced by 0 or 1
  //isBool = 0
  
  let shouldChange: Bool = true
  ```

  

  **5. String Literal**

  ```swift
  let str = "Hello, world!"
  type(of: str)			//String.Type
  
  let str1 = ""
  type(of: str1)		//String.Type
  
  var language: String = "Swift"
  ```

  

  **6. Character Literal**

  ```swift
  var nonCharacter = "C"
  type(of: nonCharacter)			//String.Type
  
  var character: Character = "C"
  type(of: character)					//Character.Type
  
  MemoryLayout<String>.size
  MemoryLayout<Character>.size		
  
  character = " "
  type(of: character)					//Character.Type
  
  //character = ' ' 
  //character = "string"
  ```

  

### 5. Typealias

Use when we want to refer to the name of an existing type with a more appropriate name in the context

```swift
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min 

type(of: maxAmplitudeFound)			//UInt16.Type
type(of: maxAmplitudeFound1)		//UInt16.Type
```



### 6. Type Conversion

```swift
let height = Int8(5)
let width = 10
//let area = height * width
//print(area)  ---> since both types are different, it shows error 

let h = UInt8(25)
let x = 10 * h 
print(x)
```

```swift
let num = 10
let floatNum = Float(num)
type(of: floatNum)					//Float.Type

let signedInteger = Int(floatNum)
type(of: signedInteger)			//Int.Type

let str = String(num)				
type(of: str)								//String.Type

// magnitude, abs

let integer = Int(-15)

let magnitude = integer.magnitude			//15
let absNum = abs(integer)							//15
```

