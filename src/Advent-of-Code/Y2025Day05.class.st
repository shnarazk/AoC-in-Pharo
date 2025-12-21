"
problem on overlapping regions
"
Class {
	#name : 'Y2025Day05',
	#superclass : 'AoCSolver',
	#instVars : [
		'ids',
		'ranges'
	],
	#category : 'Advent-of-Code-Y2025',
	#package : 'Advent-of-Code',
	#tag : 'Y2025'
}

{ #category : 'accessing' }
Y2025Day05 class >> day [

    ^ 5
]

{ #category : 'accessing' }
Y2025Day05 class >> year [

    ^ 2025
]

{ #category : 'executing' }
Y2025Day05 >> parse: aString [

    | result |
    result := self parser parse: aString.
    ranges := result first.
    ids := result last
]

{ #category : 'accessing' }
Y2025Day05 >> parser [
    "return the parser"

    | newline number numbers firstPart secondPart |
    newline := Character cr asPParser | Character lf asPParser.
    number := #digit asPParser plus token ==> [ :token | token value asNumber ].
    numbers := (number , $- asPParser , number) ==> [ :anArray | anArray first @ anArray last ].
    firstPart := (numbers delimitedBy: newline) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
    secondPart := (number delimitedBy: newline) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
    ^ (firstPart , newline, secondPart) ==> [ :anArray | { anArray first. anArray last } ]
]

{ #category : 'executing' }
Y2025Day05 >> part1 [

    ids ifNil: [ self parse: self inputData ].
    ^ ids count: [ :each | ranges anySatisfy: [ :range |  each between: range x and: range y ] ]
]

{ #category : 'executing' }
Y2025Day05 >> part2 [

    | heap |
    ids ifNil: [ self parse: self inputData ].
    heap := ranges inject: (Heap new sortBlock: #<) into: [ :acc :each | acc add: each x @ 0; add: each y @ 1; yourself ].
    heap inject: { 0. 0. 0 } into: [ :acc :terminal |
            | level start total |
            level := acc first.
            start := acc at: 2.
            total := acc last.
            level == 0
                ifTrue: [
                        level := 1.
                        self flag: #todo ]
                ifFalse: [ self flag: #todo ].
            { level. start. total } ].
    ^ heap asArray
]
