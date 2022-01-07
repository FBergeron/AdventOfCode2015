"
A Christmas present
"
Class {
	#name : #Present,
	#superclass : #Object,
	#instVars : [
		'height',
		'length',
		'width'
	],
	#category : #'AOC-2015'
}

{ #category : #accessing }
Present class >> width: w height: h length: l [ 
	"Create a present with no the specified physical properties."
			
	| present |
	present := self new.
	present width: w.
	present height: h.
	present length: l.
	^ present.

]

{ #category : #accessing }
Present >> height [
	^ height.
]

{ #category : #accessing }
Present >> height: anInteger [
	"Set the height of the present."
			
	height := anInteger.
]

{ #category : #accessing }
Present >> length [
	^ length.
]

{ #category : #accessing }
Present >> length: anInteger [
	"Set the length of the present."
			
	length := anInteger.
]

{ #category : #accessing }
Present >> ribbon [
	"Get the quantity of ribbon required to wrap the present."
			
	| measures |
	measures := { height . length . width } sorted.
	^ (2 * ((measures sorted) at: 1)) + (2 * ((measures sorted) at: 2)) + self volume.
]

{ #category : #accessing }
Present >> volume [
	"Get the volume of the present."
			
	^ width * height * length.

]

{ #category : #accessing }
Present >> width [
	^ width.
]

{ #category : #accessing }
Present >> width: anInteger [
	"Set the width of the present."
			
	width := anInteger.
]

{ #category : #accessing }
Present >> wrapping [
	"Get the requirement quantity of material to wrap the present."
			
	| measures |
	measures := {height . length . width} sorted.
	^(2 * length * width) + (2 * width * height) + (2 * height * length) + 
			((measures at: 1) * (measures at: 2)).
]
