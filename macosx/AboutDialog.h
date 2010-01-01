//
//  AboutDialog.h
//  zsnes
//
//  Created by Daniel Potter on 12/31/09.
//

#import <Cocoa/Cocoa.h>


@interface AboutDialog : NSWindowController {
	IBOutlet NSTextField* versionLabel;
	IBOutlet NSTextView* linkTextView;
}

-(id) init;
-(void) windowDidLoad;

@end

@interface ZAboutWindow : NSWindow {
	IBOutlet NSView* normalView;
	IBOutlet NSView* eeggView;
	BOOL eegg;
}

- (void)keyDown:(NSEvent *)event;

@end

