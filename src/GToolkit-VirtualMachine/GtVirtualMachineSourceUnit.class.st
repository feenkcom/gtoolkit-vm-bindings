Class {
	#name : #GtVirtualMachineSourceUnit,
	#superclass : #Object,
	#instVars : [
		'name',
		'includes',
		'sources',
		'defines',
		'flags',
		'dependencies'
	],
	#category : #'GToolkit-VirtualMachine-Model'
}

{ #category : #accessing }
GtVirtualMachineSourceUnit >> dependencies [
	^ dependencies
]

{ #category : #initialization }
GtVirtualMachineSourceUnit >> initializeDependenciesFromJson: aUnitStructure virtualMachineSource: aGtVirtualMachineSource [
	dependencies := ((aUnitStructure at: 'dependencies') collect: [ :each |
		| eachType eachName |
		
		eachType := each keys first.
		eachName := each at: eachType.
		eachType = 'Plugin'
			ifTrue: [ aGtVirtualMachineSource pluginNamed: eachName ]
			ifFalse: [ eachType = 'Feature'
				ifTrue: [ aGtVirtualMachineSource featureNamed: eachName  ]
				ifFalse: [ eachType = 'SystemLibrary'
					ifTrue: [ aGtVirtualMachineSource systemLibraryNamed: eachName  ]
					ifFalse: [ eachType = 'Library'
						ifTrue: [ aGtVirtualMachineSource libraryNamed: eachName  ]
						ifFalse: [ nil ] ] ] ]
	]) select: [ :each | each notNil ]
]

{ #category : #initialization }
GtVirtualMachineSourceUnit >> initializeFromJson: aUnitStructure [
	name := aUnitStructure at: 'name'.
	includes := aUnitStructure at: 'includes'.
	sources := aUnitStructure at: 'sources'.
	defines := aUnitStructure at: 'defines'.
	flags := aUnitStructure at: 'flags'
]

{ #category : #accessing }
GtVirtualMachineSourceUnit >> name [
	^ name
]

{ #category : #printing }
GtVirtualMachineSourceUnit >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]
