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
ILPSolver >> buildSubProblem [
    "return the reduced myself stripped the first elements from all arrays in #coeffs "

    | eliminator subequations |
    self sortEquations.
    eliminator := equations first.
    subequations := equations allButFirst.
    ^ self buildSubProblemOf: subequations by: eliminator
]

{ #category : 'building' }
ILPSolver >> buildSubProblemOf: targetEquations by: eliminator [
    "return the reduced myself of `targetEquations` stripped the first elements from all arrays in #coeffs based on e`liminator`"

    | c1 e1 v1 eqs instance |
    c1 := (eliminator atGrid: #coeffs) first.
    e1 := (eliminator atGrid: #coeffs) allButFirst.
    v1 := eliminator atGrid: #value.
    eqs := targetEquations collect: [ :equation |
                   (equation atGrid: #coeffs) first == 0 ifTrue: [
                           { #coeffs -> (equation atGrid: #coeffs) allButFirst. #value -> (equation atGrid: #value) } asDictionary ]
                       ifFalse: [
                               | scale coeffs s1 s2 value |
                               scale := c1 lcm: (equation atGrid: #coeffs) first.
                               s1 := scale / c1.
                               s2 := scale / (equation atGrid: #coeffs) first.
                               coeffs := (equation atGrid: #coeffs) allButFirst with: e1 collect: [ :a :e | a * s2 - (e * s1) ].
                               value := (equation atGrid: #value) * s2 - (v1 * s1).
                               { #coeffs -> coeffs. #value -> value } asDictionary ] ].
    instance := self class new.
    instance numberOfVariables: numberOfVariables - 1; equations: eqs.
    ^ instance
]

{ #category : 'building' }
ILPSolver >> emptyEquation [
    "return an empty equation"

    ^ self emptyEquation: self numberOfVariables
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
    "return the number of variables. It is defined by the number of the equations."

    ^ numberOfVariables
]

{ #category : 'accessing' }
ILPSolver >> numberOfVariables: aNumber [
    "return the number of variables. It is defined by the number of the equations."

    numberOfVariables := aNumber
]

{ #category : 'executing' }
ILPSolver >> solve [

    | subSolver eliminator |
    self numberOfVariables == 1 ifTrue: [ ^ self solveOneVariableEquation ].
    self sortEquations.
    eliminator := equations first.
    subSolver := self class new.
    subSolver equations: (self buildSubProblemBy: eliminator).
    ^ 1
]

{ #category : 'executing' }
ILPSolver >> solveOneVariableEquation [

    | coeff value |
    coeff := (equations first atGrid: #coeffs) first.
    value := equations first atGrid: #value.
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
            (equation atGrid: #coeffs) first ~= 0 ifTrue: [ found add: equation ]
                ifFalse: [ notFound add: equation ] ].
    found addAllLast: notFound.
    equations := found asArray.

]
