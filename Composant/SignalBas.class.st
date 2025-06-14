Class {
	#name : 'SignalBas',
	#superclass : 'SignalLogique',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'controlling' }
SignalBas >> and: x [
    ^ self
]

{ #category : 'logical operations' }
SignalBas >> not [ 
	^SignalHaut new 
]

{ #category : 'controlling' }
SignalBas >> or: x [
 	^x
]

{ #category : 'evaluating' }
SignalBas >> value [ 
	^false
]
