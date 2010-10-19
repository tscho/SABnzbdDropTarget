//
//  SabNZBDDropTargetAppDelegate.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Tom Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppController.h"
#import "PrefsController.h"

@interface SabNZBDDropTargetAppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet AppController *appController;
	IBOutlet PrefsController *prefsController;
}

@property IBOutlet (assign) AppController *appController;
@property IBOutlet (assign) PrefsController *prefsController;

-(IBAction)quit:(id)sender;

@end
