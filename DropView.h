//
//  DropView.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropDelegate.h"

#define StatusItemViewPaddingWidth  6
#define StatusItemViewPaddingHeight 3

@interface DropView : NSView <NSMenuDelegate> {
	NSStatusItem *statusItem;
	NSImage *icon;
	BOOL isMenuVisible;
	id <DropDelegate> dropHandler;
}

@property (retain, nonatomic) NSStatusItem *statusItem;
@property (retain, nonatomic) NSImage *icon;
@property (assign) id <DropDelegate> dropHandler;

@end
