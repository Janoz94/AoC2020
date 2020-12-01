import Foundation

let arrayOfNumbers = [1721, 979, 366, 299, 675, 1456]

let aoc1 = Aoc1(arrayOfNumbers: Aoc1Helper.readFile("/Users/jrutkowski/Documents/Projects/AoC2020/AdventOfCode2020.playground/Resources/aoc1Input"))

print("Advent of code day 1 part 1 solution: \(aoc1.findTwoNumbersWhichSumTo2020AndMultiplyThem())")

print("Advent of code day 1 part 1 solution: \(aoc1.findThreeNumbersWhichSumTo2020AndMultiplyThem())")
