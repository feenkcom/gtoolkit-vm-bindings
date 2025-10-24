Extension { #name : #BareFFICalloutAPI }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
BareFFICalloutAPI >> compileFunction: functionSignature library: moduleNameOrLibrary sender: sender [
	| originalMethod ffiMethod ffiMethodSelector |

	originalMethod := sender methodClass methodDict at: sender selector.
	(originalMethod hasProperty: #ffiNonCompiledMethod) ifTrue: [	
		^ originalMethod ].
	
	ffiMethodSelector := self uFFIEnterMethodSelector.
	"Build new method"
	ffiMethod := self newBuilder build: [ :builder | 
		             builder
			             signature: functionSignature;
			             sender: sender;
			             library: moduleNameOrLibrary ].
	ffiMethod
		selector: sender selector;
		methodClass: sender methodClass.
	"Replace with generated ffi method, but save old one for future use"
	ffiMethod
		propertyAt: #ffiNonCompiledMethod
		put: originalMethod.
	"For senders search, one need to keep the selector in the properties"
	ffiMethod propertyAt: #ffiMethodSelector put: ffiMethodSelector.
	sender methodClass methodDict at: sender selector put: ffiMethod.	
	FFIMethodRegistry uniqueInstance registerMethod: ffiMethod .

	^ ffiMethod
]

{ #category : #'*GToolkit-VirtualMachine-FFI' }
BareFFICalloutAPI >> function: functionSignature library: moduleNameOrLibrary [
	<gtPharoPatch: #Pharo>
	| sender ffiMethod |

	sender := self senderContext.
	ffiMethod := GtVirtualMachineCalloutAPI compileMutex critical:
		[ self compileFunction: functionSignature library: moduleNameOrLibrary sender: sender ].

	sender return:
		(sender receiver withArgs: sender arguments executeMethod: ffiMethod).
	"We never get here"
	^ self
]
