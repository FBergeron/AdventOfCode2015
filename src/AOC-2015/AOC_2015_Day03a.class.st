"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/3

"
Class {
	#name : #'AOC_2015_Day03a',
	#superclass : #Object,
	#instVars : [
		'santa',
		'houses'
	],
	#category : #'AOC-2015'
}

{ #category : #initialization }
AOC_2015_Day03a >> initialize [
			
	santa := Santa new.
	houses := Dictionary new.
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
		santa deliverPresentAt: houses. 
		(inputStream peek = $<) ifTrue: [ santa goWest ].
		(inputStream peek = $>) ifTrue: [ santa goEast ].
		(inputStream peek = $^) ifTrue: [ santa goNorth ].
		(inputStream peek = $v) ifTrue: [ santa goSouth ].
		inputStream next ].
	^houses size.

]
