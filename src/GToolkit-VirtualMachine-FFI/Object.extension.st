Extension { #name : #Object }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
Object >> ffiBareCall: fnSpec [
	<ffiCalloutTranslator>

	"All the ffiBareCall: messages are used to perform Foreign-Function calls (FFI calls).
	FFI calls allows Pharo code to interact with external dynamic linked libraries.
	Please refer to the booklet about more configuration details
	or some of the examples on the image LibC / FreeTypeFont / Athens / SDL."

	self ffiBareCall: fnSpec library: self ffiLibrary options: #()
]

{ #category : #'*GToolkit-VirtualMachine-FFI' }
Object >> ffiBareCall: fnSpec library: aLibrary options: callOptions [
	<ffiCalloutTranslator>

	| ffiLibrary |
	ffiLibrary := aLibrary asFFILibrary.
	^ (BareFFICalloutAPI inUFFIContext: thisContext)
		convention: self ffiCallingConvention;
		options: (ffiLibrary options), callOptions;
		function: fnSpec library: ffiLibrary
]
