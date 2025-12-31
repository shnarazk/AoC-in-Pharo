"
A Y2025Day08Test is a test class for testing the behavior of Y2025Day08
"
Class {
	#name : 'Y2025Day08Test',
	#superclass : 'TestCase',
	#instVars : [
		'solver'
	],
	#category : 'Advent-of-Code-Tests-Y2025',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Y2025'
}

{ #category : 'running' }
Y2025Day08Test >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	solver := Y2025Day08 new
]

{ #category : 'tests' }
Y2025Day08Test >> testParser [

    | aString |
    aString := solver inputData: 0.
    solver parse: aString.
    self assert: solver boxes size equals: (aString count: [ :ch | ch == Character lf ])
]

{ #category : 'tests' }
Y2025Day08Test >> testPart1 [

	solver parse: (solver inputData: 0).
	self assert: solver part1 equals: 40.
]

{ #category : 'tests' }
Y2025Day08Test >> testPart2 [

	solver parse: (solver inputData: 0).
	self assert: solver part2 equals: 25272.
]
