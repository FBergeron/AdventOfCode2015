"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/3

"
Class {
	#name : #'AOC_2015_Day03a',
	#superclass : #Object,
	#instVars : [
		'location',
		'houses'
	],
	#category : #'AOC-2015'
}

{ #category : #accessing }
AOC_2015_Day03a >> deliverPresent [
	"Deliver a present at the house of the present location."	
			
	houses at: location 
		ifPresent: [ houses at: location put: (houses at: location) + 1] 
		ifAbsentPut: [ 1 ].
	^ houses at: location.
]

{ #category : #accessing }
AOC_2015_Day03a >> goEast [
				
	location := Point x: location x + 1 y: location y.
	^ location.

]

{ #category : #accessing }
AOC_2015_Day03a >> goNorth [
				
	location := Point x: location x y: location y - 1.
	^ location.

]

{ #category : #accessing }
AOC_2015_Day03a >> goSouth [
				
	location := Point x: location x y: location y + 1.
	^ location.

]

{ #category : #accessing }
AOC_2015_Day03a >> goWest [
				
	location := Point x: location x - 1 y: location y.
	^ location.

]

{ #category : #initialization }
AOC_2015_Day03a >> initialize [
			
	location := Point x: 0 y: 0.
	houses := Dictionary new.
]

{ #category : #accessing }
AOC_2015_Day03a >> location [
	^ location
]

{ #category : #running }
AOC_2015_Day03a >> run [

	"Find the count of houses with at least one present."

	| repo dir input inputStream |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	input := (File named: (dir / 'src/input/Day03/input1.txt') pathString) readStream contents asString.
	inputStream  := ReadStream on: input.
	[ inputStream atEnd ] whileFalse: [
		self deliverPresent. 
		(inputStream peek = $<) ifTrue: [ self goWest ].
		(inputStream peek = $>) ifTrue: [ self goEast ].
		(inputStream peek = $^) ifTrue: [ self goNorth ].
		(inputStream peek = $v) ifTrue: [ self goSouth ].
		inputStream next ].
	^houses size.

]
