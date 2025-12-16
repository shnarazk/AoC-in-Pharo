Class {
	#name : 'BaselineOfAoCByPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAoCByPharo',
	#package : 'BaselineOfAoCByPharo'
}

{ #category : 'baselines' }
BaselineOfAoCByPharo >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				package: 'AoC-by-Pharo' with: [ spec requires: #( 'PetitParser2' ) ];
				package: 'AoC-by-Pharo-Tests' with: [ spec requires: #( 'PetitParser2' ) ] ]
]
