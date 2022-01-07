"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/3
"
Class {
	#name : #'AOC_2015_Day03b',
	#superclass : #Object,
	#instVars : [
		'santa',
		'robot',
		'houses'
	],
	#category : #'AOC-2015'
}

{ #category : #initialization }
AOC_2015_Day03b >> initialize [
			
	santa := Santa new.
	robot := Santa new.
	houses := Dictionary new.
]

{ #category : #running }
AOC_2015_Day03b >> run [

	"Find the count of houses with at least one present."

	| repo dir input inputStream workers workerIndex |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	workers := { santa . robot }.
	workerIndex := 1.
	input := (File named: (dir / 'src/input/Day03/input1.txt') pathString) readStream contents asString.
	inputStream  := ReadStream on: input.
	[ inputStream atEnd ] whileFalse: [
		| worker |
		worker := workers at: workerIndex.
		workerIndex := workerIndex = 1 ifTrue: 2 ifFalse: 1.
		worker deliverPresentAt: houses. 
		(inputStream peek = $<) ifTrue: [ worker goWest ].
		(inputStream peek = $>) ifTrue: [ worker goEast ].
		(inputStream peek = $^) ifTrue: [ worker goNorth ].
		(inputStream peek = $v) ifTrue: [ worker goSouth ].
		inputStream next ].
	^houses size.

]
