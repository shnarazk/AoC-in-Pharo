"
WIP
"
Class {
	#name : 'Y2025Day04',
	#superclass : 'AoCSolver',
	#instVars : [
		'grid'
	],
	#category : 'Advent-of-Code-Y2025',
	#package : 'Advent-of-Code',
	#tag : 'Y2025'
}

{ #category : 'accessing' }
Y2025Day04 class >> day [

    ^ 4
]

{ #category : 'accessing' }
Y2025Day04 class >> year [

    ^ 2025
]

{ #category : 'parsing' }
Y2025Day04 >> parser [

    | newline line |
    newline := Character cr asPParser | Character lf asPParser.
    line := ($. asPParser ==> [ :p | false ] | ($@ asPParser ==> [ :a | true ])) plus , newline.
    ^ line plus ==> [ :aCollection | GridArray from: aCollection ]
]

{ #category : 'public - executing' }
Y2025Day04 >> part1 [
^ 1

    
]

{ #category : 'public - executing' }
Y2025Day04 >> part2 [

    ^2
]
