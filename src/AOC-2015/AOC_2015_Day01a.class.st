"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/1

"
Class {
	#name : #'AOC_2015_Day01a',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day01a >> run [

	"Find on which floor Santa is"

	| repo dir floor input inputStream |
	"dir := FileSystem disk workingDirectoryPath. "
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	floor := 0.
	input := (File named: (dir / 'src/input/Day01/input1.txt') pathString) readStream contents asString.
	inputStream  := ReadStream on: input.
	[ inputStream atEnd ] whileFalse: [ 
		(inputStream peek = $() ifTrue: [ floor := floor + 1 ].
		(inputStream peek = $)) ifTrue: [ floor := floor - 1 ].
		inputStream next ].
	^ floor
]
