Class {
	#name : #SomeVirtualMachineLibrary,
	#superclass : #FFILibrary,
	#traits : 'TGtWithStringBox',
	#classTraits : 'TGtWithStringBox classTrait',
	#category : #'GToolkit-VirtualMachine-SomeBindings'
}

{ #category : #'library path' }
SomeVirtualMachineLibrary class >> ffiLibrary [
	^ self
]

{ #category : #'api - library' }
SomeVirtualMachineLibrary >> androidLibraryName [
	^ 'libGlamorousVM.so'
]

{ #category : #testing }
SomeVirtualMachineLibrary >> hasModule [
	"Return if there is a loadable and working library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'api - library' }
SomeVirtualMachineLibrary >> macLibraryName [
	^ FFIMacLibraryFinder findLibrary: 'libGlamorousVM.dylib'
]

{ #category : #'private - ffi' }
SomeVirtualMachineLibrary >> primTest [
	^ self ffiCall: #(bool glamorous_vm_test())
]

{ #category : #'api - library' }
SomeVirtualMachineLibrary >> unix32LibraryName [
	^ FFIUnix32LibraryFinder findLibrary: 'libGlamorousVM.so'
]

{ #category : #'api - library' }
SomeVirtualMachineLibrary >> unix64LibraryName [
	^ FFIUnix64LibraryFinder findLibrary: 'libGlamorousVM.so'
]

{ #category : #'api - library' }
SomeVirtualMachineLibrary >> win32LibraryName [
	^ FFIWindowsLibraryFinder findLibrary: 'GlamorousVM.dll'
]
