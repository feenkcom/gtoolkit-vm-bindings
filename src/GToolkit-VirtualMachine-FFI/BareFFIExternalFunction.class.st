"
Compile all call methods:
```
(1 to: 15) collect: [ :i |
	BareFFIExternalFunction compile: (('{1}
	<primitive: ''primitiveBareFfiCallout''>

	self primitiveFailed') format: { BareFFIExternalFunction selector: i includingArgs: true }) classified: 'evaluating'
]
```
"
Class {
	#name : #BareFFIExternalFunction,
	#superclass : #Object,
	#instVars : [
		'callout',
		'moduleName',
		'functionName',
		'argumentTypes',
		'returnType',
		'externalObjectClass',
		'externalEnumerationClass'
	],
	#category : #'GToolkit-VirtualMachine-FFI-BareFFI'
}

{ #category : #accessing }
BareFFIExternalFunction class >> selector: amountOfArguments includingArgs: shouldIncludeArgs [
	| pattern |
	amountOfArguments isZero
		ifTrue: [ ^ #call ].
		
	pattern := shouldIncludeArgs
		ifTrue: [ 'call: arg{1} ' ]
		ifFalse: [ 'call:' ].

	^ (((1 to: amountOfArguments)
		collect: [ :j | pattern format: {j asString} ]) joinUsing: '')
		asSymbol
]

{ #category : #accessing }
BareFFIExternalFunction >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
BareFFIExternalFunction >> arguments: aCollectionOfFFIType [
	argumentTypes := aCollectionOfFFIType asArray
]

{ #category : #evaluating }
BareFFIExternalFunction >> call [
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 call: arg11 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 call: arg11 call: arg12 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 call: arg11 call: arg12 call: arg13 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 call: arg11 call: arg12 call: arg13 call: arg14 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
]

{ #category : #evaluating }
BareFFIExternalFunction >> call: arg1 call: arg2 call: arg3 call: arg4 call: arg5 call: arg6 call: arg7 call: arg8 call: arg9 call: arg10 call: arg11 call: arg12 call: arg13 call: arg14 call: arg15 [ 
	<primitive: 'primitiveBareFfiCallout'>

	self primitiveFailed
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
	returnType := BareFFIType void.
	externalObjectClass := ExternalObject.
	externalEnumerationClass := FFIEnumeration
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
