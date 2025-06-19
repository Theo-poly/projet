Class {
	#name : 'Not',
	#superclass : 'Porte',
	#instVars : [
		'in',
		'blElement'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Not >> blElement [

	^ blElement
]

{ #category : 'accessing' }
Not >> blElement: anObject [

	blElement := anObject
]

{ #category : 'accessing' }
Not >> description [
    | inDescription |
    inDescription := in 
        ifNil: ['non connecté'] 
        ifNotNil: ['{1} ({2})' format: {in class name. in id}].
    ^ '{1} ({2}) in: {3}' format: {self class name. self id. inDescription}
]

{ #category : 'accessing' }
Not >> etat [
    ^ [in etat not] on:Error do:[:e | in:=false]
]

{ #category : 'public access' }
Not >> evaluate [
	|s1 |
	s1 := [in evaluate ] on: Error do: [:e | SignalBas new].
   ^s1 not
]

{ #category : 'accessing' }
Not >> image [
    | element |
    element := BlElement new.
    element size: 80@60.
    element background: Color gray.
    
    element addChild: (BlTextElement new
        text: ('NOT' asRopedText fontSize: 12);
   		  position: 20@20).
    
    self blElement: element.
    ^ element
]

{ #category : 'accessing' }
Not >> in [

	^ in
]

{ #category : 'accessing' }
Not >> in: anObject [

	in := anObject
]
