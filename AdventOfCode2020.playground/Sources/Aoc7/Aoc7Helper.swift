import Foundation

public class Aoc7Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [Bag] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [Bag]()

        
        while let line = readLine() {
            if !line.isEmpty {
                let splitedLine = line.components(separatedBy: " bags contain ")
                let bagColor = splitedLine[0]
                let bag = Bag(with: bagColor)
                
                if splitedLine[1] != "no other bags." {
                    for color in splitedLine[1].components(separatedBy: ", ") {
                        let wordsInColor = color.components(separatedBy: " ")
                        let appendedBagColorName = "\(wordsInColor[1]) \(wordsInColor[2])"
                        let appendedBagsAmount = Int(wordsInColor[0])!
                        
                        bag.appendBagtoBag(withColor: appendedBagColorName, amount: appendedBagsAmount)
                    }
                }
                inputArray.append(bag)
            }
        }
        return inputArray
    }
}
