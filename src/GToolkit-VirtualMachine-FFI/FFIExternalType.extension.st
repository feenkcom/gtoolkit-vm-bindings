Extension { #name : #FFIExternalType }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFIExternalType >> ffiBareEmitArgument: aBuilder context: aContext inCallout: aCallout [
	self loader
		emitArgument: aBuilder
		context: aContext
]

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFIExternalType >> ffiBareType [
	self subclassResponsibility
]

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFIExternalType >> ffiBareTypeWithArity [
	pointerArity = 0
		ifTrue: [ ^ self ffiBareType ].
	pointerArity = 1
		ifTrue: [ ^ BareFFIType pointer ].
		
	self error: ('Only arity 0 and 1 are supported. Got arity {1}' format: { pointerArity })
]
