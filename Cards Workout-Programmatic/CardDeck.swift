//
//  Card.swift
//  Cards Workout-Programmatic
//
//  Created by Bruno Rangel on 23/05/23.
//

import UIKit

struct CardDeck {
    private static var naipes = ["H", "S", "C", "D"]
    static var allCards = fetchAllCards()
    
    private static func fetchAllCards() -> [UIImage] {
        var cards: [UIImage] = []
        for naipe in naipes {
            for i in 2...10 {
                cards.append(UIImage(named: "\(i)\(naipe)")!)
            }
            cards.append(UIImage(named: "J\(naipe)")!)
            cards.append(UIImage(named: "Q\(naipe)")!)
            cards.append(UIImage(named: "K\(naipe)")!)
            cards.append(UIImage(named: "A\(naipe)")!)
        }
        return cards
    }
}
