Class {
	#name : #AndroidAarch64Platform,
	#superclass : #AndroidPlatform,
	#category : #'GToolkit-VirtualMachine-Platform'
}

{ #category : #testing }
AndroidAarch64Platform class >> isActivePlatform [
	^ Smalltalk vm operatingSystemName = 'android'
		and: [ (Smalltalk vm getSystemAttribute: 1003) = 'aarch64' ]
]

{ #category : #visiting }
AndroidAarch64Platform >> accept: aVisitor [
	^ aVisitor visitAndroidAarch64: self
]

{ #category : #visiting }
AndroidAarch64Platform >> ffiLibraryName: aLibrary [
	^ aLibrary androidAarch64LibraryName
]
