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

{ #category : 'public access' }
Or >> evaluate [
    | s1 s2 |
    s1 := [in1 evaluate] on: Error do: [:e | SignalBas new].
    s2 := [in2 evaluate] on: Error do: [:e | SignalBas new].
    ^ s1 or: s2
]
