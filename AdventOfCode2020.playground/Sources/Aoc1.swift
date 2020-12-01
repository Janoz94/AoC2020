import Foundation

public class Aoc1 {
    let arrayOfNumbers: [Int]
    
    public init(arrayOfNumbers: [Int]) {
        self.arrayOfNumbers = arrayOfNumbers
    }
    
    private func foundNumbersWhichSumTo2020() -> (firstNumber: Int, secondNumber: Int)?  {
        for firstNumber in arrayOfNumbers {
            if let indexOfSecondNumber = arrayOfNumbers.firstIndex(of: 2020 - firstNumber) {
                return (firstNumber, arrayOfNumbers[indexOfSecondNumber])
            }
        }
        
        return nil
    }
    
    public func multiplyNumberIfExist() -> Int? {
        guard let tupleOfCorrectNumbers = foundNumbersWhichSumTo2020() else {
            return nil
        }
        
        return tupleOfCorrectNumbers.firstNumber * tupleOfCorrectNumbers.secondNumber
    }
}
