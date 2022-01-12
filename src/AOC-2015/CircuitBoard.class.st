"
A board that implements a circuit of gates and wires.
"
Class {
	#name : #CircuitBoard,
	#superclass : #Object,
	#instVars : [
		'gates'
	],
	#category : #'AOC-2015'
}

{ #category : #initialization }
CircuitBoard >> add: gate [
	gate board: self.
	gates at: gate output put: gate
]

{ #category : #initialization }
CircuitBoard >> initialize [

	gates := Dictionary new.
]
