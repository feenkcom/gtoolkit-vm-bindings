Class {
	#name : #BareFFICalloutAPI,
	#superclass : #Object,
	#instVars : [
		'options',
		'senderContext',
		'uFFIEntryPointContext',
		'fixedArgumentCount'
	],
	#category : #'GToolkit-VirtualMachine-FFI-BareFFI'
}

{ #category : #'instance creation' }
BareFFICalloutAPI class >> inUFFIContext: aContext [
	^ self basicNew
		initializeUFFIContext: aContext;
		yourself
]

{ #category : #'instance creation' }
BareFFICalloutAPI class >> new [
	self error: 'use #inFFIContext:'
]

{ #category : #accessing }
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

{ #category : #accessing }
BareFFICalloutAPI >> context [
	^ senderContext
]

{ #category : #configuration }
BareFFICalloutAPI >> findUffiEnterContext [
	"Finds the initial context where entering the uffi framework.
	That is, the context that was marked with the #ffiCalloutTranslator pragma, whose caller was not.
	The found context determines how uffi was called. Its sender context is the client context.
	If no context is found, return nil"

	| pragmaName uffiEnterContext |
	pragmaName := #ffiCalloutTranslator.

	uffiEnterContext := (uFFIEntryPointContext ifNil: [ thisContext ]) findContextSuchThat: [ :ctx |
		(ctx homeMethod hasPragmaNamed: pragmaName)
			and: [ (ctx sender homeMethod hasPragmaNamed: pragmaName) not] ].
	^ uffiEnterContext
]

{ #category : #accessing }
BareFFICalloutAPI >> function: functionSignature library: moduleNameOrLibrary [
	| sender ffiMethod |

	sender := self senderContext.
	ffiMethod := GtVirtualMachineCalloutAPI compileMutex critical:
		[ self compileFunction: functionSignature library: moduleNameOrLibrary sender: sender ].

	sender return:
		(sender receiver withArgs: sender arguments executeMethod: ffiMethod).
	"We never get here"
	^ self
]

{ #category : #'backward compatibility' }
BareFFICalloutAPI >> function: aCollection module: aClass [

	^ self function: aCollection library: aClass
]

{ #category : #initialization }
BareFFICalloutAPI >> initialize [
	options := #().

	super initialize
]

{ #category : #initialization }
BareFFICalloutAPI >> initializeUFFIContext: aUFFIEntryPointContext [
	uFFIEntryPointContext := aUFFIEntryPointContext.
	self initialize
]

{ #category : #action }
BareFFICalloutAPI >> newBuilder [
	^ BareFFICalloutMethodBuilder calloutAPI: self
]

{ #category : #accessing }
BareFFICalloutAPI >> options [
	^ options
]

{ #category : #accessing }
BareFFICalloutAPI >> options: anObject [
	options := anObject
]

{ #category : #accessing }
BareFFICalloutAPI >> senderContext [

	senderContext ifNotNil: [ ^ senderContext ].
	^ self findUffiEnterContext sender
]

{ #category : #accessing }
BareFFICalloutAPI >> uFFIEnterMethodSelector [

	"Return the selector of the uffiEnterContext.
	That is, the selector that was called by client code to invoke uffi.
	If we got here from a context not controlled by uffi, return nil, as we have found no method"

	^ self findUffiEnterContext ifNotNil: [ :ctx | ctx homeMethod selector ]
]
