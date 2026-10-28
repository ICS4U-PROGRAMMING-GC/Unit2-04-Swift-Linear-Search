/**
 * LinearSearch program that generates random arrays, sorts them,
 * and allows the user to search for values with crash-proof input validation.
 * 
 * @author Carel Gumuyire
 * @version 1.0
 */

import Foundation
/**
 * Populates an array with 10 random integers between 0 and 100.
 * 
 * @return an array of 10 random integers
 */
func populateArray() -> [Int] {
    var array = [Int]()
    for _ in 0..<10 {
        array.append(Int.random(in: 0...100)) // Random number between 0 and 100
    }
    return array
}

/**
 * Performs a linear search on an array to find a target number.
 * 
 * @param array the array of numbers to search through
 * @param number the target number to find
 * @return the index of the number if found, or -1 if not found
 */
func linearSearch(array: [Int], number: Int) -> Int {
    for (index, value) in array.enumerated() {
        if value == number {
            return index // Return index when match is found
        }
    }
    return -1 // Return -1 if the number is not in the array
}

/**
 * Main execution running the interactive loop and handling user input.
 */
var running = true

repeat {
    var array = populateArray() // Populate array with random numbers
    array.sort() // Sort the array using standard sorting
    
    // Display sorted array to the console
    print("\n" + array.map { String($0) }.joined(separator: " "))
    print("Enter a number or \"q\" to quit: ", terminator: "")
    
    guard let input = readLine() else { continue }
    
    // Check if user wants to quit
    if input.lowercased() == "q" {
        print("Thanks for playing")
        running = false
        break
    }
    
    var number = -1
    var valid = false
    var currentInput = input
    
    // Crash-proof input validation loop for non-numeric input (e.g., "hello")
    while !valid {
        if currentInput.lowercased() == "q" {
            print("Thanks for playing")
            running = false
            break
        }
        
        if let parsedNumber = Int(currentInput) {
            number = parsedNumber
            valid = true
        } else {
            print("Invalid input. Enter a valid number or \"q\" to quit: ", terminator: "")
            guard let nextInput = readLine() else { continue }
            currentInput = nextInput
        }
    }
    
    // Run search if user didn't quit during validation
    if running {
        let index = linearSearch(array: array, number: number)
        
        // Display search results
        if index != -1 {
            print("Number found at index: \(index)")
        } else {
            print("Number not found")
        }
    }
    
} while running

