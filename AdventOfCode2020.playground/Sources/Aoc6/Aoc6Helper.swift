import Foundation

public class Aoc6Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [[String]] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [[String]]()

        var currentIndex = 0
        while let line = readLine() {
            if line.isEmpty {
               currentIndex += 1
            } else {
                if inputArray.count < currentIndex + 1 {
                    inputArray.append([])
                    inputArray[currentIndex].append(line)
                } else {
                    inputArray[currentIndex].append(line)
                }
            }
        }
        return inputArray
    }
}
