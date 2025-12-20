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
AoCSolver class >> projectDirecory [

    | env |
    env := Smalltalk os environment.
    ^ env at: 'AOC_DIR' ifAbsent: [ env at: 'HOME' ]
]

{ #category : 'accessing' }
AoCSolver class >> year [

    self subclassResponsibility
]

{ #category : 'reading' }
AoCSolver >> inputData [

    | projectDirectory d |
    projectDirectory := self class projectDirecory.
    d := self class day < 10 ifTrue: [ '0' , self class day asString ]
             ifFalse: [ self class day asString ].
    ^ (projectDirectory , '/data/' , self class year asString , '/input-day' , d , '.txt') asFileReference contents
]

{ #category : 'accessing' }
AoCSolver >> parser [

    self subclassResponsibility
]
