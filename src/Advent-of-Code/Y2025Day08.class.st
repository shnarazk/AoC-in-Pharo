"
A calculation-intensive puzzle
"
Class {
	#name : 'Y2025Day08',
	#superclass : 'AoCSolver',
	#instVars : [
		'boxes'
	],
	#category : 'Advent-of-Code-Y2025',
	#package : 'Advent-of-Code',
	#tag : 'Y2025'
}

{ #category : 'accessing' }
Y2025Day08 class >> day [

    ^ 8
]

{ #category : 'accessing' }
Y2025Day08 class >> year [

    ^ 2025
]

{ #category : 'accessing' }
Y2025Day08 >> boxes [

	^ boxes
]

{ #category : 'parsing' }
Y2025Day08 >> parse: aString [

  boxes := self parser parse: aString.

]

{ #category : 'parsing' }
Y2025Day08 >> parser [
  "return the parser"

  | newline number line |
  newline := Character cr asPParser | Character lf asPParser.
  number := #digit asPParser plus ==> [ :collection | collection inject: 0 into: [ :acc :n | acc * 10 + (n asciiValue - $0 asciiValue) ] ].
  line := number , $, asPParser , number, $, asPParser, number ==>  [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].
  ^(line delimitedBy: newline) ==> [ :collection | collection withIndexSelect: [ :each :i | i odd ] ].

]

{ #category : 'executing' }
Y2025Day08 >> part1 [

    | dists limit |
    dists := self sortedBoxPairs.
    limit := boxes size == 20 ifTrue: [ 10 ]
                 ifFalse: [ 1000 ].
    dists := dists takeFirst: limit.
    ^ dists
]

{ #category : 'executing' }
Y2025Day08 >> part2 [

    ^ 0
]

{ #category : 'executing' }
Y2025Day08 >> sortedBoxPairs [
    "return a collection of box pairs sorted by their distances. Boxes are represented by their id numbers."

    | aCollection |
    aCollection := OrderedCollection new.
    boxes doWithIndex: [ :bi :i |
            boxes doWithIndex: [ :bj :j |
                    i < j ifTrue: [
                            | distance |
                            distance := (bi with: bj collect: [ :a :b | (a * a - (b * b)) abs ]) sum.
                            aCollection add: { #dist -> distance. #i -> i. #j -> j } asDictionary ] ] ].
    ^ aCollection sort: [ :a :b | (a at: #dist) <= (b at: #dist) ]
]
