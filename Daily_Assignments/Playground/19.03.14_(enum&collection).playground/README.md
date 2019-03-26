<h3> 19.03.14 과제 </h3>

- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
  ex) 123 -> 321 , 10293 -> 39201

- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
  ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
  
  ```swift
  enum Arithmetic {
    case addition, subtraction, multiplication, division
  }
  func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    // 코드
  }
  ```

- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

<img width="450" alt="스크린샷 2019-03-26 오전 11 18 37" src="https://user-images.githubusercontent.com/29372705/54966964-406dea00-4fb9-11e9-90aa-6059b2522b42.png">
