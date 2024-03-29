
/*
 Copyright 2011 Ahmet Ardal
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

//
//  SSCheckBoxView.m
//  SSCheckBoxView
//
//  Created by Ahmet Ardal on 12/6/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#import "SSCheckBoxView.h"
#import "UIHelpers.h"
#import "ARCMacro.h"

static const CGFloat kHeight = 36.0f;

@interface SSCheckBoxView(Private)
- (UIImage *) checkBoxImageForStyle:(SSCheckBoxViewStyle)s
                            checked:(BOOL)isChecked;
- (CGRect) imageViewFrameForCheckBoxImage:(UIImage *)img;
- (void) updateCheckBoxImage;
@end

@implementation SSCheckBoxView

@synthesize style, checked, enabled, textLabel;
@synthesize stateChangedBlock;

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (id) initWithFrame:(CGRect)frame
               style:(SSCheckBoxViewStyle)aStyle
             checked:(BOOL)aChecked
{
    frame.size.height = kHeight;
    if (!(self = [super initWithFrame:frame])) {
        return self;
    }

    stateChangedSelector = nil;
    self.stateChangedBlock = nil;
    delegate = nil;
    style = aStyle;
    checked = aChecked;
    self.enabled = YES;

    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];

    CGRect labelFrame = CGRectMake(40.0f, 7.0f, self.frame.size.width - 32, 30.0f);
    UILabel *l = [[UILabel alloc] initWithFrame:labelFrame];
    l.textAlignment = UITextAlignmentLeft;
    l.backgroundColor = [UIColor clearColor];
    l.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
   l.textColor = RgbHex2UIColor(0x82, 0x82, 0x82);
    //l.textColor = RgbHex2UIColor(0x2E, 0x2E, 0x2E);
    l.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    l.shadowColor = [UIColor whiteColor];
    l.shadowOffset = CGSizeMake(0, 1);
    [self addSubview:l];
    self.textLabel = l;
    [l RELEASE];

    UIImage *img = [self checkBoxImageForStyle:style checked:checked];
    CGRect imageViewFrame = [self imageViewFrameForCheckBoxImage:img];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:imageViewFrame];
    iv.image = img;
    [self addSubview:iv];
    checkBoxImageView = iv;

    return self;
}

- (void) dealloc
{
    [self.stateChangedBlock RELEASE];
    [checkBoxImageView RELEASE];
    [textLabel RELEASE];
    [super DEALLOC];
}

- (void) setEnabled:(BOOL)isEnabled
{
    textLabel.enabled = isEnabled;
    enabled = isEnabled;
    checkBoxImageView.alpha = isEnabled ? 1.0f: 1.0f;
    textLabel.alpha= isEnabled ? 1.0f: 1.0f;
    //[checkBoxImageView setBackgroundColor:UIColorFromRGB(0xd8d8d8)];
}

- (BOOL) enabled
{
    return enabled;
}

- (void) setText:(NSString *)text
{
    [textLabel setText:text];
}

- (void) setChecked:(BOOL)isChecked
{
    checked = isChecked;
    [self updateCheckBoxImage];
}

- (void) setStateChangedTarget:(id<NSObject>)target
                      selector:(SEL)selector
{
    delegate = target;
    stateChangedSelector = selector;
}


#pragma mark - Touch-related Methods

- (void) touchesBegan:(NSSet *)touches
            withEvent:(UIEvent *)event
{
    if (!enabled) {
        return;
    }

    self.alpha = 0.8f;
    [super touchesBegan:touches withEvent:event];
}

- (void) touchesCancelled:(NSSet *)touches
                withEvent:(UIEvent *)event
{
    if (!enabled) {
        return;
    }

    self.alpha = 1.0f;
    [super touchesCancelled:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches
            withEvent:(UIEvent *)event
{
    if (!enabled) {
        return;
    }

    // restore alpha
    self.alpha = 1.0f;

    // check touch up inside
    if ([self superview]) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:[self superview]];
        CGRect validTouchArea = CGRectMake((self.frame.origin.x - 5),
                                           (self.frame.origin.y - 10),
                                           (self.frame.size.width + 5),
                                           (self.frame.size.height + 10));
        if (CGRectContainsPoint(validTouchArea, point)) {
            checked = !checked;
            [self updateCheckBoxImage];
            if (delegate && stateChangedSelector) {
                [delegate performSelector:stateChangedSelector withObject:self];
            }
            else if (stateChangedBlock) {
                stateChangedBlock(self);
            }
        }
    }

    [super touchesEnded:touches withEvent:event];
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}


#pragma mark - Private Methods

- (UIImage *) checkBoxImageForStyle:(SSCheckBoxViewStyle)s
                            checked:(BOOL)isChecked
{
    NSString *suffix = isChecked ? @"on" : @"off";
    NSString *imageName = @"";
    switch (s) {
        case kSSCheckBoxViewStyleBox:
            imageName = @"cb_box_";
            break;
        case kSSCheckBoxViewStyleDark:
            imageName = @"cb_dark_";
            break;
        case kSSCheckBoxViewStyleGlossy:
            imageName = @"cb_glossy_";
            break;
        case kSSCheckBoxViewStyleGreen:
            imageName = @"cb_green_";
            break;
        case kSSCheckBoxViewStyleMono:
            imageName = @"1_";
            break;
        default:
            return nil;
    }
    imageName = [NSString stringWithFormat:@"%@%@", imageName, suffix];
    return [UIImage imageNamed:imageName];
}

- (CGRect) imageViewFrameForCheckBoxImage:(UIImage *)img
{
    CGFloat y = floorf((kHeight - img.size.height) / 2.0f);
    return CGRectMake(20.0f, y+10, img.size.width-10, img.size.height-10);
}

- (void) updateCheckBoxImage
{
    checkBoxImageView.image = [self checkBoxImageForStyle:style
                                                  checked:checked];
}

@end
