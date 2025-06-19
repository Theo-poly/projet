Class {
	#name : 'And',
	#superclass : 'Porte2Entrees',
	#instVars : [
		'blElement'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
And >> blElement [

	^ blElement
]

{ #category : 'accessing' }
And >> blElement: anObject [

	blElement := anObject
]

{ #category : 'accessing' }
And >> etat [
    | etat1 etat2 |
    etat1 := in1 ifNil: [false] ifNotNil: [in1 etat].
    etat2 := in2 ifNil: [false] ifNotNil: [in2 etat].
    ^ etat1 and: etat2
]

{ #category : 'public access' }
And >> evaluate [
    | s1 s2 |
    s1 := [in1 evaluate] on: Error do: [:e | SignalBas new].
    s2 := [in2 evaluate] on: Error do: [:e | SignalBas new].
    ^ s1 and: s2
]

{ #category : 'interface' }
And >> image [
    | element |
    element := BlElement new.
    element size: 80@60.
    element background: self imageAnd.
    
    element addChild: (BlTextElement new
        text: ('AND' asRopedText fontSize: 12);
   		  position: 20@20).
    
    self blElement: element.
    ^ element
]

{ #category : 'interface' }
And >> imageAnd [
    ^ [self evaluate value 
        ifTrue: [Color green]
        ifFalse: [Color red]]
    on: Error 
    do: [:error | Color lightGray]
]
