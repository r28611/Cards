//
//  Card.swift
//  Cards
//
//  Created by Margarita Novokhatskaia on 10/01/2022.
//

import UIKit

enum CardType: CaseIterable {
    case circle
    case ring
    case cross
    case square
    case fill
}

enum CardColor: CaseIterable {
    case red
    case green
    case black
    case gray
    case brown
    case yellow
    case purple
    case orange
}

typealias Card = (type: CardType, color: CardColor)
