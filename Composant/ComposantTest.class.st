Class {
	#name : 'ComposantTest',
	#superclass : 'TestCase',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'part2' }
ComposantTest >> testDuEtLogique [
    | i1 i2 et |
    i1 := Interrupteur new.
    i2 := Interrupteur new.
    et := And new.
    et in1: i1; in2: i2.
    
    i1 off. i2 off.
    self assert: et etat equals: false.
    
	 i1 on. i2 off.
    self assert: et etat equals: false.
    
    i1 on. i2 on.
    self assert: et etat equals: true
]

{ #category : 'part1' }
ComposantTest >> testEtPartiellementConnecte [
    | porteet interrupteur resultat |
    interrupteur := Interrupteur new.
    porteet := And new.
    porteet in1: interrupteur.
    resultat := porteet description.
    self assert: (resultat includesSubstring: 'in1: Interrupteur').
    self assert: (resultat includesSubstring: 'in2: non connecté')
]

{ #category : 'part1' }
ComposantTest >> testInterrupteurDescription [
    | interrupteur resultat |
    interrupteur := Interrupteur new.
    resultat := interrupteur description.
    self assert: (resultat beginsWith: 'Interrupteur')
]

{ #category : 'part2' }
ComposantTest >> testInterrupteurOnOff [
    | interrupteur |
    interrupteur := Interrupteur new.
    self assert: interrupteur etat equals: false.

    interrupteur on.
    self assert: interrupteur etat equals: true.

    interrupteur off.
    self assert: interrupteur etat equals: false
]

{ #category : 'part1' }
ComposantTest >> testNoNConnecteDesc [
    | porteNO interrupteur resultat attendu |
    interrupteur := Interrupteur new.
    porteNO := Not new.
    porteNO in: interrupteur.
    resultat := porteNO description.
    attendu := 'Not ({1}) in: Interrupteur ({2})' format: {porteNO id. interrupteur id}.
    self assert: resultat equals: attendu
]

{ #category : 'part2' }
ComposantTest >> testNoNLogique [
    | interrupteur porteNON |
    interrupteur := Interrupteur new.
    porteNON := Not new.
    porteNON in: interrupteur.
    
    interrupteur off.
    self assert: porteNON etat equals: true.
    
    interrupteur on.
    self assert: porteNON etat equals: false
]

{ #category : 'tests' }
ComposantTest >> testNotNonConnecte [
    | porteNO resultat attendu |
    porteNO := Not new.
    resultat := porteNO description.
    attendu := 'Not ({1}) in: non connecté' format: {porteNO id}.
    self assert: resultat equals: attendu
]
