//
//  iPhoneModel.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

class Phone {
    var name: String
    var colors: [String]
    var storage: [String]
    var processor: String
    var memory: [String]
    var screen: String
    var resolution: String
    var size: String
    var weight: String
    var price: [String]
    
    init(name: String, colors: [String], storage: [String], processor: String, memory: [String], screen: String, resolution: String, size: String, weight: String, price: [String]) {
        self.name = name
        self.colors = colors
        self.storage = storage
        self.processor = processor
        self.memory = memory
        self.screen = screen
        self.resolution = resolution
        self.size = size
        self.weight = weight
        self.price = price
    }
}
