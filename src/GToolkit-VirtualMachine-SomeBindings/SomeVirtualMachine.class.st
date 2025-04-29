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
SomeVirtualMachine >> allClassNames [
	^ SomeVirtualMachineStrings
		fromNativeHandle: self primGetAllClassNames
		during: [ :classNameStrings | classNameStrings asArray ]
]

{ #category : #views }
SomeVirtualMachine >> classNamed: eachName [
	^ self ffiLibrary
		newString: eachName
		during: [ :stringBox | SomeVirtualMachineClass fromNativeHandle: (self primGetClassNamed: stringBox) ]
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

{ #category : #views }
SomeVirtualMachine >> gtAllClassesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Classes';
		priority: 5;
		items: [ self allClassNames ];
		column: 'Name' text: [ :each | each gtDisplayString ];
		send: [ :eachName | self classNamed: eachName ]
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> gtInspectorTitleString [
	^ 'Runtime'
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

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> primGetAllClassNames [
	^ self ffiCall: #(void* glamorous_vm_virtual_machine_get_all_class_names(self))
]

{ #category : #'as yet unclassified' }
SomeVirtualMachine >> primGetClassNamed: aStringBox [
	^ self ffiCall: #(void* glamorous_vm_virtual_machine_get_class_named(self, void* aStringBox))
]
