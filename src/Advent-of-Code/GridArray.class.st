Class {
	#name : 'GridArray',
	#superclass : 'Array',
	#type : 'variable',
	#instVars : [
		'width',
		'height',
		'initValue'
	],
	#category : 'Advent-of-Code-Tool',
	#package : 'Advent-of-Code',
	#tag : 'Tool'
}

{ #category : 'instance creation' }
GridArray class >> new: aPoint with: aValue [

    | instance |
    instance := self new: aPoint x * aPoint y.
    instance initValue: aValue; height: aPoint y; width: aPoint x.
    instance atAllPut: aValue.

    ^ instance
]

{ #category : 'accessing' }
GridArray >> geometory [

    ^ width @ height
]

{ #category : 'accessing' }
GridArray >> height: aNumber [

    height := aNumber
]

{ #category : 'accessing' }
GridArray >> initValue: anObject [

	initValue := anObject
]

{ #category : 'accessing' }
GridArray >> size [

    ^ width * height
]

{ #category : 'accessing' }
GridArray >> width: aNumber [

    width := aNumber
]

{ #category : 'accessing' }
GridArray >> x: xIndex y: yIndex [

    ^ self at: yIndex - 1 * width + xIndex
]

{ #category : 'accessing' }
GridArray >> x: xIndex y: yIndex put: aValue [

    ^ self at: yIndex - 1 * width + xIndex put: aValue
]
