"
An ILPSolverTest is a test class for testing the behavior of ILPSolver
"
Class {
	#name : 'ILPSolverTest',
	#superclass : 'TestCase',
	#instVars : [
		'solver'
	],
	#category : 'Advent-of-Code-Tests-Tool',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Tool'
}

{ #category : 'running' }
ILPSolverTest >> setUp [

    super setUp. "Put here a common initialization logic for tests"

    solver := ILPSolver new
]

{ #category : 'tests' }
ILPSolverTest >> testBuildSubProblem [
    "1x + 0y + 2z = 1
    1x + 1y + 2z = 3
    0x + 0y + 0z = 0
    2x + 2y + 3z = 5
    
    1y + 0z = 2
    0y + 0z = 0
    2y - 1z = 3"

    | eliminator equation1 equation2 equation3 subproblem |
    solver numberOfVariables: 3.
    eliminator := { #coeffs -> { 1. 0. 2 } asArray. #value -> 1 } asDictionary.
    equation1 := { #coeffs -> { 1. 1. 2 } asArray. #value -> 3 } asDictionary.
    equation2 := solver emptyEquation.
    equation3 := { #coeffs -> { 2. 2. 3 } asArray. #value -> 5 } asDictionary.
    subproblem := solver equations: { equation1. equation2. equation3 } asArray; buildSubProblem: eliminator.
    self assert: subproblem first equals: { #coeffs -> { 1. 0 } asArray. #value -> 2 } asDictionary.
    self assert: (subproblem at: 2) equals: { #coeffs -> { 0. 0 } asArray. #value -> 0 } asDictionary.
    self assert: (subproblem at: 3) equals: { #coeffs -> { 2. -1 } asArray. #value -> 3 } asDictionary
]

{ #category : 'tests' }
ILPSolverTest >> testSolveOneVariableEquation [

    self testSolveOneVariableEquation1.
    self testSolveOneVariableEquation2
]

{ #category : 'tests' }
ILPSolverTest >> testSolveOneVariableEquation1 [
    "1 * x = 3"

    | equation |
    equation := { #coeffs -> { 1 }. #value -> 3 } asDictionary.
    solver equations: { equation } asOrderedCollection.
    self assert: solver equations size equals: 1.
    self assert: solver equations first equals: equation.
    self assert: solver solveOneVariableEquation equals: 3 "4 * x = 28"
]

{ #category : 'tests' }
ILPSolverTest >> testSolveOneVariableEquation2 [
    "4 * x = 28"

    | equation |
    equation := { #coeffs -> { 4 }. #value -> 28 } asDictionary.
    solver equations: { equation } asOrderedCollection.
    self assert: solver solveOneVariableEquation equals: 7
]

{ #category : 'tests' }
ILPSolverTest >> testSortEquations [

    | equation1 equation2 equation3 equation4 |
    solver numberOfVariables: 3.
    equation1 := solver emptyEquation.
    equation2 := { #coeffs -> { 1. 1. 2 } asArray. #value -> 1 } asDictionary.
    equation3 := solver emptyEquation.
    equation4 := { #coeffs -> { 2. 1. 2 } asArray. #value -> 1 } asDictionary.
    solver equations: { equation1. equation2. equation3. equation4 } asArray.
    solver sortEquations.
    self assert: solver equations first identicalTo: equation2.
    self assert: (solver equations at: 2) identicalTo: equation4
]
