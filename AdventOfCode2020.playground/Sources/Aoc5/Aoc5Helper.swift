import Foundation

import Foundation

public class Aoc5Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [(verticalValue: String, horizontalValue:String)] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [(verticalValue: String, horizontalValue:String)]()

        while let line = readLine() {
            let prefix = String(line.prefix(7))
            let suffix = String(line.suffix(3))
            
            inputArray.append((verticalValue: prefix, horizontalValue: suffix))
        }
        
        return inputArray
    }
}
