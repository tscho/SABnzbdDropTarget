//
//  SABnzbdClient.h
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SABnzbdClient : NSObject {
	NSURL *host;
	NSString *apiKey;
}

@property (retain) NSURL *host;
@property (retain) NSString *apiKey;

- (id)initWithConnectionDetails:(NSURL *)withHost withApiKey:(NSString *)withApiKey;
- (BOOL)addNzb:(NSURL *)url;

@end
