Class {
	#name : #'AOC_2015_Day02b',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day02b >> run [

	"Find quantity of ribbon"

	| repo dir total input inputStream line |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	total := 0.
	input := (File named: (dir / 'src/input/Day02/input1.txt') pathString) readStream contents asString.
	inputStream := ReadStream on: input.
	[ (line := inputStream nextLine) isNil ] whileFalse: [ 
		| measures length width height volume ribbon |
		measures := ('x' split: line) collect: [ :each | each asInteger ] .
		length := measures at: 1.
		width := measures at: 2.
		height := measures at: 3.
		volume := length * width * height.
		ribbon := (2 * ((measures sorted) at: 1)) + (2 * ((measures sorted) at: 2)) + volume.
		total := total + ribbon.
	].
	^ total
]
