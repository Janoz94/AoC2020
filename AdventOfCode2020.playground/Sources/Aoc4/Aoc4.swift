import Foundation

public class Aoc4 {
    public let arrayOfValues: [String]
    private enum Field: String, CaseIterable {
        case birthYear = "byr"
        case issueYear = "iyr"
        case expirationYear = "eyr"
        case height = "hgt"
        case hairColor = "hcl"
        case eyeColor = "ecl"
        case passportId = "pid"
        case countryId = "cid"
    }

    public init(arrayOfValues: [String]) {
        self.arrayOfValues = arrayOfValues
    }
    
    public func countAmountOfValidPassword() -> Int {
        var amountOfValidPassports = 0

        for line in arrayOfValues {
            if checkIsPassportValid(line: line) {
                amountOfValidPassports += 1
            }
        }
        
        return amountOfValidPassports
    }
        
    public func countAmountOfDoublyValidPasswords() -> Int {
        var amountOfValidPassports = 0

        
        for line in arrayOfValues {
            if arePassportDataValid(line: line) {
                amountOfValidPassports += 1
            }
        }

        return amountOfValidPassports
    }
    
    private func checkIsPassportValid(line: String) -> Bool {
        let arrayOfObligatoryFields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

        return !arrayOfObligatoryFields.contains(where: { !line.contains($0) })
    }
    
    private func arePassportDataValid(line: String) -> Bool {
        guard checkIsPassportValid(line: line) else {
            return false
        }
        let dict = parseToDictionary(passport: line)
        
        for field in dict {
            switch field.key {
            case .birthYear:
                guard let year = Int(field.value), year <= 2002, year >= 1920 else {
                    return false
                }
            case .countryId:
                continue
            case .expirationYear:
                guard let year = Int(field.value), year <= 2030, year >= 2020 else {
                    return false
                }
            case .eyeColor:
                let eyeColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
                guard eyeColors.contains(field.value) else {
                    return false
                }
            case .hairColor:
                let hairColor = field.value
                guard hairColor.hasPrefix("#"), hairColor.count == 7, Int(hairColor.dropFirst(), radix: 16) != nil else {
                    return false
                }
            case .height:
                let height = field.value
                if height.hasSuffix("cm") {
                    guard let meassurement = Int(height.dropLast(2)) else {
                            return false
                    }
                    guard meassurement >= 150, meassurement <= 193 else {
                            return false
                    }
                } else if height.hasSuffix("in") {
                    guard let meassurement = Int(height.dropLast(2)) else {
                            return false
                    }
                    guard meassurement >= 59, meassurement <= 76 else {
                            return false
                    }
                } else {
                    return false
                }
            case .issueYear:
                guard let year = Int(field.value), year <= 2020, year >= 2010 else {
                    return false
                }
            case .passportId:
                guard field.value.count == 9 && Int(field.value) != nil else {
                    return false
                }
            }
        }

        return true
    }
    
    private func parseToDictionary(passport: String) -> [Field : String] {
        let futureDict = passport
            .components(separatedBy: " ")
            .map( { $0.components(separatedBy: ":") } )
        
           
        var dict = [Field: String]()
        for position in futureDict {
            if let field = Field(rawValue: position[0]) {
                dict[field] = position[1]
            }
        }
        
        return dict
    }
    
}
