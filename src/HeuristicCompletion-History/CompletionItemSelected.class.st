Class {
	#name : 'CompletionItemSelected',
	#superclass : 'Announcement',
	#instVars : [
		'item'
	],
	#category : 'HeuristicCompletion-History',
	#package : 'HeuristicCompletion-History'
}

{ #category : 'accessing' }
CompletionItemSelected >> selectedItem [

	^ item
]

{ #category : 'accessing' }
CompletionItemSelected >> selectedItem: anObject [

	item := anObject
]
