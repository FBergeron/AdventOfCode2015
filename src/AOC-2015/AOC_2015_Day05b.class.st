"
Statement of the problem can be found here:

https://adventofcode.com/2015/day/5

"
Class {
	#name : #'AOC_2015_Day05b',
	#superclass : #Object,
	#category : #'AOC-2015'
}

{ #category : #'private - running' }
AOC_2015_Day05b >> containsNonOverlappingPairs: aString [

	| pairs |
	pairs := Dictionary new.

	1 to: aString size do: [ :i | 
		i >= 2 ifTrue: [ 
			| pair |
			pair := aString copyFrom: i - 1 to: i.
			(pairs includesKey: pair)
				ifTrue: [ i - (pairs at: pair) >= 2 ifTrue: [ ^ true ] ]
				ifFalse: [ pairs at: pair put: i ] ] ].

	^ false
]

{ #category : #'private - running' }
AOC_2015_Day05b >> containsRepeatedCharsWithInterval: aString [

	1 to: aString size do: [ :i | 
		i > 2 ifTrue: [ 
			(aString at: i) = (aString at: i - 2) ifTrue: [ ^ true ] ] ].

	^ false
]

{ #category : #running }
AOC_2015_Day05b >> isNice: aString [

	^ (self containsNonOverlappingPairs: aString)
	  & (self containsRepeatedCharsWithInterval: aString)
]

{ #category : #running }
AOC_2015_Day05b >> run [

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
			niceStringCount := niceStringCount + 1.] ].
	^ niceStringCount
]
