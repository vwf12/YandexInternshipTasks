//
//  main.swift
//  TaskB
//
//  Created by FARIT GATIATULLIN on 13.05.2021.
//

import Foundation

struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]
    init(rows: Int, columns: Int,defaultValue: T) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: defaultValue, count: rows * columns) 
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var rows: Int = 4
var cols: Int = 3
var inputString: String = ""
var rowsSumsArray: [Int] = []
var colsSumsArray: [Int] = []

while let input = readLine() {
    guard input != "" else {
        break
    }
        inputString = input
}

var arrayOfStrings = inputString.components(separatedBy: " ")

rows = Int(String(arrayOfStrings[0])) ?? 0
cols = Int(String(arrayOfStrings[1])) ?? 0



var matrix:Matrix<Int> = Matrix(rows: rows, columns: cols,defaultValue:0)


for i in 0..<rows {
    for j in 0..<cols
    {
        let x1 = i + 1
        let y1 = j + 1

        let x2 = rows - i
        let y2 = cols - j

        matrix[i, j] = x1 * y1 * x2 * y2

    }
}

var rowSum = 0
var colSum = 0


for i in 0..<rows {
    for j in 0..<cols
    {
       colSum += matrix[i, j]
    }
    colsSumsArray.append(colSum)
    colSum = 0
}

for j in 0..<cols {
    for i in 0..<rows
    {
       rowSum += matrix[i, j]
    }
    rowsSumsArray.append(rowSum)
    rowSum = 0
}



var stringArray = rowsSumsArray.map { String($0) }
var string = stringArray.joined(separator: " ")
print(string)
stringArray = colsSumsArray.map { String($0) }
string = stringArray.joined(separator: " ")
print(string)

