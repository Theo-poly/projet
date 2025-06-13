Class {
	#name : 'ComposantTest',
	#superclass : 'TestCase',
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'part3' }
ComposantTest >> testCircuitAvecComposants [
    | circuit composants i1 i2 vanne and |
    i1 := Interrupteur new.
    i2 := Interrupteur new.
    and := And new.
    vanne := Vanne new.
    
    and in1: i1; in2: i2.
    vanne in: and.
    
    composants := {i1. i2. and. vanne}.
    circuit := Cicruit nom: 'b' composants: composants.
    
    self assert: circuit nom equals: 'b'.
    self assert: circuit nombreComposants equals: 4.
    self assert: circuit nombreInterrupteurs equals: 2.
    self assert: circuit nombreSorties equals: 1

]

{ #category : 'part3' }
ComposantTest >> testCreationCircuitVide [
    | circuit |
    circuit := Cicruit new.
    circuit nom: 'a'.
    self assert: circuit nom equals: 'a'.
    self assert: circuit nombreComposants equals: 0.
    self assert: circuit nombreInterrupteurs equals: 0.
    self assert: circuit nombreSorties equals: 0
]

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

{ #category : 'part3' }
ComposantTest >> testEnnoncé [
    | circuit i1 i2 isecu or not and vanne composants |
    i1 := Interrupteur new.
    i2 := Interrupteur new.
    isecu := Interrupteur new.
    or := Or new.
    not := Not new.
    and := And new.
    vanne := Vanne new.
    
    or in1: i1; in2: i2.
    not in: isecu.
    and in1: or; in2: not.
    vanne in: and.
    
    composants := {i1. i2. isecu. or. not. and. vanne}.
    circuit := Cicruit nom: 'ennocné' composants: composants.
    
    self assert: circuit nombreComposants equals: 7.
    self assert: circuit nombreInterrupteurs equals: 3.
    self assert: circuit nombreSorties equals: 1.
    
    circuit interrupteurs do: [:inter | 
        self assert: (inter  description beginsWith: 'Interrupteur' )].
    
    circuit sorties do: [:sortie | 
        self assert: (sortie  description beginsWith: 'Vanne')]
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

{ #category : 'part3' }
ComposantTest >> testTriComposants [
    | circuit i1 i2 i3 composants |
    i1 := Interrupteur new.
    i2 := Interrupteur new.
    i3 := Interrupteur new.
    
    composants := {i3. i1. i2}.
    circuit := Cicruit nom: 'Test Tri' composants: composants.
    
    self assert: circuit composants first id <= circuit composants second id.
    self assert: circuit composants second id <= circuit composants third id

]
