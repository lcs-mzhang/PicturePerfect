//
//  main.swift
//  PicturePerfect
//

import Foundation

// INPUT
// Global variable to use later in program
var arrangements = 0

while true { //filter the user's input
    print("How many photo arrangements will be considered?")
    guard let givenInput = readLine() else {
        continue
    } //filter out all nil input. if the input is nil, reprompt until valid input is found.
    guard let integerInput = Int(givenInput) else {
        continue
    } //filter out all non-integer input. if the input is not an integer, reprompt until valid input is found.
    if integerInput < 1 || integerInput > 10 {
        continue
    } //filter out integer input that is 0 or lower and 11 or higher
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
    } //make sure that the user's input is an integer
    
    var factors : [Int] = []
    
    for i in 1...input {
        if input%i == 0 {
            factors.append(i)
        }
    } //find all factors of the input and append them to an array
    while factors.count >= 3 {
        factors.remove(at: 0)
        factors.remove(at: factors.count-1)
    } //as long as there are 3 or more factors in the array, remove the first and last until there are 3 or less left.
    if factors.count == 1 {
        print("Minimum perimeters is \(4 * factors[0]) with dimensions \(factors[0]) by \(factors[0]).")
    } //if there is only one factor(the number is a perfect square), print the last factor remaining in the array along with the equation to calculate the perimeter for a square
    else if factors.count == 2 {
        print("Minimum perimeters is \((2 * factors[0]) + (2 * factors[1])) with dimensions \(factors[0]) by \(factors[1]).")
    } //if there is more than one factor remaining(a non-perfect square number), print them out along with the equation to calculate the perimeter of a rectangle
}

