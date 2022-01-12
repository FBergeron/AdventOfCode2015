"
A grid of Christmas lights.

In this version, each light has an brightness level.
"
Class {
	#name : #LightGrid2,
	#superclass : #Object,
	#instVars : [
		'lights'
	],
	#category : #'AOC-2015'
}

{ #category : #'instance creation' }
LightGrid2 class >> new: anInteger [

	^self new dimension: anInteger 
]

{ #category : #accessing }
LightGrid2 >> contents [ 

	^lights contents
]

{ #category : #initialization }
LightGrid2 >> dimension [

	^ lights size sqrt
]

{ #category : #initialization }
LightGrid2 >> dimension: anInteger [

	lights := Array2D new: anInteger element: 0
]

{ #category : #initialization }
LightGrid2 >> initialize [

	lights := Array2D new: 10 element: 0
]

{ #category : #accessing }
LightGrid2 >> lightOffCount [

	^ (self contents asArray select: [ :each | each = 0 ]) size
]

{ #category : #accessing }
LightGrid2 >> lightOnCount [

	^ (self contents asArray select: [ :each | each > 0 ]) size
]

{ #category : #initialization }
LightGrid2 >> size [

	^ lights size
]

{ #category : #accessing }
LightGrid2 >> toggleFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			lights at: x at: y put: (lights at: x at: y) + 2.
			x := x + 1 ].
		y := y + 1 ]
]

{ #category : #accessing }
LightGrid2 >> totalBrightness [	

	^ (self contents asArray select: [ :each | each > 0 ]) sum
]

{ #category : #accessing }
LightGrid2 >> turnOffFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			| brightness |
			brightness := lights at: x at: y.
			brightness > 0 ifTrue: [ 
				lights at: x at: y put: brightness - 1
			].
			x := x + 1 ].
		y := y + 1 ]
]

{ #category : #accessing }
LightGrid2 >> turnOnFrom: startPoint to: endPoint [

	| x y |
	y := startPoint y.
	[ y <= endPoint y ] whileTrue: [ 
		x := startPoint x.
		[ x <= endPoint x ] whileTrue: [ 
			lights at: x at: y put: (lights at: x at: y) + 1.
			x := x + 1 ].
		y := y + 1 ]
]
