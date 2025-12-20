"
A GridArrayTest is a test class for testing the behavior of GridArray
"
Class {
	#name : 'GridArrayTest',
	#superclass : 'TestCase',
	#instVars : [
		'aGrid'
	],
	#category : 'Advent-of-Code-Tests-Tool',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Tool'
}

{ #category : 'tests' }
GridArrayTest >> testSize [

    aGrid := GridArray new: 6 @ 4 with: 1.

    self assert: aGrid size equals: 6 * 4
]

{ #category : 'tests' }
GridArrayTest >> testXY [

    aGrid := GridArray new: 4 @ 6 with: 1.
    aGrid x: 2 y: 3 put: 4.
    self assert: (aGrid x: 1 y: 1) equals: 1.
    self assert: (aGrid x: 2 y: 3) equals: 4
]
