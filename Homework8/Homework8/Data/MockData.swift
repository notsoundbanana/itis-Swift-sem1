//
//  MockData.swift
//  Homework8
//
//  Created by Daniil Chemaev on 05.11.2022.
//

import UIKit

struct MockData{

    static let shared = MockData()

    private let favouriteMemes: ListSection = {
        .favouriteMemes([
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: ""),
            .init(title: "", image: "")
        ])
    }()

    private let memes: ListSection = {
        .memes([
            .init(title: "title1", image: ""),
            .init(title: "title2", image: ""),
            .init(title: "title3", image: ""),
            .init(title: "title4", image: ""),
            .init(title: "title5", image: ""),
            .init(title: "title6", image: ""),
            .init(title: "title7", image: ""),
            .init(title: "title8", image: ""),
            .init(title: "title9", image: ""),
            .init(title: "title10", image: "")
        ])
    }()

    var pageData: [ListSection]{
        [favouriteMemes, memes]
    }
}
