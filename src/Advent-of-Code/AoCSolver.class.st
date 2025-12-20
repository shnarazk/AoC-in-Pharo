Class {
	#name : 'AoCSolver',
	#superclass : 'Object',
	#category : 'Advent-of-Code-Tool',
	#package : 'Advent-of-Code',
	#tag : 'Tool'
}

{ #category : 'accessing' }
AoCSolver class >> day [

    self subclassResponsibility
]

{ #category : 'accessing' }
AoCSolver class >> projectDirectory [
    "return AoC top directory"

    | env |
    env := Smalltalk os environment.
    ^ env at: 'AOC_DIR' ifAbsent: [ env at: 'HOME' ]
]

{ #category : 'accessing' }
AoCSolver class >> projectDirectory: subDirectory [
    "return AoC top directory"

    | env base |
    env := Smalltalk os environment.
    base := env at: 'AOC_DIR' ifAbsent: [ env at: 'HOME' ].
    ^ base , '/' , subDirectory
]

{ #category : 'accessing' }
AoCSolver class >> year [

    self subclassResponsibility
]

{ #category : 'reading' }
AoCSolver >> inputData [

    | projectDirectory d |
    projectDirectory := self class projectDirectory.
    d := self class day < 10 ifTrue: [ '0' , self class day asString ]
             ifFalse: [ self class day asString ].
    ^ (projectDirectory , '/data/' , self class year asString , '/input-day' , d , '.txt') asFileReference contents
]

{ #category : 'reading' }
AoCSolver >> inputData: aNumberOrString [
    "return test data from the file"

    | dataDirectory d alt |
    dataDirectory := self class projectDirectory: 'data/'.
    d := self class day < 10 ifTrue: [ '0' , self class day asString ]
             ifFalse: [ self class day asString ].
    alt := aNumberOrString asString.
    ^ (dataDirectory , self class year asString , '/input-day' , d , '-' , alt , '.txt') asFileReference contents
]

{ #category : 'accessing' }
AoCSolver >> parser [

    self subclassResponsibility
]
