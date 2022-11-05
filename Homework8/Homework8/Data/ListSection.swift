//
//  ListSection.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import Foundation

enum ListSection {
    case favouriteMemes([ListItem])
    case memes([ListItem])

    var items: [ListItem] {
        switch self {
        case .favouriteMemes(let items), .memes(let items):
            return items
        }
    }

    var count: Int {
        items.count
    }

    var title: String {
        switch self {
        case .favouriteMemes(_):
            return "Favourite memes"
        case .memes(_):
            return "Memes"
        }
    }
}
