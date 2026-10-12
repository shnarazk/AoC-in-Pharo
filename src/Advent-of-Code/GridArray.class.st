"
I am a class of 2D Array supporting Point-based indexing.

1. create with `aGrid := GridArray new: 10@10 with: 0`.
2. set with `aGrid at: 2@4 :put 10`
3. get with `atgrid at: 1@1`


"
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
GridArray class >> from: aCollectionOfCollections [
    "return an instance initialized with aCollectionOfCollections (a 2D collection)"

    | height width instance |
    height := aCollectionOfCollections size.
    width := aCollectionOfCollections first size.
    instance := self new: width * height.
    instance height: height.
    instance width: width.
    aCollectionOfCollections withIndexDo: [ :aCollection :y |
        aCollection withIndexDo: [ :value :x | instance atGrid: x @ y put: value ] ].
    ^ instance
]

{ #category : 'instance creation' }
GridArray class >> new: aPoint with: aValue [

"return a new instance which geometory is aPoint and filled with aValue"

    | instance |
    instance := self new: aPoint x * aPoint y.
    instance initValue: aValue; height: aPoint y; width: aPoint x.
    instance atAllPut: aValue.

    ^ instance
]

{ #category : 'accessing' }
GridArray >> atGrid: aPoint [
    "get an element at aPoint"

    ^ self at: aPoint y - 1 * width + aPoint x
]

{ #category : 'accessing' }
GridArray >> atGrid: aPoint put: aValue [

    ^ self at: aPoint y - 1 * width + aPoint x put: aValue
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

{ #category : 'deprecated' }
GridArray >> x: xIndex y: yIndex [

    ^ self atGrid: (yIndex - 1) * width + xIndex
]

{ #category : 'deprecated' }
GridArray >> x: xIndex y: yIndex put: aValue [

    ^ self atGrid: (yIndex - 1) * width + xIndex put: aValue
]
