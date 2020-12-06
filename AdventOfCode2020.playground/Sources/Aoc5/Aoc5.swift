import Foundation

public class Aoc5 {
    public let arrayOfValues: [(verticalValue: String, horizontalValue:String)]

    public init(arrayOfValues: [(verticalValue: String, horizontalValue:String)]) {
        self.arrayOfValues = arrayOfValues
    }

    public func findBiggestSeatId() -> Int {
        var arrayOfTranslatedBoardingPasses = [(row: Int, column: Int, seatId: Int)]()

        for value in arrayOfValues {
            arrayOfTranslatedBoardingPasses.append(translateBoardingPass(encrypted: value))
        }

        let biggestSeatId = returnBiggestSeatId(decryptedBoardingPasses:arrayOfTranslatedBoardingPasses)
        
        return biggestSeatId
    }
    
    public func findOurSeatId() -> Int {
        var arrayOfTranslatedBoardingPasses = [(row: Int, column: Int, seatId: Int)]()

        for value in arrayOfValues {
            arrayOfTranslatedBoardingPasses.append(translateBoardingPass(encrypted: value))
        }

        let arrayOfTakenSeatIds = returnSortedArrayOfSeatIds(decryptedBoardingPasses: arrayOfTranslatedBoardingPasses)
        let setOfAllSeatIds = Set(arrayOfTakenSeatIds.first! ... arrayOfTakenSeatIds.last!)
        let setOfEmptySeatIds = setOfAllSeatIds.subtracting(arrayOfTakenSeatIds)
        
        return setOfEmptySeatIds.first!
    }
        
    private func translateBoardingPass(encrypted: (verticalValue: String, horizontalValue:String)) -> (row: Int, column: Int, seatId: Int) {
        let row = translateRow(encryptedRow: encrypted.verticalValue)
        let column = translateColumn(encryptedColumn: encrypted.horizontalValue)
        
        return (row: row, column: column, seatId: column + row * 8)
    }
    
    private func translateRow(encryptedRow: String) -> Int {
        var currentValues: (min: Int, max: Int) = (min: 0, max: 127)
        
        for character in encryptedRow {
            if character == "F" {
                let newMax = currentValues.max - (currentValues.max + 1 - currentValues.min) / 2
                currentValues = (min: currentValues.min, max: newMax)
            } else if character == "B" {
                let newMin = currentValues.min + (currentValues.max + 1 - currentValues.min) / 2
                currentValues = (min: newMin, max: currentValues.max)
            }
        }

        return currentValues.max
    }
    
    private func translateColumn(encryptedColumn: String) -> Int {
        var currentValues: (min: Int, max: Int) = (min: 0, max: 7)
        
        for character in encryptedColumn {
            if character == "L" {
                let newMax = currentValues.max - (currentValues.max + 1 - currentValues.min) / 2
                currentValues = (min: currentValues.min, max: newMax)
            } else if character == "R" {
                let newMin = currentValues.min + (currentValues.max + 1 - currentValues.min) / 2
                currentValues = (min: newMin, max: currentValues.max)
            }
        }
        
        return currentValues.max
    }
    
    private func returnBiggestSeatId(decryptedBoardingPasses: [(row: Int, column: Int, seatId: Int)]) -> Int {
        return returnSortedArrayOfSeatIds(decryptedBoardingPasses: decryptedBoardingPasses).max()!
    }
    
    private func returnSortedArrayOfSeatIds(decryptedBoardingPasses: [(row: Int, column: Int, seatId: Int)]) -> [Int] {
        var arrayOfInts = [Int]()
        for decryptedPass in decryptedBoardingPasses {
            arrayOfInts.append(decryptedPass.seatId)
        }
        
        return arrayOfInts.sorted()
    }
}
