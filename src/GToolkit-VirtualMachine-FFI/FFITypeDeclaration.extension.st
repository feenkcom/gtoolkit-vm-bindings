Extension { #name : #FFITypeDeclaration }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFITypeDeclaration >> ffiBareTypeWithArity [
	arity = 0
		ifTrue: [ ^ self resolvedType ffiBareTypeWithArity ].
	arity = 1
		ifTrue: [ ^ BareFFIType pointer ].
		
	self error: ('Only arity 0 and 1 are supported. Got arity {1}' format: { arity })
]
