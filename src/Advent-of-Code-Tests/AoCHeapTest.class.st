Class {
	#name : 'AoCHeapTest',
	#superclass : 'TestCase',
	#instVars : [
		'heap'
	],
	#category : 'Advent-of-Code-Tests-Tool',
	#package : 'Advent-of-Code-Tests',
	#tag : 'Tool'
}

{ #category : 'running' }
AoCHeapTest >> setUp [

  super setUp. "Put here a common initialization logic for tests"

  heap := Heap new.
  heap
]

{ #category : 'tests' }
AoCHeapTest >> testCase1 [

  heap add: 4; add: 7; add: 2.
  self assert: heap removeFirst equals: 2.
  self assert: heap removeFirst equals: 4.
  self assert: heap removeFirst equals: 7.
  self assert: heap isEmpty
]
