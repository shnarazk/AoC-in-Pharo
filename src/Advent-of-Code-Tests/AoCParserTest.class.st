Class {
	#name : 'AoCParserTest',
	#superclass : 'TestCase',
	#category : 'Advent-of-Code-Tests-Tool',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Tool'
}

{ #category : 'tests-strings' }
AoCParserTest >> testLineParser [
  "comment stating purpose of instance-side method"

  | line number numbers |
  number := #digit asPParser plus token ==> [ :token | token value asNumber ].
  numbers := (number separatedBy: #space asPParser) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
  self assert: (numbers parse: '2') equals: #( 2 ).
  self assert: (numbers parse: '2 3 ') equals: #( 2 3 ).
  line := (number trim: ': ' asPParser) , numbers.
  self assert: (line matches: '12: 21').
  self assert: (line matches: '12: 2 3 14').
  self assert: (line parse: '12: 2 3 14') equals: #( 12 #( 2 3 14 ) )
]

{ #category : 'tests-strings' }
AoCParserTest >> testSimpleParser [

  | identifier |
  identifier := #letter asPParser , #word asPParser star.
  self assert: (identifier matches: 'a12').
  identifier := #digit asPParser star token trim ==> [ :token | token value asNumber ].
  self assert: (identifier parse: '813') equals: 813
]
