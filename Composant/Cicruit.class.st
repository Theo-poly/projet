Class {
	#name : 'Cicruit',
	#superclass : 'Object',
	#instVars : [
		'nom',
		'composants',
		'interrupteurs',
		'sorties'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Cicruit >> composants [

	^ composants
]

{ #category : 'accessing' }
Cicruit >> composants: anObject [

	composants := anObject
]

{ #category : 'initialization' }
Cicruit >> initialize [
    super initialize.
    composants := OrderedCollection new.
    interrupteurs := OrderedCollection new.
    sorties := OrderedCollection new
]

{ #category : 'accessing' }
Cicruit >> interrupteurs [

	^ interrupteurs
]

{ #category : 'accessing' }
Cicruit >> interrupteurs: anObject [

	interrupteurs := anObject
]

{ #category : 'accessing' }
Cicruit >> nom [

	^ nom
]

{ #category : 'accessing' }
Cicruit >> nom: anObject [

	nom := anObject
]

{ #category : 'accessing' }
Cicruit >> sorties [

	^ sorties
]

{ #category : 'accessing' }
Cicruit >> sorties: anObject [

	sorties := anObject
]
