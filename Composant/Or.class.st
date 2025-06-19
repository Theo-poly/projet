Class {
	#name : 'Or',
	#superclass : 'Porte2Entrees',
	#instVars : [
		'blElement'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Or >> blElement [

	^ blElement
]

{ #category : 'accessing' }
Or >> blElement: anObject [

	blElement := anObject
]

{ #category : 'accessing' }
Or >> etat [
    | etat1 etat2 |
    etat1 := in1 ifNil: [false] ifNotNil: [in1 etat].
    etat2 := in2 ifNil: [false] ifNotNil: [in2 etat].
    ^ etat1 or: etat2
]

{ #category : 'public access' }
Or >> evaluate [
    | s1 s2 |
    s1 := [in1 evaluate] on: Error do: [:e | SignalBas new].
    s2 := [in2 evaluate] on: Error do: [:e | SignalBas new].
    ^ s1 or: s2
]

{ #category : 'interface' }
Or >> image [
    | element |
    element := BlElement new.
    element size: 80@60.
    element background: self imageOr.
    
    element addChild: (BlTextElement new
        text: ('OR' asRopedText fontSize: 12);
   		  position: 20@20).
    
    self blElement: element.
    ^ element
]

{ #category : 'interface' }
Or >> imageOr [
    ^ [self evaluate value ifTrue: [Color green] ifFalse: [Color red]] on: Error do: [:error | Color lightGray]
]
