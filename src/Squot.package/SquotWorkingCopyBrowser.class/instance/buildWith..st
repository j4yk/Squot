toolbuilder
buildWith: toolBuilder
	| buttons nButtons |
	buttons :=
		{toolBuilder pluggableButtonSpec new
			name: #addObject;
			model: self;
			label: 'Add...';
			action: #addObject;
			yourself.
		toolBuilder pluggableButtonSpec new
			name: #moveUpInLoadOrder;
			model: self;
			label: 'Move up';
			action: #moveUpInLoadOrder;
			enabled: #isAnyArtifactSelected;
			yourself.
		toolBuilder pluggableButtonSpec new
			name: #moveDownInLoadOrder;
			model: self;
			label: 'Move down';
			action: #moveDownInLoadOrder;
			enabled: #isAnyArtifactSelected;
			yourself.
		toolBuilder pluggableButtonSpec new
			name: #removeObject;
			model: self;
			label: 'Remove';
			action: #removeSelectedObject;
			enabled: #isAnyArtifactSelected;
			yourself.
		toolBuilder pluggableButtonSpec new
			name: #refresh;
			model: self;
			label: 'Refresh';
			action: #refreshList;
			yourself}.
	nButtons := buttons size.
	buttons withIndexDo: [:each :index |
		each frame:
			(LayoutFrame
				fractions: ((index - 1) / nButtons @ 1 corner: (index / nButtons) @ 1)
				offsets: (0 @ -25 corner: 0 @ 0))].
	^ toolBuilder build: (toolBuilder pluggableWindowSpec new
		model: self;
		label: #labelString;
		children: {
			toolBuilder pluggableListSpec new
				name: #objectList;
				model: self;
				list: #objectLabels;
				getIndex: #selectedObjectIndex;
				setIndex: #selectedObjectIndex:;
				dragItem: #dragFromObjectList:;
				dropItem: #dropOnObjectList:at:;
				dropAccept: #wantsDropOnObjectList:dragTransferType:source:;
				frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@0 corner: 0@ -25));
				yourself.
			}, buttons)