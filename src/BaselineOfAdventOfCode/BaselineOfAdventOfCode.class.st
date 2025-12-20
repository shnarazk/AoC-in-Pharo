Class {
	#name : 'BaselineOfAdventOfCode',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAdventOfCode',
	#package : 'BaselineOfAdventOfCode'
}

{ #category : 'baselines' }
BaselineOfAdventOfCode >> baseline: spec [

    <baseline>
    spec for: #common do: [
            spec baseline: 'PetitParser2' with: [ spec repository: 'github://kursjan/petitparser2:master' ].
            spec package: 'Advent-of-Code' with: [ spec requires: #( 'PetitParser2' ) ].
            spec package: 'Advent-of-Code-Tests' with: [ spec requires: #( 'PetitParser2' ) ] ]
]
