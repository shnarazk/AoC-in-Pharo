Class {
	#name : 'Y2024Day07Test',
	#superclass : 'TestCase',
	#category : 'AoC-by-Pharo-Tests-Puzzle',
	#package : 'AoC-by-Pharo-Tests',
	#tag : 'Puzzle'
}

{ #category : 'tests' }
Y2024Day07Test >> testParse [

	| solver |
	solver := Y2024Day07 new.
	self assert: (solver parse: '')
]
