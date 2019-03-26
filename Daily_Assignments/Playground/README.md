<h1> Playground Daily Assignments </h1>

<h3> 19.03.12 과제</h3>

1. [바로가기](https://github.com/doyeongkim/FastCampus_iOS_School/tree/master/Daily_Assignments/Playground/19.03.12.playground) 



<h3> 19.03.13 과제 </h3>

- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 
  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수 
  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
  (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력)
- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수


<h3> 19.03.14 과제 </h3>

- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
  ex) 123 -> 321 , 10293 -> 39201

- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
  ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
  
  enum Arithmetic {
    case addition, subtraction, multiplication, division
  }
  func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    // 코드
  }

- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기


<h3> 19.03.15 과제 </h3>

- 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}


let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}



5. 
옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수


func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
// combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
// combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"

19.03.18 과제
1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지



2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0

 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0

19.03.21 과제
1. 첨부된 이미지를 보고 상속을 이용해 구현해보기

2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고 
   각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
   (클래스 구현 연습)
