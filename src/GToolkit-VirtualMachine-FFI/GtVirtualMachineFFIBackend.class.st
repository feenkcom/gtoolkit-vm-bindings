Class {
	#name : #GtVirtualMachineFFIBackend,
	#superclass : #FFIBackend,
	#type : #bytes,
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #detecting }
GtVirtualMachineFFIBackend class >> isAvailable [
	
	^ self new isAvailable 
]

{ #category : #accessing }
GtVirtualMachineFFIBackend class >> priority [

	^ 10
]

{ #category : #'instance creation' }
GtVirtualMachineFFIBackend >> allocate: byteSize [

	"Primitive. Allocate an object on the external heap."

	<primitive: 'primitiveFFIAllocate'>
	^ self primitiveFailed
]

{ #category : #'instance creation' }
GtVirtualMachineFFIBackend >> calloutAPIClass [
	^ GtVirtualMachineCalloutAPI
]

{ #category : #'instance creation' }
GtVirtualMachineFFIBackend >> free: anExternalAddress [

	<primitive:'primitiveFFIFree'>
	^self primitiveFailed
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> integerOfObject: anObject at: byteOffset put: value size: nBytes signed: aBoolean [
	"Primitive. Store the given value as integer of nBytes size
	in the receiver. Fail if the value is out of range.
	Note: This primitive will access memory in the outer space if
	invoked from ExternalAddress."
	<primitive: 'primitiveFFIIntegerAtPut'>
	^self primitiveFailed
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> integerOfObject: anObject at: byteOffset size: nBytes signed: aBoolean [
	"Primitive. Return an integer of nBytes size from the receiver.
	Note: This primitive will access memory in the outer space if
	invoked from ExternalAddress."
	<primitive: 'primitiveFFIIntegerAt'>
	^self primitiveFailed
]

{ #category : #testing }
GtVirtualMachineFFIBackend >> isAvailable [

	^ [ self loadSymbol: #primitiveLoadSymbolFromModule module: nil. true ] onErrorDo: [ false ]
]

{ #category : #'instance creation' }
GtVirtualMachineFFIBackend >> loadSymbol: moduleSymbol module: module [ 
	
	| encodedString |
	encodedString := module ifNotNil: [ module utf8Encoded asString ].
	
	"The primitive is expected the module to be a utf8Encoded String."
	^ [ self primLoadSymbol: moduleSymbol module: encodedString ]
		on: Error
		do: [ :anError |
			(GtVirtualMachineSymbolNotFoundError new
				symbolName: moduleSymbol;
				moduleName: module) signal ]
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> on: anObject float32At: offset [

	^ self primitiveFailed
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> on: anObject float32At: offset put: value [

	value isFloat ifFalse: [ 
		^ anObject float32AtOffset: offset - 1 put: value asFloat ].

	self isReadOnlyObject ifTrue: [ 
		^ self
			  modificationForbiddenFor: #on:float32At:put:
			  index: offset
			  value: value ].

	^ self primitiveFailed
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> on: anObject float64At: offset [

	^ self primitiveFailed
]

{ #category : #accessing }
GtVirtualMachineFFIBackend >> on: anObject float64At: offset put: value [

	value isFloat ifFalse: [ 
		^ anObject float64AtOffset: offset - 1 put: value asFloat ].

	self isReadOnlyObject ifTrue: [ 
		^ self
			  modificationForbiddenFor: #on:float64At:put:
			  index: offset
			  value: value ].
		
	^ self primitiveFailed
]

{ #category : #'instance creation' }
GtVirtualMachineFFIBackend >> primLoadSymbol: moduleSymbol module: module [ 

	<primitive: 'primitiveLoadSymbolFromModule'>

	^ self primitiveFailed
]
