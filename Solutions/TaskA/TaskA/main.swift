//
//  main.swift
//  Ynd_test
//
//  Created by FARIT GATIATULLIN on 13.05.2021.
//

import Foundation

var text = ""
//var arrayOfStrings: [String]?
var sortedDictionary: [Int: String] = [:]
var outputArray: [String] = []
var inputArray: [String] = []

//let file = "input.txt"
//
//
//if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//    let fileURL = dir.appendingPathComponent(file)
//    do {
//        text = try String(contentsOf: fileURL, encoding: .utf8)
//    }
//    catch {
//        print("Wrong input")
//    }
//}

while let input = readLine() {
    guard input != "" && input.count < 10000 && inputArray.count < 10000 else {
        break
    }
        inputArray.append(input)
}
//arrayOfStrings = inputArray

//arrayOfStrings = text.components(separatedBy: "\n")
//if let arrayOfStrings = arrayOfStrings {
    for string in inputArray {
//        for character in stringArray {
            var num: Int? = nil
//            if character.isNumber {
//                num = Int(String(character)) ?? 0
//            }
        let decimalString = string
            .components(separatedBy:CharacterSet.decimalDigits.inverted)
            .joined()
        if decimalString.count != 0 && decimalString.count <= 12 {

            num = Int(decimalString)
        }
            let filteredString = string
                .components(separatedBy:CharacterSet.decimalDigits)
                .joined()
            if let num = num {
                sortedDictionary[num] = String(filteredString)
            }
//        }

    }
//}

let sortedArray = sortedDictionary.sorted {$0.key < $1.key}
for (_, value) in sortedArray {
    outputArray.append(value)
}
print(outputArray.joined(separator: "\n"))
