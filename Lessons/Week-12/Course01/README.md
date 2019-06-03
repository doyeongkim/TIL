<h1>GCD</h1>

<h2> Dispatch Queues </h2>

Grand Central Dispatch (GCD) dispatch queues는 task 수행을 위한 강력한 도구이다. dispatch queues를 사용하면 호출자(caller)와 관련하여 비동기/동기식으로 임의의 코드 블록을 수행 할 수 있다. dispatch queues를 사용하여 별도의 쓰레드에서 수행하는 거의 모든 task를 수행 할 수 있다. dispatch queues의 장점은 사용하기 쉽고, 해당 쓰레드 코드보다 해당 task를 실행 할 때 훨씬 효율적이라는 것.

dispatch queues은 앱에서 task를 비동기적으로 동시에 수행 할 수 있는 손쉬운 방법이다. 예를들어, 일부 계산을 수행하거나 데이터 구조를 작성 또는 수정하고 파일에서 읽은 일부 데이터를 처리하거나 여러가지 task를 정의 할 수 있습니다. 실제로 해야할 Task를 담아두면 선택된 스레드에서 실행을 해주는 역할을 한다. 모든 dispatch queues은 FIFO데이터 구조이고, 따라서 queues에 추가하는 task는 항상 추가된 순서대로 시작된다. 

DispatchQueue는 2가지로 종류를 나눌 수 있다.

__Serial Dispatch Queue:__

  - 큐에 추가된 순서대로 한번에 하나의 task를 실행. 현재 실행중인 task는 dispatch queues에서 관리하는 고유한 쓰레드(task마다 다를 수 있음)에서 실행된다. 각 큐는 다른 모든 큐와 관련하여 동시에 작동하고, 처리중인 작업이 완료되면 다음 작업을 처리한다. 다시말해, Serial queues을 4개 작성하면 각 큐는 한번에 하나의 task만 실행하지만, 최대 4개의 task가 각 큐에서 동시에 실행될 수 있다.  
  
__Concurrent Dispatch Queue:__

  - 동시에 하나 이상의 task를 실행하지만 task는 큐에 추가된 순서대로 계속 시작된다. Concurrent Queue는 등록된 작업을 한번에 하나씩 처리 하지 않고 여러 작업들을 동시에 처리한다.

앱 실행시 시스템에서 기본적으로 2개의 Queue를 만들어 준다. Main Queue와 Global Queue 이다.

__Main Queue:__

  - 메인 스레드(UI 스레드)에서 사용 되는 Serial Queue 
  - 모든 UI 처리는 메인 스레드에서 처리를 해야 한다.
  - MainQueue 를 sync 메서드로 동작시키면 Dead Lock 상태에 빠짐.

__Global Queue:__

  - 편의상 사용할수 있게 만들어 놓은 Concurrent Queue 
  - Global Queue는 처리 우선 순위를 위한 qos(Quality of service) 파라메터를 제공. 
  - 병렬적으로 동시에 처리를 하기때문에 작업 완료의 순서는 정할수 없지만 우선적으로 일을 처리하게 할 수 있다.

__Custom Dispatch Queue:__

  - Non Main Thread 에서 작업 수행
  - Serial / Concurrent Queue 및 QoS 등의 여러 옵션을 지정하여 생성 가능
  
```swift
public convenience init(
  label: String,
  qos: DispatchQoS = default,
  attributes: DispatchQueue.Attributes = default,
  autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default,
  target: DispatchQueue? = default
)

let queue = DispatchQueue(label: "kr.giftbot.example.queue")
let queueOptions = DispatchQueue(label: "kr.giftbot.example.queue", 
                                 qos: .userInteractive,
                                 attributes: [.concurrent])
```

위처럼 attributes를 주지않고 그냥 만들어 주면 이 큐는 Serial Queue가 된다. 위처럼 명시적으로 지정을 해줘야 비로소 concurrent queue가 된다.

QOS 우선순위는 아래와 같다.

1. userInteractive ( 우선순위 높음 )
  - 즉각 반응해야 하는 작업으로 반응성 및 성능에 중점
  - main thread 에서 동작하는 인터페이스 새로 고침, 애니메이션 작업 등 즉각 수행되는 유저와의 상호작용 작업에 할당
  
2. userInitiated
  - 몇 초 이내의 짧은 시간 내 수행해야 하는 작업으로 반응성 및 성능에 중점
  - 문서를 열거나, 버튼을 클릭해 액션을 수행하는 것 처럼 빠른 결과를 요구하는 유저와의 상호작용 작업에 할당
  
3. default
  - QoS 를 별도로 지정하지 않으면 기본값으로 사용되는 형태이며 User Initiated 와 Utility 의 중간 레벨
  - GCD global queue 의 기본 동작 형태
  
