"
A Y2025Day05Test is a test class for testing the behavior of Y2025Day05
"
Class {
	#name : 'Y2025Day05Test',
	#superclass : 'TestCase',
	#instVars : [
		'solver'
	],
	#category : 'Advent-of-Code-Tests-Y2025',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Y2025'
}

{ #category : 'running' }
Y2025Day05Test >> setUp [

  super setUp. "Put here a common initialization logic for tests"
  solver := Y2025Day05 new
]

{ #category : 'tests' }
Y2025Day05Test >> testParser [

  | result |
  result := solver parser parse: (solver inputData: 0).
  self assert: result first size equals: 4.
  self assert: result last size equals: 6.
  self assert: result first last equals: 12 @ 18
]

{ #category : 'tests' }
Y2025Day05Test >> testPart1 [

  solver parse: (solver inputData: 0).
  self assert: solver part1 equals: 3
]

{ #category : 'tests' }
Y2025Day05Test >> testPart2 [

  self flag: #toImplement.
  solver parse: (solver inputData: 0).
  self assert: solver part2 equals: 14
]
