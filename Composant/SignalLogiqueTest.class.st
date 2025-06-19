Class {
	#name : 'SignalLogiqueTest',
	#superclass : 'TestCase',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'tests' }
SignalLogiqueTest >> testSignalBaValue [
    | s |
    s := SignalBas new.
    self assert: s value equals: false
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalBasAnd [
    | s1 s2 resultat1 resultat2 |
    s1 := SignalHaut new.
    s2 := SignalBas new.
    
    resultat1 := s2 and: s2.
    self assert: resultat1 value equals: false.
    self assert: (resultat1 isKindOf: SignalBas).
    
	resultat2 := s1 and: s2 .
	
    self assert: (resultat1 isKindOf: SignalBas).
    self assert: resultat2 value equals: false
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalBasNot [
    | s resultat |
    s := SignalBas new.
    resultat := s not.
    self assert: (resultat isKindOf: SignalHaut ).
    self assert: resultat value equals: true 
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalBasOr [
    | s1 s2 resultat1 resultat2 |
    s1 := SignalHaut new.
    s2 := SignalBas new.
    
    resultat1 := s2 or: s2.
    self assert: resultat1 value equals: false.
    self assert: (resultat1 isKindOf: SignalBas).    

    resultat2 := s1 or: s2.
    self assert: resultat2 value equals: true.
    self assert: (resultat2 isKindOf: SignalHaut).
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalHautAnd [
    | s1 s2 resultat1 resultat2 |
    s1 := SignalHaut new.
    s2 := SignalBas new.
    
    resultat1 := s1 and: s1.
    self assert: resultat1 value equals: true.
    self assert: (resultat1 isKindOf: SignalHaut).
    
	resultat2 := s1 and: s2 .
    self assert: resultat2 value equals: false.
    self assert: (resultat2 isKindOf: SignalBas)
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalHautNot [
    | s resultat |
    s := SignalHaut new.
    resultat := s not.
    self assert: (resultat isKindOf: SignalBas).
    self assert: resultat value equals: false
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalHautOr [
    | s1 s2 resultat1 resultat2 |
    s1 := SignalHaut new.
    s2 := SignalBas new.
    
    resultat1 := s1 or: s1.
    self assert: resultat1 value equals: true.
    self assert: (resultat1 isKindOf: SignalHaut).
    
    resultat2 := s1 or: s2.

    self assert: (resultat2 isKindOf: SignalHaut).
    self assert: resultat2 value equals: true
]

{ #category : 'tests' }
SignalLogiqueTest >> testSignalHautValue [
    | s |
    s := SignalHaut new.
    self assert: s value equals: true
]
