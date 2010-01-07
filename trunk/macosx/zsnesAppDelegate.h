//
//  zsnesAppDelegate.h
//  zsnes
//
//  Created by Daniel Potter on 12/27/09.
//

#import <Cocoa/Cocoa.h>

@interface zsnesAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	BOOL haveLaunched;
}

- (id) init;

@property (assign) IBOutlet NSWindow *window;

- (IBAction) showAboutWindow:(id)sender;

@end
