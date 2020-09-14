//
//  OpenUDID.h
//  LXF_MapGuideDemo
//
//  Created by developer on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// Usage:
//    #include "LXF_OpenUDID.h"
//    NSString* openUDID = [LXF_OpenUDID value];
//

#define kOpenUDIDErrorNone          0
#define kOpenUDIDErrorOptedOut      1
#define kOpenUDIDErrorCompromised   2



@interface LXF_OpenUDID : NSObject 

+ (NSString*) value;
+ (NSString*) valueWithError:(NSError**)error;
+ (void) setOptOut:(BOOL)optOutValue;


///接口前缀
extern NSString *  url;
extern NSString *  format;


extern NSString *  login;
extern NSString *  loginOut;
extern NSString *  pwRest;
extern NSString *  sendEmil;
extern NSString *  researchList;
extern NSString *  getResearchInfo;
extern NSString *  syncData;
extern NSString *  assistanceResearch;
extern NSString *  endResearch;








@end


