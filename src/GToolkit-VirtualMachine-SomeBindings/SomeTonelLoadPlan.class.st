Class {
	#name : #SomeTonelLoadPlan,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'instructions',
		'preconditions'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #'as yet unclassified' }
SomeTonelLoadPlan class >> buildLoadPlan: aFileReferenceToPackage [
	^ self primitiveBuildLoadPlan: aFileReferenceToPackage asFileReference fullName planClass: SomeTonelLoadPlan
	instructionClass: SomeTonelLoadInstruction
	methodDefinitionClass: SomeTonelMethodDefinition
	preconditionClass: SomeTonelLoadPrecondition
]

{ #category : #'as yet unclassified' }
SomeTonelLoadPlan class >> primitiveBuildLoadPlan: aString planClass: aPlanClass instructionClass: anInstructionClass methodDefinitionClass: aMethodDefinitionClass preconditionClass: aPreconditionClass [
	<primitive: 'primitiveTonelBuildLoadPlan'>
	
	^ self primitiveFailed
]

{ #category : #views }
SomeTonelLoadPlan >> gtPreconditionsFor: aView [
	<gtView>
	preconditions ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Preconditions';
		priority: 5;
		items: [ preconditions ];
		column: 'Value' text: [ :each | each gtDisplayString ]
]
