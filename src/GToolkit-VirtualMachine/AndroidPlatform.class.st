Class {
	#name : #AndroidPlatform,
	#superclass : #UnixPlatform,
	#category : #'GToolkit-VirtualMachine-Platform'
}

{ #category : #visiting }
AndroidPlatform >> accept: aVisitor [
	^ aVisitor visitAndroid: self
]

{ #category : #accessing }
AndroidPlatform >> potentialLocationsOfSourcesFile [
	"According to the folder structure of Android the only reasonable
	place to search for sources is in the image directory"
	^ { Smalltalk image imageDirectory }
]
