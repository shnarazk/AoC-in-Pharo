"
expanding tree nodes problem.

幅優先でないならA*?
"
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

{ #category : 'reading' }
Y2024Day07 >> getInputData [

	| data |
	data := '/Users/nash/Repositories/advent-of-code/data/2024/input-day07.txt' asFileReference contents.
	"self parse: data."
	^ data
]

{ #category : 'accessing' }
Y2024Day07 >> line: anInteger [

	^ lines at: anInteger
]

{ #category : 'accessing' }
Y2024Day07 >> lines [

	^ lines
]

{ #category : 'parsing' }
Y2024Day07 >> parse: aString [
	"parse input data and store the result into local variables"

	| number line numbers parser |
	number := #digit asPParser star token ==> [ :token | token value asNumber ].
	numbers := (number separatedBy: ' ' asPParser) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
	line := (number trim: ': ' asPParser) , numbers.
	parser := (line delimitedBy: Character cr asPParser | Character lf asPParser)
	          ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
	lines := parser parse: aString trim.
	^ lines size
]

{ #category : 'executing' }
Y2024Day07 >> part1 [

	^ (lines collect: [ :setting |
			   | target values |
			   "292: 11 6 16 20 can be solved in exactly one way: 11 + 6 * 16 + 20"
			   target := setting first.
			   values := Set new
				             add: setting last first;
				             yourself.
			   setting last from: 2 to: setting last size do: [ :each |
					   values := values inject: Set new into: [ :acc :val |
							             acc
								             add: val + each;
								             add: val * each;
								             yourself ].
					   values := values select: [ :val | val <= target ] ].
			   (values includes: target)
				   ifTrue: [ target ]
				   ifFalse: [ 0 ] ]) sum
]

{ #category : 'executing' }
Y2024Day07 >> part2 [

	^ (lines collect: [ :setting |
			   | target values |
			   "292: 11 6 16 20 can be solved in exactly one way: 11 + 6 * 16 + 20"
			   target := setting first.
			   values := Set new
				             add: setting last first;
				             yourself.
			   setting last from: 2 to: setting last size do: [ :each |
					   values := values inject: Set new into: [ :acc :val |
							             acc
								             add: val + each;
								             add: val * each;
								             add: (self shift: val and: each whichOriginal: each);
								             yourself ].
					   values := values select: [ :val | val <= target ] ].
			   (values includes: target)
				   ifTrue: [ target ]
				   ifFalse: [ 0 ] ]) sum
]

{ #category : 'executing' }
Y2024Day07 >> part2a [

    ^ (lines collect: [ :setting |
               | target values |
               "292: 11 6 16 20 can be solved in exactly one way: 11 + 6 * 16 + 20"
               target := setting first.
               values := Set new add: setting last first; yourself.
               self searchFrom: setting last first with: setting last allButFirst to: target ]) sum
]

{ #category : 'executing' }
Y2024Day07 >> part2startFrom: aNumber with: numbers to: target [
	"self part2startFrom: 11 with { 6. 16. 20 } to: 292 means 292: 11 + 6 * 16 + 20"

	| values |
	values := Set new add: aNumber; yourself.
	numbers do: [ :each |
			values := values inject: Set new
				          into: [ :acc :val |
				          acc add: val + each; add: val * each; add: (self shift: val and: each whichOriginal: each); yourself ].
			values := values select: [ :val | val <= target ] ].
	(values includes: target) ifTrue: [ ^ target ]
		ifFalse: [ ^ 0 ]
]

{ #category : 'executing' }
Y2024Day07 >> searchFrom: aNumber with: numbers to: target [

    | toVisit goalState |
    goalState := { target. numbers size + 1 }.
    toVisit := Heap new sortBlock: [ :a :b | a first > b first ]; add: { aNumber. 1 }; yourself.
    [ toVisit isNotEmpty ] whileTrue: [
            | state |
            state := toVisit removeFirst.
            state last = goalState last ifTrue: [ state first = goalState first ifTrue: [ ^ target ] ]
                ifFalse: [
                        | operand |
                        operand := numbers at: state last.
                        toVisit addAll:
                            ({ state first + operand. state first * operand. self shift: state first and: operand } select: [
                                 :next | next <= target ]
                                 thenCollect: [ :val | { val. state last + 1 } ]) ] ].
    ^ 0
]

{ #category : 'evaluating' }
Y2024Day07 >> shift: aNumber and: anotherNumber [

	| a b |
	a := aNumber.
	b := anotherNumber.
	[ b >= 10 ] whileTrue: [
			a := 10 * a.
			b := b // 10 ].
	^ a * 10 + anotherNumber
]

{ #category : 'evaluating' }
Y2024Day07 >> shift: aNumber and: anotherNum whichOriginal: anotherNumber [

	anotherNum < 10
		ifTrue: [ ^aNumber * 10 + anotherNumber ]
		ifFalse: [ ^self shift: aNumber * 10 and: anotherNum // 10 whichOriginal: anotherNumber ]
]
