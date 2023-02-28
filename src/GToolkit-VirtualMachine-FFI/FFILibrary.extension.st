Extension { #name : #FFILibrary }

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFILibrary >> androidAarch64LibraryName [
	^ self androidLibraryName
]

{ #category : #'*GToolkit-VirtualMachine-FFI' }
FFILibrary >> androidLibraryName [
	"Point to #unix64LibraryName to keep backward compatibility." 
	^ self unix64LibraryName
]
