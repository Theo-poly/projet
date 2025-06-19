Class {
	#name : 'Interrupteur',
	#superclass : 'Composant',
	#instVars : [
		'etat',
		'blElement'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Interrupteur >> blElement [

	^ blElement
]

{ #category : 'accessing' }
Interrupteur >> blElement: anObject [

	blElement := anObject
]

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

{ #category : 'interface' }
Interrupteur >> image [
    | element |
    element := BlElement new.
    element size: 80@60.
    
    element background: (self imageETat ).
    
    element addEventHandler: (BlEventHandler 
        on: BlClickEvent 
        do: [:event | 
            etat := etat not.
            element background: self imageETat ]).
    self blElement: element.
    ^ element

]

{ #category : 'interface' }
Interrupteur >> imageETat [
    ^ etat 
        ifTrue: [self imageOn] 
        ifFalse: [self imageOff]
]

{ #category : 'interface' }
Interrupteur >> imageOff [
    ^ [BlBackground image: (Form fromFileNamed: 'off.png')] on: Error do: [:e | Color red]

]

{ #category : 'interface' }
Interrupteur >> imageOn [
    ^ [BlBackground image: (Form fromFileNamed: 'on.png')] on: Error do: [:e | Color green]

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
