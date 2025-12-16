Class {
	#name : 'Y2024Day07',
	#superclass : 'Object',
	#instVars : [
		'lines'
	],
	#category : 'AoC-by-Pharo-Puzzle',
	#package : 'AoC-by-Pharo',
	#tag : 'Puzzle'
}

{ #category : 'tests' }
Y2024Day07 class >> test1 [

"return the first test data"

	^ '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'
]

{ #category : 'accessing' }
Y2024Day07 >> line: anInteger [

	^ lines at: anInteger
]

{ #category : 'parsing' }
Y2024Day07 >> parse: aString [
	"parse input data and store the result into local variables"

	| number line numbers parser |
	number := #digit asPParser star token trim ==> [ :token | token value asNumber ].
	numbers := (number separatedBy: #space asPParser) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
	line := (number trim: ': ' asPParser) , numbers.
	parser := (line delimitedBy: #newline asPParser) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
	lines := parser parse: aString.
	^ true
]
