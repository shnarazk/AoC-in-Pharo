Class {
	#name : 'Y2024Day07Test',
	#superclass : 'TestCase',
	#instVars : [
		'solver'
	],
	#category : 'Advent-of-Code-Tests-Puzzle',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Puzzle'
}

{ #category : 'running' }
Y2024Day07Test >> setUp [
  "Put here a common initialization logic for tests"

  super setUp.
  solver := Y2024Day07 new
]

{ #category : 'tests' }
Y2024Day07Test >> testParse [

  | aString |
  solver := Y2024Day07 new.
  aString := Y2024Day07 test1.
  self assert: (solver parse: aString) equals: aString lineCount
]

{ #category : 'tests' }
Y2024Day07Test >> testPart1 [

  solver parse: Y2024Day07 test1.
  self assert: solver part1 equals: 3749
]

{ #category : 'tests' }
Y2024Day07Test >> testPart2 [

  solver parse: Y2024Day07 test1.
  self assert: solver part2 equals: 11387
]

{ #category : 'tests' }
Y2024Day07Test >> testShiftAnd [

  self assert: (solver shift: 21 and: 406) equals: 21406
]
