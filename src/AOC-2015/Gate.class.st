"
A bitwise logic gate that generates a signal when all its inputs are resolved.
"
Class {
	#name : #Gate,
	#superclass : #Object,
	#instVars : [
		'inputs',
		'output',
		'board'
	],
	#category : #'AOC-2015'
}

{ #category : #accessing }
Gate >> board [

	^ board
]

{ #category : #accessing }
Gate >> board: aBoard [

	board := aBoard
]

{ #category : #accessing }
Gate >> inputs [

	^inputs
]

{ #category : #accessing }
Gate >> inputs: aCollection [

	inputs := Dictionary new.
	aCollection do: [ :input | inputs at: input put: nil ]
]

{ #category : #accessing }
Gate >> output [
	^output
]

{ #category : #accessing }
Gate >> output: aWire [

	output := aWire -> nil
]
