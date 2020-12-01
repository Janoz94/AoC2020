import Foundation

public class Aoc1Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [Int] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [Int]()

        while let line = readLine() {
            if let int = Int(line) {
                inputArray.append(int)
            }
        }
        return inputArray
    }
}
