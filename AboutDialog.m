//
//  AboutDialog.m
//  zsnes
//
//  Created by Daniel Potter on 12/31/09.
//

#import "AboutDialog.h"


@implementation AboutDialog

-(id) init {
	self = [super initWithWindowNibName:@"About"];
	if (self) {
	}
	return self;
}

-(void) windowDidLoad {
	// Grab the version
	NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	[versionLabel setStringValue:
	 [[versionLabel stringValue] stringByReplacingOccurrencesOfString:@"$(version)" withString:version]];
}

@end
