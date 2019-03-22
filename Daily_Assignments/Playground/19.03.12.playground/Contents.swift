/*[ 과제 ]
 - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
 - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
 - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
 - 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 - 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
*/

//제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
//정답 풀이는 목요일 전달

//1. 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func intro(name: String, age: Int) {
    print("Name: \(name)")
    print("Age: \(age)")
}

intro(name: "Doyeong", age: 24)
//
//
func intro2(name: String, age: Int) {
    print("Name: \(name), Age: \(age)")
}
intro2(name: "Doyeong", age: 24)

//2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

func multipleTwo(a: Int) -> String {
    var two : String = ""
    if a % 2 == 0 {
        two = "2의 배수 맞음"
    } else {
        two = "2의 배수 아님"
    }
    return two
}

print(multipleTwo(a: 3))
print(multipleTwo(a: 4))

//3. 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func results(a: Int, b: Int = 10) -> Int {
    return a * b
}

print(results(a: 4))

//4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func exam(a: Double, b: Double, c: Double, d: Double) -> Double {
    var average : Double = Double((a + b + c + d) / 4)
    return average
}

print(exam(a: 40.0, b: 98.3, c: 45.9, d: 46.8))
//
//
func exam2(a: Double, b: Double, c: Double, d: Double) -> Double {
    return Double((a + b + c + d) / 4)
}

print(exam2(a: 40.0, b: 98.3, c: 45.9, d: 46.8))

//5. 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func result(a: Int) -> String {
    var grade : String = ""
    if a >= 90 {
        grade = "A"
    } else if a >= 80 {
        grade = "B"
    } else if a >= 70 {
        grade = "C"
    } else {
        grade = "F"
    }
    return grade
}

print(result(a: 50))

//6. 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func average(a: Double...) -> String {
    var total : Double = 0.0
    var grade : String = ""
    for i in a {
        total += i
    }
    if total / Double(a.count) >= 90 {
        grade = "A"
    } else if total / Double(a.count) >= 80 {
        grade = "B"
    } else if total / Double(a.count) >= 70 {
        grade = "C"
    } else {
        grade = "F"
    }
    return grade
}

print(average(a: 100, 100, 100, 100))
