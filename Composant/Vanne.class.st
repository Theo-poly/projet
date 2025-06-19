Class {
	#name : 'Vanne',
	#superclass : 'Composant',
	#instVars : [
		'in',
		'blElement'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Vanne >> blElement [

	^ blElement
]

{ #category : 'accessing' }
Vanne >> blElement: anObject [

	blElement := anObject
]

{ #category : 'accessing' }
Vanne >> description [
    | inDescription |
    inDescription := in 
        ifNil: ['non connecté'] 
        ifNotNil: ['{1} ({2})' format: {in class name. in id}].
    ^ '{1} ({2}) in: {3}' format: {self class name. self id. inDescription}
]

{ #category : 'accessing' }
Vanne >> etat [
    ^ 
		in ifNil: [false] 
		ifNotNil: [in etat]
]

{ #category : 'public access' }
Vanne >> evaluate [
    ^ [in evaluate] on: Error do: [:error | SignalBas new]
]

{ #category : 'interface' }
Vanne >> image [
    | element |
    element := BlElement new.
    element size: 70@50.
    element background: self imageVanne.
    self blElement: element.
    ^ element

]

{ #category : 'interface' }
Vanne >> imageOff [ 
    ^ Color red 
]

{ #category : 'interface' }
Vanne >> imageOn [ 
    ^ Color green
]

{ #category : 'interface' }
Vanne >> imageVanne [
    ^ self evaluate value 
        ifTrue: [self imageOn ]
        ifFalse: [self imageOff]
]

{ #category : 'accessing' }
Vanne >> in [

	^ in
]

{ #category : 'accessing' }
Vanne >> in: anObject [

	in := anObject
]
