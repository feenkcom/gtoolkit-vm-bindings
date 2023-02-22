Extension { #name : #OSPlatformVisitor }

{ #category : #'*GToolkit-VirtualMachine' }
OSPlatformVisitor >> visitAndroid: aPlatform [
	^ self visitUnix: aPlatform
]

{ #category : #'*GToolkit-VirtualMachine' }
OSPlatformVisitor >> visitAndroidAarch64: aPlatform [
	^ self visitAndroid: aPlatform
]