4. utility
  - 수초에서 수분에 걸쳐 수행되는 작업으로 반응성, 성능, 그리고 에너지 효율성 간에 균형을 유지하는데 중점
  - 데이터를 읽어들이거나 다운로드 하는 등 작업을 완료하는데 어느 정도 시간이 걸릴 수 있으며 보통 진행 표시줄로 표현
  
5. background
  - 수분에서 수시간에 걸쳐 수행되는 작업으로 에너지 효율성에 중점. NSOperation 클래스 사용 시 기본 값
  - background에서 동작하며 색인 생성, 동기화, 백업 같이 사용자가 볼 수 없는 작업에 할당
  - 저전력 모드에서는 네트워킹을 포함하여 백그라운드 작업은 일시 중지

6. unspecified ( 우선순위 낮음 )
  - QoS 정보가 없으므로 시스템이 QoS 를 추론해야 한다는 것을 의미


__sync :__

sync는 동기 처리 메소드이다. 해당 작업을 처리하는 동안 다음으로 진행되지 않고 계속 머물러 있다. 

Example 1:

```swift
DispatchQueue.main.sync {
  print("value: 1")
}
print("value: 2")

// 결과
/*
  value: 1
  value: 2
*/
```

Example 2:

global로 만들고 sync로 만들었으니, 이 global큐가 끝날때 까지는 다른 작업을 하지 않을 것

```swift
DispatchQueue.global().sync {
  for i in 1...5 {
      print(i)
  }
  print("==================")
}
for i in 100...105 {
    print(i)
}

// 결과
/*
  1
  2
  3
  4
  5
  ==================
  100
  101
  102
  103
  104
  105
*/
```

이는 Serial Queue 도 마찬가지.

```swift
let queue = DispatchQueue(label: "queue")
queue.sync {

  for i in 1...5 {
      print(i)
  }
  print("==================")
}
for i in 100...105 {
    print(i)
}

// 결과는 위와 동일
```

__async :__

async는 비동기 처리 메소드 이다. sync와는 다르게 처리를 하라고 지시후 다음으로 넘어가 버린다.

Example 1:

```swift
let globalQueue = DispatchQueue.global(qos: .background)

globalQueue.async {
  print("value: 1")
}
print("value: 2")

// 결과
/*
  value: 2
  value: 1
*/
```

Example 2:

async이기 때문에 결과는 매번 실행때마다 다르다. global 즉, (동시에 실행하는) concurrent 큐 이기 때문에 100...105 loop이 끝나지 않아도 200...205 loop이 실행될 수 있다.

```swift
DispatchQueue.global().async {
  for i in 1...5 {
      print(i)
  }
  print("==================")
}

DispatchQueue.global().async {
  for i in 200...205 {
      print(i)
  }
  print("==================")
}

for i in 100...105 {
    print(i)
}

// 결과
/*
1
100
200
2
101
201
3
202
203
4
204
5
205
==================
==================
102
103
104
105
*/
```

하지만, Serial 에 async를 해보면 역시 async기 때문에 결과는 매번 다르지만, 한가지는 확실하다. 1...5 loop이 끝나야만 200...205 loop이 실행된다. 
Serial이라서 한 task가 끝나야 다음 task가 실행되기 때문. 100...105 loop은 큐안에 들어가 있지 않으니 언제 실행될지 모름.

```swift
let queue = DispatchQueue(label: "queue")

queue.async {
  for i in 1...5 {
      print("i")
  }
  print("==================")
}

queue.async {
  for i in 200...205 {
      print("i")
  }
  print("==================")
}

for i in 100...105 {
      print("i")
  }
  
// 결과

/*
100
1
101
2
102
3
4
5
==================
103
200
104
201
105
202
*/
```

보통 스레드 처리를 하는 작업들은 시간이 꽤나 걸리는 큰 작업이거나 언제 끝날지 알수 없는 작업에 사용 되는데 (ex: 네트워크, 파일로딩), 작업이 처리 되는동안 아무것도 하지 못하고 멈춰 있으면 앱이 렉이 걸리거나 아무 반응이 없는거처럼 보인다. 그래서 보통 동기 처리 메소드인 sync는 잘 사용하지 않는다.

__알아두기!__

Serial / Concurrent와 sync / async 는 별개. 

직렬인데 비동기 일수도 있고, 병렬인데 동기 일수도 있다. 직렬과 병렬은 한번에 하나만 처리하느냐 동시에 여러개 처리하느냐고, 동기와 비동기는 처리가 끝날때까지 기다리느냐 지시만하고 다른 처리를 하느냐 이다.
