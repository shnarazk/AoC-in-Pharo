"
Abstract class for solving Advent-of-Code puzzles.
## Configuration

1. Set `year` and `day`
2. Check the data format by `inputData`
2. Define `parser`
3. Define `part1` and `part2`

So far, `part1` and `part2` are the top level interface. So usually execute:

```
Y20XXDayXX asParser. ""to view the parser's result""
Y20XXDayXX asTest: 1; part1. ""solve part1 for test data 1""
Y20XXDayXX new; part1; part2.
```

"
Class {
	#name : 'AoCSolver',
	#superclass : 'Object',
	#instVars : [
		'mode'
	],
	#category : 'Advent-of-Code-Tool',
	#package : 'Advent-of-Code',
	#tag : 'Tool'
}

{ #category : 'accessing' }
AoCSolver class >> asParser [

    ^ self new asParser
]

{ #category : 'accessing' }
AoCSolver class >> day [

    self subclassResponsibility
]

{ #category : 'accessing' }
AoCSolver class >> forTest: aString [

    ^ self new forTest: aString
]

{ #category : 'accessing' }
AoCSolver class >> projectDirectory [
    "return AoC top directory"

    | env |
    env := OSPlatform current environment.
    ^ env at: 'AOC_DIR' ifAbsent: [ env atGrid: 'HOME' ]
]

{ #category : 'accessing' }
AoCSolver class >> projectDirectory: aDirectory [
    "return AoC top directory"

    | env |
    env := OSPlatform current environment.
    env atGrid: 'AOC_DIR' put: aDirectory
]

{ #category : 'accessing' }
AoCSolver class >> projectDirectoryAnd: subDirectory [
    "return AoC top directory"

    | env base |
    env := OSPlatform current environment.
    base := env at: 'AOC_DIR' ifAbsent: [ env atGrid: 'HOME' ].
    ^ base , '/' , subDirectory
]

{ #category : 'accessing' }
AoCSolver class >> year [

    self subclassResponsibility
]

{ #category : 'public - building' }
AoCSolver >> asParser [
    "return the parsed result"

    | parser |
    parser := self parser.
    ^ parser parse: self inputData
]

{ #category : 'public - building' }
AoCSolver >> forTest: aString [

    mode := aString.
    ^ self
]

{ #category : 'reading' }
AoCSolver >> inputData [

    | projectDirectory d |
    mode ifNotNil: [ self inputData: mode ] ifNil: [  
    projectDirectory := self class projectDirectory.
    d := self class day < 10 ifTrue: [ '0' , self class day asString ]
             ifFalse: [ self class day asString ].
    ^ (projectDirectory , '/data/' , self class year asString , '/input-day' , d , '.txt') asFileReference contents]
]

{ #category : 'reading' }
AoCSolver >> inputData: aNumberOrString [
    "return test data from the file"

    | dataDirectory d alt |
    dataDirectory := self class projectDirectoryAnd: 'data/'.
    d := self class day < 10 ifTrue: [ '0' , self class day asString ]
             ifFalse: [ self class day asString ].
    alt := aNumberOrString asString.
    ^ (dataDirectory , self class year asString , '/input-day' , d , '-' , alt , '.txt') asFileReference contents
]

{ #category : 'public - building' }
AoCSolver >> parser [

    self subclassResponsibility
]

{ #category : 'public - executing' }
AoCSolver >> part1 [

    self subclassResponsibility
]

{ #category : 'public - executing' }
AoCSolver >> part2 [

    self subclassResponsibility
]
