Class {
	#name : #BaselineOfGToolkitVirtualMachine,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitVirtualMachine
}

{ #category : #baselines }
BaselineOfGToolkitVirtualMachine >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec package: #'GToolkit-VirtualMachine'.
		spec package: #'GToolkit-VirtualMachine-FFI' ]
]
