//
//  DominoData.swift
//  DominoPractice
//
//  Created by Solji Kim on 10/06/2019.
//  Copyright © 2019 Doyeong Kim. All rights reserved.
//

import Foundation

struct DominoData {
    let category: String
    let products: [Product]
}

struct Product {
    let productName: String
    let price: Int
}

let menus = [
    
    DominoData(category: "슈퍼시드", products: [
        Product(productName: "글램핑 바비큐", price: 10000),
        Product(productName: "알로하 하와이안", price: 10000),
        Product(productName: "우리 고구마", price: 10000),
        Product(productName: "콰트로 치즈 퐁듀", price: 10000)
        ]),
    
    DominoData(category: "프리미엄", products: [
        Product(productName: "더블크러스트 이베리코", price: 10000),
        Product(productName: "블랙앵거스 스테이크", price: 10000),
        Product(productName: "블랙타이거 슈림프", price: 10000),
        Product(productName: "와규 앤 비스테카", price: 10000),
        Product(productName: "직화 스테이크", price: 10000),
        ]),
    
    DominoData(category: "클래식", products: [
        Product(productName: "베이컨체더치즈", price: 10000),
        Product(productName: "불고기", price: 10000),
        Product(productName: "슈퍼디럭스", price: 10000),
        Product(productName: "슈퍼슈프림", price: 10000),
        Product(productName: "페퍼로니", price: 10000),
        Product(productName: "포테이토", price: 10000)
        ]),
    
    DominoData(category: "사이드디시", products: [
        Product(productName: "딸기 슈크림", price: 7000),
        Product(productName: "슈퍼곡물 치킨", price: 7000),
        Product(productName: "애플 크러스트 디저트", price: 7000),
        Product(productName: "치킨퐁듀 그라탕", price: 7000),
        Product(productName: "퀴노아 치킨 샐러드", price: 7000),
        Product(productName: "포테이토 순살치킨", price: 7000)
        ]),
    
    DominoData(category: "음료", products: [
        Product(productName: "미닛메이드 스파클링 청포도", price: 3000),
        Product(productName: "스프라이트", price: 3000),
        Product(productName: "코카콜라 제로", price: 3000),
        Product(productName: "코카콜라", price: 3000)
        ]),
    
    DominoData(category: "피클소스", products: [
        Product(productName: "갈릭 디핑 소스", price: 500),
        Product(productName: "스위트 칠리소스", price: 500),
        Product(productName: "우리 피클 L", price: 500),
        Product(productName: "우리 피클 M", price: 500),
        Product(productName: "핫소스", price: 500)
        ])
]
