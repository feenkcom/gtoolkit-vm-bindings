Class {
	#name : #BareFFICalloutMethodBuilder,
	#superclass : #FFICalloutMethodBuilder,
	#category : #'GToolkit-VirtualMachine-FFI-BareFFI'
}

{ #category : #'as yet unclassified' }
BareFFICalloutMethodBuilder >> createFFICalloutLiteralFromSpec: functionSpec [
	^ BareFFIExternalFunction new
		functionName: functionSpec functionName;
		moduleName: self libraryName;
		arguments: (functionSpec arguments collect: [ :each | each ffiBareTypeWithArity] as: Array);
		return: functionSpec returnType ffiBareTypeWithArity
]

{ #category : #'as yet unclassified' }
BareFFICalloutMethodBuilder >> generateFFICallout: builder spec: functionSpec ffiLibrary: ffiLibrary [
	| callout |
	
	TFCalloutAPI isTracing ifTrue: [ 
		TFCalloutAPI trace: sender. 
		builder 
			pushLiteral: TFCalloutAPI;
			pushLiteral: sender;
			send: #trace: ].
	
	callout := self createFFICalloutLiteralFromSpec: functionSpec.
	
	builder pushLiteral: callout.
	
	functionSpec arguments do: [ :each | each ffiBareEmitArgument: builder context: sender inCallout: self requestor ].
	
	builder send: (BareFFIExternalFunction selector: functionSpec arguments size includingArgs: false).
	
	callout returnType = BareFFIType void
		ifTrue: [
			builder
				popTop;
				pushReceiver;
				returnTop. ]
		ifFalse: [ builder returnTop ].
	
	^ builder
]
