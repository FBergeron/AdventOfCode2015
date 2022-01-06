"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/1

"
Class {
	#name : #Day01,
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
Day01 >> run [

	"Find on which floor Santa is"

	| floor input inputStream |
	floor := 0.
	input := ')())())'.
	inputStream  := ReadStream on: input.
	[ inputStream atEnd ] whileFalse: [ 
		(inputStream peek = $() ifTrue: [ floor := floor + 1 ].
		(inputStream peek = $)) ifTrue: [ floor := floor - 1 ].
		inputStream next ].
	^ floor
]
