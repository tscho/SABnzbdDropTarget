//
//  SabNZBD.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SabNZBD : NSObject {
	NSURL *host;
	NSString *apiKey;
	
	@private
	NSMutableData *received;
}

@property (retain) NSURL *host;
@property (retain) NSString *apiKey;

- (id)initWithConnectionDetails:(NSURL *)host apiKey:(NSString *)apiKey;
- (BOOL)addNzb:(NSURL *)url;

@end
