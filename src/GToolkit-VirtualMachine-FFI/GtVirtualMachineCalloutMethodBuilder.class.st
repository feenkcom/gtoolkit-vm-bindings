Class {
	#name : #GtVirtualMachineCalloutMethodBuilder,
	#superclass : #TFCalloutMethodBuilder,
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #'private - factory' }
GtVirtualMachineCalloutMethodBuilder >> createFFICalloutLiteralFromSpec: functionSpec [
	^ 	(GtVirtualMachineExternalFunction
			name: functionSpec functionName
			moduleName: self libraryName
			parameterTypes: (functionSpec arguments collect: #tfExternalTypeWithArity)
			returnType: functionSpec returnType tfExternalTypeWithArity
			fixedArgumentCount: fixedArgumentCount)
				blocking: (self requestor optionAt: #optNonBlocking) not
]
