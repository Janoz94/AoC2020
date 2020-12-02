import Foundation

public class Aoc1 {
    let arrayOfNumbers: [Int]
    
    public init(arrayOfNumbers: [Int]) {
        self.arrayOfNumbers = arrayOfNumbers
    }
    
    public func findTwoNumbersWhichSumTo2020AndMultiplyThem() -> Int?  {
        for firstNumber in arrayOfNumbers {
            if let indexOfSecondNumber = arrayOfNumbers.firstIndex(of: 2020 - firstNumber) {
                return firstNumber * arrayOfNumbers[indexOfSecondNumber]
            }
        }
        
        return nil
    }

    public func findThreeNumbersWhichSumTo2020AndMultiplyThem() -> Int? {
        for firstNumber in arrayOfNumbers {
            let resultAfterSubtractingFirstNumber = 2020 - firstNumber
                
            guard resultAfterSubtractingFirstNumber > 0 else {
                return nil
            }
            
            for secondNumber in arrayOfNumbers.filter({ $0 < firstNumber }) {
                if let indexOfThirdNumber = arrayOfNumbers.firstIndex(of: resultAfterSubtractingFirstNumber - secondNumber) {
                    return firstNumber * secondNumber * arrayOfNumbers[indexOfThirdNumber]
                }
            }
        }
        
        return nil
    }
}
