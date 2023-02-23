"
I am an expert on Android filesystem conventions. I resolve origins according to these conventions.
"
Class {
	#name : #AndroidResolver,
	#superclass : #PlatformResolver,
	#category : #'GToolkit-VirtualMachine-Platform'
}

{ #category : #accessing }
AndroidResolver class >> platformName [
	^  'android'
]

{ #category : #origins }
AndroidResolver >> cache [
	<origin>

	^ self home / 'cache'
]

{ #category : #origins }
AndroidResolver >> home [
	<origin>

	"There is no such as thing as home directory on Android.
	We are only able to access Scoped Storage which is app specific"
	^ Smalltalk image imageDirectory
]

{ #category : #origins }
AndroidResolver >> preferences [
	<origin>

	^ self home / 'preferences'
]

{ #category : #origins }
AndroidResolver >> temp [
	<origin>

	^ self home / 'temp'
]
