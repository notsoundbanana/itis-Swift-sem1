//
//  iPhoneModel.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

struct Phone {
    var name: String
    var colors: String
    var storage: String
    var price: String
    
    init(name: String, colors: String, storage: String, price: String) {
        self.name = name
        self.colors = colors
        self.storage = storage
        self.price = price
    }

    public func printInfo() {
        print("""
              Name: \(name)
              Colors: \(colors)
              Storage: \(storage)
              Price: \(price)
            """)
    }
}
