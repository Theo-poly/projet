Class {
	#name : 'SignalHaut',
	#superclass : 'SignalLogique',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'controlling' }
SignalHaut >> and: x [
    ^ x
]

{ #category : 'logical operations' }
SignalHaut >> not [
    ^ SignalBas new
]

{ #category : 'as yet unclassified' }
SignalHaut >> or: x [ 
	^ self
]

{ #category : 'evaluating' }
SignalHaut >> value [ 
	^true
]
