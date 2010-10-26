//
//  SabNZBDDropTargetAppDelegate.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Tom Schoendorfer. All rights reserved.
//

#import "SabNZBDDropTargetAppDelegate.h"
#import "DropView.h"

@implementation SabNZBDDropTargetAppDelegate

@synthesize appController;
@synthesize prefsController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[appController setupStatusItem];
}

-(IBAction)quit:(id)sender {
	exit(0);
}

-(IBAction)showPrefs:(id)sender {
	[[self getPrefsController] showWindow:self];
}

- (PrefsController *)getPrefsController {
	if (!prefsController) {
		prefsController = [[PrefsController alloc] initWithWindowNibName:@"Prefs"];
		NSLog(@"prefsController: %d", [prefsController retainCount]);
		NSLog(@"Loaded prefs nib");
	}
	return prefsController;
}


@end
