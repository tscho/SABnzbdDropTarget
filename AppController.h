//
//  AppController.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropView.h"


@interface AppController : NSObject <DropDelegate> {
	IBOutlet DropView *dropView;
	NSStatusItem *statusItem;
	IBOutlet NSMenu *statusMenu;
}

@property (retain) NSStatusItem *statusItem;
@property IBOutlet (assign) NSMenu *statusMenu;
@property IBOutlet (assign) DropView *dropView;

- (void) setupStatusItem;

@end
