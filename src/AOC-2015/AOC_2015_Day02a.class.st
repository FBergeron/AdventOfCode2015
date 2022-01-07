"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/2
"
Class {
	#name : #'AOC_2015_Day02a',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day02a >> run [

	"Find quantity of wrapping"

	| repo dir total input inputStream line |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	total := 0.
	input := (File named: (dir / 'src/input/Day02/input1.txt') pathString) readStream contents asString.
	inputStream := ReadStream on: input.
	[ (line := inputStream nextLine) isNil ] whileFalse: [ 
		| measures length width height present |
		measures := ('x' split: line) collect: [ :each | each asInteger ] .
		length := measures at: 1.
		width := measures at: 2.
		height := measures at: 3.
		present := Present width: width height: height length: length.
		total := total + present wrapping.
	].
	^ total
]
