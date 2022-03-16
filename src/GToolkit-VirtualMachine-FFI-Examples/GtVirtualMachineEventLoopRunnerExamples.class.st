Class {
	#name : #GtVirtualMachineEventLoopRunnerExamples,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-FFI-Examples'
}

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallBoolean [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopBoolean: false.
	self assert: aResult equals: false.
	
	aResult := self ffiEventLoopBoolean: true.
	self assert: aResult equals: true.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallInt16 [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopInt16: -32768.
	self assert: aResult equals: -32768.
	
	aResult := self ffiEventLoopInt16: 0.
	self assert: aResult equals: 0.
	
	aResult := self ffiEventLoopInt16: 32767.
	self assert: aResult equals: 32767.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallInt8 [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopInt8: -128.
	self assert: aResult equals: -128.
	
	aResult := self ffiEventLoopInt8: 0.
	self assert: aResult equals: 0.
	
	aResult := self ffiEventLoopInt8: 127.
	self assert: aResult equals: 127.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallPointer [
	<gtExample>
	| aResult anAddress |

	aResult := self ffiEventLoopPointer: ExternalAddress new.
	self assert: aResult equals: ExternalAddress new.
	
	anAddress := ExternalAddress new: ExternalAddress wordSize.
	(1 to: ExternalAddress wordSize) do: [ :i | anAddress at: i put: i ].
	
	aResult := self ffiEventLoopPointer: anAddress.
	self assert: aResult equals: anAddress.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallUint16 [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopUint16: 0.
	self assert: aResult equals: 0.
	
	aResult := self ffiEventLoopUint16: 65535.
	self assert: aResult equals: 65535.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallUint8 [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopUint8: 0.
	self assert: aResult equals: 0.
	
	aResult := self ffiEventLoopUint8: 255.
	self assert: aResult equals: 255.
	
	^ aResult
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> eventLoopCallVoid [
	<gtExample>
	| aResult |

	aResult := self ffiEventLoopVoid.
	
	^ aResult
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopBoolean: aBoolean [
	^ self ffiCall: #(bool pass_and_return_bool(bool aBoolean)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopInt16: aNumber [
	^ self ffiCall: #(int16 pass_and_return_i16(int16 aNumber)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopInt8: aNumber [
	^ self ffiCall: #(int8 pass_and_return_i8(int8 aNumber)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopPointer: aPointer [
	^ self ffiCall: #(void* pass_and_return_pointer(void* aPointer)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopUint16: aNumber [
	^ self ffiCall: #(uint16 pass_and_return_u16(uint16 aNumber)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopUint8: aNumber [
	^ self ffiCall: #(uint8 pass_and_return_u8(uint8 aNumber)) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]

{ #category : #'private - ffi' }
GtVirtualMachineEventLoopRunnerExamples >> ffiEventLoopVoid [
	^ self ffiCall: #(void pass_and_return_void()) library: GtVirtualMachineTestLibrary options: #(optEventLoop)
]
