//
//  GenerateData.swift
//  Homework6
//
//  Created by Daniil Chemaev on 19.10.2022.
//

class GenerateData {
    
    func getData() -> [Phone] {
        
        var iPhone14ProMax = Phone(name: "iPhone 14 Pro Max", colors: "Space Black, Silver, Gold, Deep Purple", storage: "128GB, 256GB, 512GB, 1TB", price:  "$1099, $1199, $1399, $1599")
        
        var iPhone14Pro = Phone(name: "iPhone 14 Pro", colors: "Space Black, Silver, Gold, Deep Purple", storage: "128GB, 256GB, 512GB, 1TB", price: "$999, $1099, $1299, $1499")
        
        var iPhone14Plus = Phone(name: "iPhone 14 Plus", colors: "Midnight, Purple, Starlight, (PRODUCT)RED, Blue", storage: "128GB, 256GB, 512GB", price: "$899, $999, $1199")
        
        var iPhone14 = Phone(name: "iPhone 14", colors: "Midnight, Purple, Starlight, (PRODUCT)RED, Blue", storage: "128GB, 256GB, 512GB", price: "$799, $899, $1099")
        
        var iPhone13 = Phone(name: "iPhone 13", colors: "Green, Pink, Blue, Midnight, Starlight, (PRODUCT)RED", storage: "128GB, 256GB, 512GB", price: "$699, $799, $999")
        
        var iPhone13mini = Phone(name: "iPhone 13 mini", colors: "Green, Pink, Blue, Midnight, Starlight, (PRODUCT)RED", storage: "128GB, 256GB, 512GB", price: "$599, $699, $899")
        
        var iPhone12ProMax = Phone(name: "iPhone 12 Pro Max", colors: "Graphite, Silver, Pacific Blue, Gold", storage: "128GB, 256GB, 512GB", price: "$799, $899, $999")
        
        var iPhone12Pro = Phone(name: "iPhone 12 Pro", colors: "Graphite, Silver, Pacific Blue, Gold", storage: "128GB, 256GB, 512GB", price: "$699, $799, $899")
        
        var iPhone12 = Phone(name: "iPhone 12", colors: "Black, White, (PRODUCT)RED, Green, Blue, Purple", storage: "64GB, 128GB, 256GB", price: "$599, $649, $749")
        
        var iPhoneSE2020 = Phone(name: "iPhone SE 2020", colors: "Midnight, Starlight, (PRODUCT)RED", storage: "64GB, 128GB, 256GB", price: "$429, $479, $579")
        
        var phones = [iPhone14ProMax, iPhone14Pro, iPhone14Plus, iPhone14, iPhone13, iPhone13mini, iPhone12ProMax, iPhone12Pro, iPhone12, iPhoneSE2020]
        
        return phones
    }
}
