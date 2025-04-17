Class {
	#name : #SomeVirtualMachine,
	#superclass : #GtBoxerValueBox,
	#classVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings'
}

{ #category : #'as yet unclassified' }
SomeVirtualMachine class >> ffiLibrary [
	^ SomeVirtualMachineLibrary uniqueInstance
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine class >> primCreate [
	^ self ffiCall: #(void* glamorous_vm_virtual_machine_instantiate())
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine class >> uniqueInstance [
	(uniqueInstance isNil or: [ uniqueInstance isNull ])
		ifTrue: [
			uniqueInstance := self fromNativeHandle: self primCreate.
			uniqueInstance primBootstrap ].
	^ uniqueInstance
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> evaluate: sourceCode [
	^ self ffiLibrary getStringFrom: [ :returnStringBox |
		self ffiLibrary
			newString: sourceCode
			during: [ :sourceCodeStringBox |
				self
					primEvaluate: sourceCodeStringBox
					return: returnStringBox ] ]
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> primBootstrap [
	^ self ffiCall: #(void glamorous_vm_virtual_machine_bootstrap(self))
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> primEvaluate: sourceCode return: returnString [
	^ self ffiCall: #(bool glamorous_vm_virtual_machine_evaluate(
		self,
		void* sourceCode,
		void* returnString))
]
