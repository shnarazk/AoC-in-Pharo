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
            spec baseline: 'PetitParser2' with: [ spec repository: 'github://kursjan/petitparser2:master' ].
            spec package: 'AoC-by-Pharo' with: [ spec requires: #( 'PetitParser2' ) ].
            spec package: 'AoC-by-Pharo-Tests' with: [ spec requires: #( 'PetitParser2' ) ] ]
]
