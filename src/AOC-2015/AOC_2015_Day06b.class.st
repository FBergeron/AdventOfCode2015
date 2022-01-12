"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/6
"
Class {
	#name : #'AOC_2015_Day06b',
	#superclass : #Object,
	#instVars : [
		'blacklist'
	],
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day06b >> run [

	"Play with lights."

	| repo dir input inputStream line lightGrid |
	repo := IceRepository registeredRepositoryIncludingPackage:
		        self class package.
	dir := repo location.
	lightGrid := LightGrid2 new: 1000.
	input := (File named: (dir / 'src/input/Day06/input1.txt') pathString)
		         readStream contents asString.
	inputStream := ReadStream on: input.
	[ (line := inputStream nextLine) isNil ] whileFalse: [ 
		| tokens |
		tokens := ' ' split: line.
		(tokens at: 1) = 'toggle' ifTrue: [ 
			| startPointValues endPointValues |
			startPointValues := ',' split: (tokens at: 2).
			endPointValues := ',' split: (tokens at: 4).
			lightGrid
				toggleFrom: (startPointValues at: 1) asInteger - 1
					@ ((startPointValues at: 2) asInteger - 1)
				to: (endPointValues at: 1) asInteger - 1
					@ ((endPointValues at: 2) asInteger - 1) ].
		(tokens at: 1) = 'turn' & (tokens at: 2) = 'off' ifTrue: [ 
			| startPointValues endPointValues |
			startPointValues := ',' split: (tokens at: 3).
			endPointValues := ',' split: (tokens at: 5).
			lightGrid
				turnOffFrom: (startPointValues at: 1) asInteger - 1
					@ ((startPointValues at: 2) asInteger - 1)
				to: (endPointValues at: 1) asInteger - 1
					@ ((endPointValues at: 2) asInteger - 1) ].
		(tokens at: 1) = 'turn' & (tokens at: 2) = 'on' ifTrue: [ 
			| startPointValues endPointValues |
			startPointValues := ',' split: (tokens at: 3).
			endPointValues := ',' split: (tokens at: 5).
			lightGrid
				turnOnFrom: (startPointValues at: 1) asInteger - 1
					@ ((startPointValues at: 2) asInteger - 1)
				to: (endPointValues at: 1) asInteger - 1
					@ ((endPointValues at: 2) asInteger - 1) ] ].
	^ lightGrid totalBrightness 
]
