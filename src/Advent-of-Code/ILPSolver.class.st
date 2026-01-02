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

{ #category : 'building' }
ILPSolver >> buildSubProblem: eliminator [
    "return the equations stripped the first elements from all arrays in #coeffs"

    | c1 e1 v1 |
    c1 := (eliminator at: #coeffs) first.
    e1 := (eliminator at: #coeffs) allButFirst.
    v1 := eliminator at: #value.
    ^ equations collect: [ :equation |
              (equation at: #coeffs) first == 0 ifTrue: [
                      { #coeffs -> (equation at: #coeffs) allButFirst. #value -> (equation at: #value) } asDictionary ]
                  ifFalse: [
                          | scale coeffs s1 s2 value |
                          scale := c1 lcm: (equation at: #coeffs) first.
                          s1 := scale / c1.
                          s2 := scale / (equation at: #coeffs) first.
                          coeffs := (equation at: #coeffs) allButFirst with: e1 collect: [ :a :e | a * s2 - (e * s1) ].
                          value := (equation at: #value) * s2 - (v1 * s1).
                          { #coeffs -> coeffs. #value -> value } asDictionary ] ]
]

{ #category : 'building' }
ILPSolver >> emptyEquation [
    "return an empty equation"

    ^ self emptyEquation: numberOfVariables
]

{ #category : 'building' }
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
ILPSolver >> equations: anArray [

	equations := anArray
]

{ #category : 'accessing' }
ILPSolver >> numberOfVariables [

	^ numberOfVariables
]

{ #category : 'accessing' }
ILPSolver >> numberOfVariables: anObject [

	numberOfVariables := anObject
]

{ #category : 'executing' }
ILPSolver >> solve [

    | subSolver eliminator |
    numberOfVariables == 1 ifTrue: [ ^ self solveOneVariableEquation ].
    self sortEquations.
    eliminator := equations first.
    subSolver := self class new.
    subSolver equations: (self buildSubProblem: eliminator).
    ^ 1
]

{ #category : 'executing' }
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
