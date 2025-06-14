Class {
	#name : 'Vanne',
	#superclass : 'Composant',
	#instVars : [
		'in'
	],
	#category : 'Composant',
	#package : 'Composant'
}

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

{ #category : 'accessing' }
Vanne >> in [

	^ in
]

{ #category : 'accessing' }
Vanne >> in: anObject [

	in := anObject
]

{ #category : 'tests' }
Vanne >> testNotNonConnecte [
    | notGate resultat attendu |
    notGate := Not new.
    resultat := notGate description.
    attendu := 'Not ({1}) in: non connecté' format: {notGate id}.
    self assert: resultat equals: attendu
]
