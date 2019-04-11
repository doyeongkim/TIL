<h3> 19.04.09 과제 </h3>

[클매과제]

*UIAlertController 와 비슷한 기능을 구현해봅시다.


1. FirstViewController 에서 버튼을 생성하고 present 를 통해 SecondVIewController 를 띄운다
2. 회색의 UIView 를 하나 생성하고 안에 색을 바꿀수있는 버튼과 FirstViewController 로 돌아올수있는 버튼을 구현하라.


FirstViewController 에서 SecondViewController 를 Present 할때

```swift
let secondVC = SecondViewController()
secondVC.modalPresentationStyle = .overCurrentContext
present(secondVC, animated: true)
```

위 코드를 작성.

```swift
secondVC.modalPresentationStyle = .overCurrentContext
```

는 present 하게 되었을때 이전 ViewController 를 뒤에 보여줍니다. 
