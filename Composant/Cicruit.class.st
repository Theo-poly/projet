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

{ #category : 'as yet unclassified' }
Cicruit class >> nom: unNom composants: uneCollectionDeComposants [
    | nouveauCircuit |
    nouveauCircuit := self new.
    nouveauCircuit nom: unNom.
    nouveauCircuit ajouterComposants: uneCollectionDeComposants.
    ^ nouveauCircuit
]

{ #category : 'as yet unclassified' }
Cicruit >> ajouterComposants: uneCollectionDeComposants [
    composants addAll: uneCollectionDeComposants.
    composants := composants sorted: [:a :b | a id < b id].

    interrupteurs := (composants select: [:comp | comp description beginsWith: 'Interrupteur']) 
        sorted: [:a :b | a id < b id].

    sorties := (composants select: [:comp | comp description beginsWith: 'Vanne']) 
        sorted: [:a :b | a id < b id]
]

{ #category : 'accessing' }
Cicruit >> composants [

	^ composants
]

{ #category : 'accessing' }
Cicruit >> composants: anObject [

	composants := anObject
]

{ #category : 'accessing' }
Cicruit >> description [
    ^ 'Circuit {1}: {2} composants ({3} interrupteurs, {4} sorties)' format: {
        nom.
        self nombreComposants.
        self nombreInterrupteurs.
        self nombreSorties}
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

{ #category : 'as yet unclassified' }
Cicruit >> nombreComposants [
    ^ composants size

]

{ #category : 'as yet unclassified' }
Cicruit >> nombreInterrupteurs [
    ^ interrupteurs size
]

{ #category : 'as yet unclassified' }
Cicruit >> nombreSorties [
    ^ sorties size

]

{ #category : 'accessing' }
Cicruit >> sorties [

	^ sorties
]

{ #category : 'accessing' }
Cicruit >> sorties: anObject [

	sorties := anObject
]
