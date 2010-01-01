//
//  AboutDialog.h
//  zsnes
//
//  Created by Daniel Potter on 12/31/09.
//  Copyright 2009 MITRE. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AboutDialog : NSWindowController {
	IBOutlet NSTextField* versionLabel;
}

-(id) init;
-(void) windowDidLoad;

@end
