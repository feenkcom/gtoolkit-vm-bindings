Extension { #name : #FFIVariableArgument }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFIVariableArgument >> ffiBareTypeWithArity [
	^ self resolvedType ffiBareTypeWithArity
]
