"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/4

"
Class {
	#name : #'AOC_2015_Day04b',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #running }
AOC_2015_Day04b >> run [

	"Find the right number that produces the right md5 hash."

	| repo dir input inputStream prefix number md5 |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	dir := repo location.
	input := (File named: (dir / 'src/input/Day04/input1.txt') pathString) readStream contents asString.
	inputStream  := ReadStream on: input.
	md5 := MD5 new.
	prefix := inputStream contents withoutTrailingNewlines.
	number := 1.
	
	[ md5 hashStream: (prefix , number asString) readStream. 
	((md5 finalValue hex) beginsWith: '000000') ]
		whileFalse: [ 
			number := number + 1. 
		].
	^number. 
	
	
	
	
]
