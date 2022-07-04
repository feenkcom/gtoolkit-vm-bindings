Class {
	#name : #GtVirtualMachineSourceCore,
	#superclass : #GtVirtualMachineSourceUnit,
	#instVars : [
		'features'
	],
	#category : #'GToolkit-VirtualMachine-Model'
}

{ #category : #accessing }
GtVirtualMachineSourceCore >> features [

	^ features
]

{ #category : #initialization }
GtVirtualMachineSourceCore >> initializeDependenciesFromJson: aUnitStructure virtualMachineSource: aGtVirtualMachineSource [
	super initializeDependenciesFromJson: aUnitStructure virtualMachineSource: aGtVirtualMachineSource.
	
	features with: (aUnitStructure at: 'features') do: [ :eachFeature :eachFeatureStructure |
		eachFeature initializeDependenciesFromJson: eachFeatureStructure virtualMachineSource: aGtVirtualMachineSource ]
]

{ #category : #initialization }
GtVirtualMachineSourceCore >> initializeFromJson: aUnitStructure [
	super initializeFromJson: aUnitStructure.
	
	features := (aUnitStructure at: 'features') collect: [ :eachFeatureStructure |
		GtVirtualMachineSourceFeature new initializeFromJson: eachFeatureStructure ]
]
