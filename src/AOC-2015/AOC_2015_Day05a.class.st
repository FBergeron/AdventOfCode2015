"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/5

"
Class {
	#name : #'AOC_2015_Day05a',
	#superclass : #Object,
	#instVars : [
		'blacklist'
	],
	#category : #'AOC-2015'
}

{ #category : #initialization }
AOC_2015_Day05a >> initialize [
	blacklist := { 'ab' . 'cd' . 'pq' . 'xy' }.
]

{ #category : #running }
AOC_2015_Day05a >> isNice: aString [

	| prevChar vowels |
	blacklist do: [ :each | 
		(aString findString: each) > 0 ifTrue: [ ^ false ] ].

	vowels := aString asArray select: [ :c | ('aeiou' indexOf: c) > 0 ].
	vowels size < 3 ifTrue: [ ^ false ].

	prevChar := nil.
	aString do: [ :c | 
		prevChar = c ifTrue: [ ^true ]. 
		prevChar := c
	].
	
	^ false
]

{ #category : #running }
AOC_2015_Day05a >> run [

	"Find the nice strings."

	| repo dir input inputStream line niceStringCount |
	repo := IceRepository registeredRepositoryIncludingPackage:
		        self class package.
	niceStringCount := 0.
	dir := repo location.
	input := (File named: (dir / 'src/input/Day05/input1.txt') pathString)
		         readStream contents asString.
	inputStream := ReadStream on: input.
	[ (line := inputStream nextLine) isNil ] whileFalse: [ 
		(self isNice: line) ifTrue: [ 
			niceStringCount := niceStringCount + 1 ] ].
	^ niceStringCount
]
