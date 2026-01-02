"
An Integer Linear Programming solver to solve AoC y2025 day10 part2
"
Class {
	#name : 'ILPSolver',
	#superclass : 'Object',
	#instVars : [
		'numberOfVariables',
		'equations'
	],
	#category : 'Advent-of-Code-Tool',
	#package : 'Advent-of-Code',
	#tag : 'Tool'
}

{ #category : 'as yet unclassified' }
ILPSolver >> buildSubProblem [

    ^ equations
]

{ #category : 'as yet unclassified' }
ILPSolver >> emptyEquation [
    "return an empty equation"

    ^ self emptyEquation: numberOfVariables
]

{ #category : 'as yet unclassified' }
ILPSolver >> emptyEquation: size [
    "return an empty `size`-variable equation"

    | coeffs |
    coeffs := Array new: size withAll: 0.
    ^ { #coeffs -> coeffs. #value -> 0 } asDictionary
]

{ #category : 'accessing' }
ILPSolver >> equations [

	^ equations
]

{ #category : 'accessing' }
ILPSolver >> equations: anObject [

	equations := anObject
]

{ #category : 'accessing' }
ILPSolver >> numberOfVariables [

	^ numberOfVariables
]

{ #category : 'accessing' }
ILPSolver >> numberOfVariables: anObject [

	numberOfVariables := anObject
]

{ #category : 'as yet unclassified' }
ILPSolver >> solve [

    | subSolver |
    numberOfVariables == 1 ifTrue: [ ^ self solveOneVariableEquation ].
    self sortEquations.
    subSolver := self class new.
    subSolver equations: self buildSubProblem.
    ^ 1
]

{ #category : 'as yet unclassified' }
ILPSolver >> solveOneVariableEquation [

    | coeff value |
    coeff := (equations first at: #coeffs) first.
    value := equations first at: #value.
    (value isDivisibleBy: coeff) ifTrue: [ ^ value / coeff ]
        ifFalse: [ self error: 'not integer problem' ]
]

{ #category : 'sorting' }
ILPSolver >> sortEquations [
    "reorder equations so that all equation with non-zero coefficient for the first variable should be at the head"

    | found notFound |
    found := OrderedCollection new.
    notFound := OrderedCollection new.
    equations do: [ :equation |
            (equation at: #coeffs) first ~= 0 ifTrue: [ found add: equation ]
                ifFalse: [ notFound add: equation ] ].
    found addAllLast: notFound.
    equations := found asArray.

]
