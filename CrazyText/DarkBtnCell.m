//
//  DarkBtnCell.m
//  CrazyText
//
//  Created by xhan on 4/8/11.
//  Copyright 2011 xu han. All rights reserved.
//

#import "DarkBtnCell.h"


@implementation MaskView

/*
- (void)drawRect:(NSRect)rect {
    [[NSColor grayColor] setFill];
    [NSBezierPath fillRect:[self bounds]];
    
}
*/

@end

@implementation DarkBtnCell

/*
- (void)drawImage:(NSImage *)image withFrame:(NSRect)frame inView:(NSView *)controlView
{
    
}
 
- (NSRect)drawTitle:(NSAttributedString*)title withFrame:(NSRect)frame inView:(NSView*)controlView
{
[super drawTitle:title withFrame:frame inView:controlView];
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{

}
 
*/




- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    NSGraphicsContext *ctx = [NSGraphicsContext currentContext];
    CGFloat roundedRadius = 3.0f;
    
    BOOL outer = YES;
    BOOL background = YES;
    BOOL stroke = YES;
    BOOL innerStroke = YES;
    
    if(outer) {
        [ctx saveGraphicsState];
        NSBezierPath *outerClip = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:roundedRadius yRadius:roundedRadius];
        [outerClip setClip];
        
        NSGradient *outerGradient = [[NSGradient alloc] initWithColorsAndLocations:
                                     [NSColor colorWithDeviceWhite:0.20f alpha:1.0f], 0.0f, 
                                     [NSColor colorWithDeviceWhite:0.21f alpha:1.0f], 1.0f, 
                                     nil];
        
        [outerGradient drawInRect:[outerClip bounds] angle:90.0f];
        [outerGradient release];
        [ctx restoreGraphicsState];
    }
    if(background) {
        [ctx saveGraphicsState];
        NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 2.0f, 2.0f) xRadius:roundedRadius yRadius:roundedRadius];
        [backgroundPath setClip];
        
        NSGradient *backgroundGradient = [[NSGradient alloc] initWithColorsAndLocations:
                                          [NSColor colorWithDeviceWhite:0.17f +0.1 alpha:1.0f], 0.0f, 
                                          [NSColor colorWithDeviceWhite:0.20f +0.1 alpha:1.0f], 0.12f, 
                                          [NSColor colorWithDeviceWhite:0.27f +0.1 alpha:1.0f], 0.5f, 
                                          [NSColor colorWithDeviceWhite:0.30f +0.1 alpha:1.0f], 0.5f, 
                                          [NSColor colorWithDeviceWhite:0.42f +0.1 alpha:1.0f], 0.98f, 
                                          [NSColor colorWithDeviceWhite:0.50f +0.1 alpha:1.0f], 1.0f, 
                                          nil];
        
        [backgroundGradient drawInRect:[backgroundPath bounds] angle:270.0f];
        [backgroundGradient release];
        [ctx restoreGraphicsState];
    }
    if(stroke) {
        [ctx saveGraphicsState];
        [[NSColor colorWithDeviceWhite:0.12f +0.1 alpha:1.0f] setStroke];
        [[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1.5f, 1.5f) xRadius:roundedRadius yRadius:roundedRadius] stroke];
        [ctx restoreGraphicsState];
    }
    
    if(innerStroke) {
        [ctx saveGraphicsState];
        [[NSColor colorWithDeviceWhite:1.0f +0.1 alpha:0.05f] setStroke];
        [[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 2.5f, 2.5f) xRadius:roundedRadius yRadius:roundedRadius] stroke];
        [ctx restoreGraphicsState];        
    }
    
    if([self isHighlighted]) {
        [ctx saveGraphicsState];
        [[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 2.0f, 2.0f) xRadius:roundedRadius yRadius:roundedRadius] setClip];
        [[NSColor colorWithCalibratedWhite:0.0f alpha:0.35] setFill];
        NSRectFillUsingOperation(frame, NSCompositeSourceOver);
        [ctx restoreGraphicsState];
    }
}




@end
