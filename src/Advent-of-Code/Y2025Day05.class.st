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
Y2025Day05 >> nodeHeap [
  "return sorted collection of occured numbers tagged with start-node or end-node"

  ids ifNil: [ self parse: self inputData ].
  ^ ranges inject: (SortedCollection sortUsing: [ :a :b | a x < b x or: [ a x == b x and: [ a y < b y ] ] ])
      into: [ :acc :each | acc addAll: { each x @ 0. each y @ 1 }; yourself ]
]

{ #category : 'parsing' }
Y2025Day05 >> parse: aString [

  | result |
  result := self parser parse: aString.
  ranges := result first.
  ids := result last
]

{ #category : 'parsing' }
Y2025Day05 >> parser [
  "return the parser"

  | newline number numbers firstPart secondPart |
  newline := Character cr asPParser | Character lf asPParser.
  number := #digit asPParser plus ==> [ :collection | collection inject: 0 into: [ :acc :n | acc * 10 + (n asciiValue - $0 asciiValue) ] ].
  numbers := number , $- asPParser , number ==> [ :anArray | anArray first @ anArray last ].
  firstPart := (numbers delimitedBy: newline) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
  secondPart := (number delimitedBy: newline) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
  ^ firstPart , newline , secondPart ==> [ :anArray | { anArray first. anArray last } ]
]

{ #category : 'executing' }
Y2025Day05 >> part1 [

  ids ifNil: [ self parse: self inputData ].
  ^ ids count: [ :each | ranges anySatisfy: [ :range | each between: range x and: range y ] ]
]

{ #category : 'executing' }
Y2025Day05 >> part2 [

  | result |
  ids ifNil: [ self parse: self inputData ].
  result := self nodeHeap inject: { #level -> 0. #start -> nil. #sum -> 0 } asDictionary into: [ :acc :node |
                node y == 0
                  ifTrue: [ "start a new segment"
                      acc at: #level update: [ :level | level + 1 ].
                      (acc at: #level) == 1 ifTrue: [ acc at: #start put: node x ] ]
                  ifFalse: [ "end of a segment"
                      acc at: #level update: [ :level | level - 1 ].
                      (acc at: #level) == 0 ifTrue: [ acc at: #sum update: [ :sum | sum + node x - (acc at: #start) + 1 ] ] ].
                acc ].
  ^ result at: #sum
]
