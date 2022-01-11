"
A grid of Christmas lights.
"
Class {
	#name : #LightGrid,
	#superclass : #Object,
	#instVars : [
		'lights'
	],
	#category : #'AOC-2015'
}

{ #category : #'instance creation' }
LightGrid class >> new: anInteger [

	^self new dimension: anInteger 
]

{ #category : #accessing }
LightGrid >> contents [ 

	^lights contents
]

{ #category : #initialization }
LightGrid >> dimension [

	^ lights size sqrt
]

{ #category : #initialization }
LightGrid >> dimension: anInteger [

	lights := Array2D new: anInteger element: false
]

{ #category : #initialization }
LightGrid >> initialize [

	lights := Array2D new: 10 element: false
]

{ #category : #accessing }
LightGrid >> lightOffCount [

	^ (self contents asArray select: [ :each | each not ]) size
]

{ #category : #accessing }
LightGrid >> lightOnCount [

	^ (self contents asArray select: [ :each | each ]) size
]

{ #category : #initialization }
LightGrid >> size [

	^ lights size
]

{ #category : #accessing }
LightGrid >> toggleFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			lights at: x at: y put: (lights at: x at: y) not.
			x := x + 1 ].
		y := y + 1 ]
]

{ #category : #accessing }
LightGrid >> turnOffFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			lights at: x at: y put: false.
			x := x + 1 ].
		y := y + 1 ]
]

{ #category : #accessing }
LightGrid >> turnOnFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			lights at: x at: y put: true.
			x := x + 1 ].
		y := y + 1 ]
]
