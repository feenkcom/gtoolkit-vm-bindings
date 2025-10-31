Class {
	#name : #SomeTonelLoadPlan,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'behaviors',
		'methods',
		'extensions',
		'preconditions'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #'as yet unclassified' }
SomeTonelLoadPlan class >> buildLoadPlan: aFileReferenceToPackage [
	^ self
		primitiveBuildLoadPlan: aFileReferenceToPackage asFileReference fullName
		classes: {
			SomeTonelLoadPlan.
			SomeTonelBehaviorLoad.
			SomeTonelClassDocument.
			SomeTonelClassDefinition.
			SomeTonelTraitDocument.
			SomeTonelTraitDefinition.
			SomeTonelExtensionLoad.
			SomeTonelExtensionDocument.
			SomeTonelMethodLoad.
			SomeTonelMethodDocument.
			SomeTonelMethodDefinition.
			SomeTonelLoadPrecondition.
			SomeTonelDependentEntity
		}
]

{ #category : #'as yet unclassified' }
SomeTonelLoadPlan class >> primitiveBuildLoadPlan: aString classes: anArrayOfTonelClasses [
	<primitive: 'primitiveTonelBuildLoadPlan'>
	
	^ self primitiveFailed
]

{ #category : #views }
SomeTonelLoadPlan >> gtLoadBehaviorsFor: aView [
	<gtView>
	behaviors ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Behaviors';
		priority: 3;
		items: [ behaviors ];
		column: 'Name' text: [ :each | each name ]
]

{ #category : #views }
SomeTonelLoadPlan >> gtPreconditionsFor: aView [
	<gtView>
	preconditions ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Preconditions';
		priority: 5;
		items: [ preconditions ];
		column: 'Missing' text: [ :each | each requiredName ];
		column: 'Referenced by' text: [ :each | each dependent name ];
		column: 'reason' text: [ :each | each reason ]
]
