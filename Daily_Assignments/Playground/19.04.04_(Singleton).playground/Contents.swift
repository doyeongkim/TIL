import UIKit

/*
 [ 도전 과제 ]
 
 1.
 Singleton 플레이그라운드의 Basic Example 에서 Singleton 을 이용해 구현한 내용을
 User 클래스에 싱글턴 패턴을 사용하지 않고도 동일한 결과가 나오도록 구현해보기
 (User 클래스 내용은 싱글턴을 제거하는 것 외에 건드리지 않아야 함. 타입 프로퍼티도 사용하지 않고 구현)

 */

/*
 class User {
 static let shared = User()
 //  private init() {}
 var friends: [Friends] = []
 var blocks: [Friends] = []
 }
 
 struct Friends {
 let name: String
 }
 
 struct FriendList {
 mutating func addFriend(name: String) {
 
     let user = User.shared
     let friend = Friends(name: name)
     user.friends.append(friend)
 }
 }
 
 var friendList = FriendList()
 friendList.addFriend(name: "원빈")
 friendList.addFriend(name: "장동건")
 friendList.addFriend(name: "정우성")
 User.shared.friends
 */

//class User {
//    var friends: [Friends] = []
//    var blocks: [Friends] = []
//}
//
//struct Friends {
//    let name: String
//}
//
//var user = User()
//var user2 = User()
//
//struct FriendList {
//    mutating func addFriend(name: String, newUser: User) {
//        let friends = Friends(name: name)
//        newUser.friends.append(friends)
//    }
//}
//
//var friendList = FriendList()
//friendList.addFriend(name: "원빈", newUser: user)
//friendList.addFriend(name: "장동건", newUser: user)
//friendList.addFriend(name: "정우성", newUser: user)
//
//friendList.addFriend(name: "정우성", newUser: user2)
//
//user.friends
//user2.friends


// class vs struct
class A {
    var x = 0
}
struct B {
    var x = 0
}
let a = A()
let a1 = a

var b = B()
let b1 = b


// reference type
a.x = 10
a1.x

// value type
b.x = 20
b1.x


// (1-1. 도전 과제의 심화 문제: 위 도전 과제의 User를 class 로 구현했으면 struct로 변경하여 구현해보기)

struct User {
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends {
    let name: String
}

var user = User()
var user2 = User()

struct FriendList {
    mutating func addFriend(name: String, newUser: User) -> User {
        var newUser = newUser
        let friends = Friends(name: name)
        newUser.friends.append(friends)
        return newUser
    }
}

var friendList = FriendList()

user = friendList.addFriend(name: "원빈", newUser: user)
user.friends

user = friendList.addFriend(name: "장동건", newUser: user)
user.friends

user = friendList.addFriend(name: "정우성", newUser: user)
user.friends

user2 = friendList.addFriend(name: "정우성", newUser: user2)
user2.friends


user2.friends

