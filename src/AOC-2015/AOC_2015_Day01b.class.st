"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/1
"
Class {
	#name : #'AOC_2015_Day01b',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day01b >> run [

	"Find on which position Santa enters the basement"

	| repo dir floor input inputStream pos |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	floor := 0.
	pos := nil.
	input := (File named: (dir / 'src/input/Day01/input1.txt') pathString) readStream contents asString.
	inputStream  := ReadStream on: input.
	[ inputStream atEnd] whileFalse: [ 
		(inputStream peek = $() ifTrue: [ floor := floor + 1 ].
		(inputStream peek = $)) ifTrue: [ floor := floor - 1 ].
		floor = -1 ifTrue: [ pos := inputStream position + 1. ^pos ].
		inputStream next ].
]
