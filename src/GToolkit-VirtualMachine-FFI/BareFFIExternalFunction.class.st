Class {
	#name : #BareFFIExternalFunction,
	#superclass : #Object,
	#instVars : [
		'callout',
		'moduleName',
		'functionName',
		'argumentTypes',
		'returnType'
	],
	#category : #'GToolkit-VirtualMachine-FFI-BareFFI'
}

{ #category : #accessing }
BareFFIExternalFunction >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
BareFFIExternalFunction >> arguments: aCollectionOfFFIType [
	argumentTypes := aCollectionOfFFIType
]

{ #category : #accessing }
BareFFIExternalFunction >> functionName [
	^ functionName
]

{ #category : #accessing }
BareFFIExternalFunction >> functionName: anObject [
	functionName := anObject
]

{ #category : #initialization }
BareFFIExternalFunction >> initialize [
	super initialize.
	
	callout := ExternalAddress null.
	moduleName := ''.
	functionName := ''.
	argumentTypes := #().
	returnType := BareFFIType void
]

{ #category : #'as yet unclassified' }
BareFFIExternalFunction >> invalidate [
	<primitive: 'primitiveFastFfiCalloutInvalidate'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
BareFFIExternalFunction >> moduleName [
	^ moduleName
]

{ #category : #accessing }
BareFFIExternalFunction >> moduleName: anObject [
	moduleName := anObject
]

{ #category : #accessing }
BareFFIExternalFunction >> return: anFFIType [
	returnType := anFFIType
]

{ #category : #accessing }
BareFFIExternalFunction >> returnType [
	^ returnType
]

{ #category : #evaluating }
BareFFIExternalFunction >> value [
	<primitive: 'primitiveFastFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> value: arg1 [
	<primitive: 'primitiveFastFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> value: arg1 value: arg2 [
	<primitive: 'primitiveFastFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> value: arg1 value: arg2 value: arg3 [
	<primitive: 'primitiveFastFfiCallout'>

	self primitiveFailed
]
