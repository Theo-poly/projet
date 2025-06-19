Class {
	#name : 'Composant',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Composant >> description [
    ^ '{1} ({2})' format: {self class name. self id}
]

{ #category : 'accessing' }
Composant >> id [
    ^ self hash
]

{ #category : 'accessing' }
Composant >> position [

	^ position
]

{ #category : 'accessing' }
Composant >> position: anObject [

	position := anObject
]

{ #category : 'as yet unclassified' }
Composant >> positionEntree [
    ^ position x@(position y + 30)
]

{ #category : 'as yet unclassified' }
Composant >> positionEntree: numeroEntree [
    ^ numeroEntree = 1 
        ifTrue: [self positionEntreeHaute]
        ifFalse: [self positionEntreeBasse]
]

{ #category : 'as yet unclassified' }
Composant >> positionEntreeBasse [
    ^ position x@(position y + 40)
]

{ #category : 'as yet unclassified' }
Composant >> positionEntreeHaute [
    ^ position x@(position y + 20)

]

{ #category : 'as yet unclassified' }
Composant >> positionSortie [
    ^ (position x + 80)@(position y + 30)
]
