Class {
	#name : #GtVirtualMachineSource,
	#superclass : #Object,
	#instVars : [
		'core',
		'plugins',
		'systemLibraries',
		'libraries'
	],
	#category : #'GToolkit-VirtualMachine-Model'
}

{ #category : #'instance creation' }
GtVirtualMachineSource class >> fromJSONString: aJSONString [
	^ self new initializeFromJson: (STONJSON fromString: aJSONString)
]

{ #category : #private }
GtVirtualMachineSource >> allDependenciesIn: aJSON [
	^ (((aJSON at: 'core') at: 'dependencies'),
		(((aJSON at: 'core') at: 'features') flatCollect: [ :each | each at: 'dependencies' ])),
		((aJSON at: 'plugins') flatCollect: [ :each | each at: 'dependencies' ])
]

{ #category : #accessing }
GtVirtualMachineSource >> featureNamed: aName [
	^ core features detect: [ :eachFeature | eachFeature name = aName ]
]

{ #category : #initialization }
GtVirtualMachineSource >> initializeFromJson: aUnitStructure [
	core := GtVirtualMachineSourceCore new initializeFromJson: (aUnitStructure at: 'core').
	plugins := (aUnitStructure at: 'plugins') collect: [ :eachPluginStructure |
		GtVirtualMachineSourcePlugin new initializeFromJson: eachPluginStructure ].
	systemLibraries := (Array streamContents: [ :aStream |
		(self allDependenciesIn: aUnitStructure)
			do: [ :each |
			| eachType eachName |

			eachType := each keys first.
			eachName := each at: eachType.
			
			eachType = 'SystemLibrary'
				ifTrue: [ aStream nextPut: (GtVirtualMachineSourceSystemLibrary new name: eachName) ] ] ]) copyWithoutDuplicates.
		
	libraries := (Array streamContents: [ :aStream |
		(self allDependenciesIn: aUnitStructure)
			do: [ :each |
			| eachType eachName |

			eachType := each keys first.
			eachName := each at: eachType.
			
			eachType = 'Library'
				ifTrue: [ aStream nextPut: (GtVirtualMachineSourceLibrary new name: eachName) ] ] ]) copyWithoutDuplicates.
	
	core initializeDependenciesFromJson: (aUnitStructure at: 'core') virtualMachineSource: self.
	plugins with: (aUnitStructure at: 'plugins') do: [ :eachPlugin :eachPluginStructure |
		eachPlugin initializeDependenciesFromJson: eachPluginStructure virtualMachineSource: self ]
]

{ #category : #accessing }
GtVirtualMachineSource >> libraryNamed: aName [
	^ libraries detect: [ :eachLibrary | eachLibrary name = aName ]
]

{ #category : #accessing }
GtVirtualMachineSource >> pluginNamed: aName [
	^ plugins detect: [ :eachPlugin | eachPlugin name = aName ]
]

{ #category : #accessing }
GtVirtualMachineSource >> systemLibraryNamed: aName [
	^ systemLibraries detect: [ :eachSystemLibrary | eachSystemLibrary name = aName ]
]
