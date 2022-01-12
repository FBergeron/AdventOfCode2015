"
A bitwise logic Signal gate.
"
Class {
	#name : #SignalGate,
	#superclass : #Gate,
	#category : #'AOC-2015'
}

{ #category : #accessing }
SignalGate >> resolveSignal [

	^ inputs at: output key
]
