import Foundation


public class Aoc7 {
    public let arrayOfBags: [Bag]
    
    public init(arrayOfValues: [Bag]) {
        arrayOfBags = arrayOfValues
    }
    
    public func findAmountOfBagsWhichContainShinyGoldOne() -> Int {
        let containerBagsDict = findArrayOfContainerBags()
        
        
        return countAmountOfBagContainers(withName: "shiny gold", from: containerBagsDict)
    }
    
    private func countAmountOfBagContainers(withName name: String, from containers: [String: [String]]) -> Int {
        guard var bagContainers = containers[name] else {
            return 0
        }
        
        var bagsWhichContainSearchedBag: [String] = []
        var setOfCheckedContainers = Set<String>()

        
        while bagContainers.count > 0 {
            let bag = bagContainers.removeFirst()
            
            if arrayOfBags.contains(where: { $0.color == bag } ) {
                bagsWhichContainSearchedBag.append(bag)
            }
            
            for container in containers[bag, default: []] {
                if !setOfCheckedContainers.contains(container), !bagContainers.contains(container) {
                    bagContainers.append(container)
                }
            }
            
            setOfCheckedContainers.insert(bag)
        }
        
        return bagsWhichContainSearchedBag.count
    }
    
    private func findArrayOfContainerBags() -> [String: [String]] {
        var containers = [String: [String]]()
        
        for bag in arrayOfBags {
            bag.content.forEach { (color, count) in
                let inside = containers[color, default: []]
                containers[color] = inside + [bag.color]
            }
        }
        
        return containers
    }
}

public final class Bag {
    public let color: String
    public var content: [(color: String, amount: Int)] = []
    
    public init(with color: String) {
        self.color = color
    }
    
    public func appendBagtoBag(withColor color: String, amount: Int) {
        content.append((color: color, amount: amount))
    }
}
