import Foundation

public class Aoc3 {
    public let arrayOfValues: [String]
    let tree: Character = "#"
    let freeRoad: Character = "."
    
    public init(arrayOfValues: [String]) {
        self.arrayOfValues = arrayOfValues
    }
    
    public func checkHowManyTreesWillHitUs() -> Int {
        var amountOfTrees = 0
        var currentIndex = 0

        for line in arrayOfValues {
            amountOfTrees = line[currentIndex] == "#" ? amountOfTrees + 1 : amountOfTrees
            currentIndex = currentIndex + 3 <= line.count - 1 ? currentIndex + 3 : currentIndex - line.count + 3
        }

        
        return amountOfTrees
    }
    
    public func checkHowManyTreesWillHitUsInFewVariants() -> Int {
        var amountOfTrees = [Int](repeating: 0, count: 5)
        var currentIndex = [(right: Int, down: Int)](repeating: (0, 0), count: 5)
        let arrayOfSlopes = [(right: 1, down: 1), (right: 3, down:1 ), (right: 5, down: 1), (right: 7, down: 1), (right: 1, down: 2)]
        
        for line in arrayOfValues {
            for index in 0...4 {
                if currentIndex[index].down % arrayOfSlopes[index].down == 0 {
                    amountOfTrees[index] = line[currentIndex[index].right] == "#" ? amountOfTrees[index] + 1 : amountOfTrees[index]
                    currentIndex[index].right = currentIndex[index].right + arrayOfSlopes[index].right <= line.count - 1 ? currentIndex[index].right + arrayOfSlopes[index].right : currentIndex[index].right - line.count + arrayOfSlopes[index].right
                }
                
                currentIndex[index].down += 1
            }
        }
        
        return amountOfTrees.reduce(1, *)
    }
}
