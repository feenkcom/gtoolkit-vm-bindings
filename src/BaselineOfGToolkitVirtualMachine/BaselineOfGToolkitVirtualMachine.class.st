Class {
	#name : #BaselineOfGToolkitVirtualMachine,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfGToolkitVirtualMachine
}

{ #category : #baselines }
BaselineOfGToolkitVirtualMachine >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoad:'.
		spec package: #'GToolkit-VirtualMachine'.
		spec package: #'GToolkit-VirtualMachine-FFI' ]
]

{ #category : #doits }
BaselineOfGToolkitVirtualMachine >> postLoad: spec [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].
		
	PostLoaded := true.
	self postLoadVirtualMachine: spec
]

{ #category : #doits }
BaselineOfGToolkitVirtualMachine >> postLoadVirtualMachine: spec [
	"otherwise ffiBareCall: is not marked as #isFFIMethod"
	FFICompilerPlugin initializeFFICalloutSelectors
]
