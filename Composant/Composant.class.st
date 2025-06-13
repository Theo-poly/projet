Class {
	#name : 'Composant',
	#superclass : 'Object',
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
