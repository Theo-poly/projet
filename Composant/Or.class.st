Class {
	#name : 'Or',
	#superclass : 'Porte2Entrees',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Or >> etat [
    | etat1 etat2 |
    etat1 := in1 ifNil: [false] ifNotNil: [in1 etat].
    etat2 := in2 ifNil: [false] ifNotNil: [in2 etat].
    ^ etat1 or: etat2
]
