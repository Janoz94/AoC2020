import Foundation

public class Aoc6 {
    public let arrayOfValues: [[String]]
    
    public init(arrayOfValues: [[String]]) {
        self.arrayOfValues = arrayOfValues
    }
    
    public func checkHowManyQuestionsAllGroupsAnswered() -> Int {
        var answeredQuestions = 0
        
        for groupAnswers in arrayOfValues {
            answeredQuestions += checkHowManyQuestionsGroupAnswered(groupAnswers: groupAnswers)
        }
        
        return answeredQuestions
    }
    
    
    public func checkHowManyComonAnswersAllGroupsAnswered() -> Int {
        var answeredQuestions = 0
        
        for groupAnswers in arrayOfValues {
            answeredQuestions += checkAmountOfCommonAnswersInOneGroup(groupAnswers: groupAnswers)
        }
        
        return answeredQuestions
    }
    
    private func checkHowManyQuestionsGroupAnswered(groupAnswers: [String]) -> Int {
        let commonString = groupAnswers.reduce("", +)

        return Set(commonString).count
    }
    
    private func checkAmountOfCommonAnswersInOneGroup(groupAnswers: [String]) -> Int {
        let arrayOfSetsOfAnswers = groupAnswers.map({  Set($0.map(String.init)) })
        let allPossibleAnswers = Set("abcdefghijklmnopqrstuvwxyz".map(String.init))
        let commonAnswers = arrayOfSetsOfAnswers.reduce(allPossibleAnswers) { $0.intersection($1) }

        return commonAnswers.count
    }
}
