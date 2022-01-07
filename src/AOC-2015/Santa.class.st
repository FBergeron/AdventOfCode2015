"
Represent a present distributor.
"
Class {
	#name : #Santa,
	#superclass : #Object,
	#instVars : [
		'location'
	],
	#category : #'AOC-2015'
}

{ #category : #accessing }
Santa >> deliverPresentAt: houses [
	"Deliver a present at the house of the present location."	
			
	houses at: location 
		ifPresent: [ houses at: location put: (houses at: location) + 1] 
		ifAbsentPut: [ 1 ].
	^ houses.
]

{ #category : #accessing }
Santa >> goEast [
				
	location := Point x: location x + 1 y: location y.
	^ location.

]

{ #category : #accessing }
Santa >> goNorth [
				
	location := Point x: location x y: location y - 1.
	^ location.

]

{ #category : #accessing }
Santa >> goSouth [
				
	location := Point x: location x y: location y + 1.
	^ location.

]

{ #category : #accessing }
Santa >> goWest [
				
	location := Point x: location x - 1 y: location y.
	^ location.

]

{ #category : #initialization }
Santa >> initialize [
	location := Point x: 0 y: 0.
]

{ #category : #accessing }
Santa >> location [
	^ location
]
