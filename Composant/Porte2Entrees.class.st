Class {
	#name : 'Porte2Entrees',
	#superclass : 'Porte',
	#instVars : [
		'in1',
		'in2'
	],
	#category : 'Composant',
	#package : 'Composant'
}

{ #category : 'accessing' }
Porte2Entrees >> description [
    | in1Description in2Description |
    in1Description := in1 
        ifNil: ['non connecté'] 
        ifNotNil: ['{1} ({2})' format: {in1 class name. in1 id}].
    in2Description := in2 
        ifNil: ['non connecté'] 
        ifNotNil: ['{1} ({2})' format: {in2 class name. in2 id}].

    ^ '{1} ({2}) in1: {3} in2: {4}' format: {
        self class name. 
        self id. 
        in1Description. 
        in2Description}
]

{ #category : 'accessing' }
Porte2Entrees >> in1 [

	^ in1
]

{ #category : 'accessing' }
Porte2Entrees >> in1: anObject [

	in1 := anObject
]

{ #category : 'accessing' }
Porte2Entrees >> in2 [

	^ in2
]

{ #category : 'accessing' }
Porte2Entrees >> in2: anObject [

	in2 := anObject
]
