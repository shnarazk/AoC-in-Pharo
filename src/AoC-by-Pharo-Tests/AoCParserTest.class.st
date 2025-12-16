Class {
	#name : 'AoCParserTest',
	#superclass : 'TestCase',
	#category : 'AoC-by-Pharo-Tests-Tool',
	#package : 'AoC-by-Pharo-Tests',
	#tag : 'Tool'
}

{ #category : 'tests-strings' }
AoCParserTest >> testSimpleParser [

	| identifier |
	identifier := #letter asPParser , #word asPParser star.
	self assert: (identifier matches: 'a12') equals: true
]
