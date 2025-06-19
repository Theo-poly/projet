Class {
	#name : 'Cicruit',
	#superclass : 'Object',
	#instVars : [
		'nom',
		'composants',
		'interrupteurs',
		'sorties',
		'circuit'
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
Cicruit >> afficherResultats: resultats [
    Transcript show: nom ; cr.
    resultats do: [:resultat | 
        | comp signal valeur |
        comp := resultat at: 'composant'.
        signal := resultat at: 'signal'.
        valeur := resultat at: 'valeur']
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

{ #category : 'interface' }
Cicruit >> cicruitComple [
    | space container i1 i2 iSec or not and vanne e1 e2 eISec eOr eNot eAnd eVanne l1 l2 l3 l4 l5 l6 |
    
    space := BlSpace new.
    space title: 'Circuit avec Positions'.
    space extent: 900@600.
    
    container := BlElement new.
    container layout: BlBasicLayout new.
    container size: 900@600.
    container background: Color white.
    
    i1 := Interrupteur new.
    i1 position: 50@100.
    
    i2 := Interrupteur new.
    i2 position: 50@200.
    
    iSec := Interrupteur new.
    iSec position: 50@350.
    
    or := Or new.
    or position: 250@150.
    
    not := Not new.
    not position: 250@350.
    
    and := And new.
    and position: 500@250.
    
    vanne := Vanne new.
    vanne position: 750@250.
    or in1: i1; in2: i2.
    not in: iSec.
    and in1: or; in2: not.
    vanne in: and.
    i1 off.i2 off. iSec on.
    e1 := i1 image.
    e1 position: i1 position.
    i1 blElement: e1.
    
    e2 := i2 image.
    e2 position: i2 position.
    i2 blElement: e2.
    
    eISec := iSec image.
    eISec position: iSec position.
    iSec blElement: eISec.
    
    eOr := or image.
    eOr position: or position.
    or blElement: eOr.
    
    eNot := not image.
    eNot position: not position.
    not blElement: eNot.
    
    eAnd := and image.
    eAnd position: and position.
    and blElement: eAnd.
    
    eVanne := vanne image.
    eVanne position: vanne position.
    vanne blElement: eVanne.
    
    l1 := self ligneDeComposant: i1 versEntree: 1 deComposant: or.
    l2 := self ligneDeComposant: i2 versEntree: 2 deComposant: or.
    l3 := self ligneDeComposant: iSec versComposant: not.
    l4 := self ligneDeComposant: or versEntree: 1 deComposant: and.
    l5 := self ligneDeComposant: not versEntree: 2 deComposant: and.
    l6 := self ligneDeComposant: and versComposant: vanne.
    
    container addChild: l1.
    container addChild: l2.
    container addChild: l3.
    container addChild: l4.
    container addChild: l5.
    container addChild: l6.
    
    container addChild: e1.
    container addChild: e2.
    container addChild: eISec.
    container addChild: eOr.
    container addChild: eNot.
    container addChild: eAnd.
    container addChild: eVanne.
    
    composants := {i1. i2. iSec. or. not. and. vanne}.
    
    e1 addEventHandler: (BlEventHandler 
        on: BlClickEvent 
        do: [:event | 
            self mettreAJourCircuit: composants]).
    
    e2 addEventHandler: (BlEventHandler 
        on: BlClickEvent 
        do: [:event | 
            self mettreAJourCircuit: composants]).
    
    eISec addEventHandler: (BlEventHandler 
        on: BlClickEvent 
        do: [:event | 
            self mettreAJourCircuit: composants]).
    space root: container.
    space show.
    ^ space
]

{ #category : 'accessing' }
Cicruit >> circuit [

	^ circuit
]

{ #category : 'accessing' }
Cicruit >> circuit: anObject [

	circuit := anObject
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

{ #category : 'public access' }
Cicruit >> evaluate [ 
    | res|
    res := OrderedCollection new.
    sorties do: [:out | 
     | s |
        s := out evaluate.
        res add: (Dictionary new 
            at: 'composant' put: out;
            at: 'signal' put: s;
            at: 'valeur' put: s value;
            yourself)].
    
    self afficherResultats: res.
    ^ res

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

{ #category : 'interface' }
Cicruit >> ligne: pointA vers: pointB [
    | ligne |
    ligne := BlElement new.
    ligne geometry: (BlLineGeometry from: pointA to: pointB).
    ligne border: (BlBorder paint: Color black width: 3).
    ^ ligne
]

{ #category : 'interface' }
Cicruit >> ligneDeComposant: comp1 versComposant: comp2 [
    ^ self ligne: comp1 positionSortie vers: comp2 positionEntree
]

{ #category : 'interface' }
Cicruit >> ligneDeComposant: comp1 versEntree: numeroEntree deComposant: comp2 [
    ^ self ligne: comp1 positionSortie vers: (comp2 positionEntree: numeroEntree)

]

{ #category : 'interface' }
Cicruit >> mettreAJourCircuit: comps [
    comps do: [:comp | 
        comp blElement ifNotNil: [
            | nouvelleCouleur |
            nouvelleCouleur := [comp evaluate value 
                ifTrue: [Color green]
                ifFalse: [Color red]]
            on: Error 
            do: [:error | Color lightGray].
            comp blElement background: nouvelleCouleur]].
    
    self evaluate.
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
