Class {
	#name : 'Interrupteur',
	#superclass : 'Composant',
	#instVars : [
		'etat'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Interrupteur >> etat [

	^ etat
]

{ #category : 'accessing' }
Interrupteur >> etat: anObject [

	etat := anObject
]

{ #category : 'public access' }
Interrupteur >> evaluate [
    ^ etat 
        ifTrue: [SignalHaut new] 
        ifFalse: [SignalBas new]

]

{ #category : 'initialization' }
Interrupteur >> initialize [
    super initialize.
    etat := false
]

{ #category : 'accessing enum' }
Interrupteur >> off [
    etat := false
]

{ #category : 'accessing enum' }
Interrupteur >> on [
    etat := true
]
