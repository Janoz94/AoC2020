import Foundation

public class Aoc3Helper {
    public init() { }
    
    public static func readFile(_ path: String) -> [String] {
        errno = 0
        
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return []
        }
        var inputArray = [String]()

        while let line = readLine() {
            if !line.isEmpty {
                inputArray.append(line)
            }
        }
        return inputArray
    }
}
