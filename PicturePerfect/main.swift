//
//  main.swift
//  PicturePerfect
//

import Foundation

// INPUT
// Global variable to use later in program
var arrangements = 0

while true {
    print("How many photo arrangements will be considered?")
    guard let givenInput = readLine() else {
        continue
    }
    guard let integerInput = Int(givenInput) else {
        continue
    }
    if integerInput < 1 || integerInput > 10 {
        continue
    }
    arrangements = integerInput
    break
}
// PROCESS
// Implement the primary logic of the problem here
// Some output may be given here if you desire

// Example of how to collect multiple input lines
for i in 1...arrangements {
    print("How many pictures in photo arrangement #\(i)?")
    // Get the input (use guard-let to guarantee it is not nil)
    // and then print it out
    guard let givenInput = readLine() else {
        // If someone enters nil input, just skip to the next line
        continue
    }
    guard let input = Int(givenInput) else {
        continue
    }
    
    var factors : [Int] = []
    
    for i in 1...input {
        if input%i == 0 {
            factors.append(i)
        }
    }
    while factors.count >= 3 {
        factors.remove(at: 0)
        factors.remove(at: factors.count-1)
    }
    if factors.count == 1 {
        print("Minimum perimeters is \(4 * factors[0]) with dimensions \(factors[0]) by \(factors[0]).")
    }
    else if factors.count == 2 {
        print("Minimum perimeters is \((2 * factors[0]) + (2 * factors[1])) with dimensions \(factors[0]) by \(factors[1]).")
    }
}

