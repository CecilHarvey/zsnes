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
	NSWindow* window = [self window];
	NSLog(@"Title: %@", [window title]);
	// And now generate the links
	[linkTextView setEditable:NO];
	[linkTextView setDrawsBackground:NO];
	NSAttributedString* links =
	[[NSAttributedString alloc] initWithRTF: [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"AboutLinks" withExtension:@"rtf"]]
						 documentAttributes: nil];
	[[linkTextView textStorage] appendAttributedString: links];
	[links release];
	[window center];
}

@end

@implementation ZAboutWindow

- (void) awakeFromNib {
	NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	[self setTitle:
	 [[self title] stringByReplacingOccurrencesOfString:@"$(version)" withString:version]];
}

- (void)keyDown:(NSEvent *)event {
	NSLog(@"Event");
	if ([event modifierFlags] & (NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask) == 0) {
		if ([[event characters] caseInsensitiveCompare:@"E"] == NSOrderedSame) {
			NSLog(@"Toggle easter egg.");
		}
	}
}

- (BOOL)canBecomeKeyWindow {
	return YES;
}

@end