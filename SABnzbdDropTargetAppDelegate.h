//
//  SABnzbdDropTargetAppDelegate.h
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppController.h"
#import "PrefsController.h"

@interface SABnzbdDropTargetAppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet AppController *appController;
	PrefsController *prefsController;
}

@property (assign) IBOutlet AppController *appController;
@property (retain) PrefsController *prefsController;

-(IBAction)quit:(id)sender;
-(IBAction)showPrefs:(id)sender;

@end
