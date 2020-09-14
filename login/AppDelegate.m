//
//  AppDelegate.m
//  login
//
//  Created by 茶茶漾 on 16/6/29.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
#import "Application ViewController.h"
#import "AFNetworking.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // Override point for customization after application launch.
   // self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
  
    

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //
//    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"isFirst"]) {
//        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"isFirst"];
//        id view = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//        self.window.rootViewController = view;
//    }
//    else{
//        id view = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//        self.window.rootViewController = view;
//        
//    }
    //Required
    
//     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user removeObjectForKey:@"diaoyan"];
    
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    //Required
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
//    [JPUSHService setupWithOption:launchOptions appKey:@"b5c72b709e38d0dff957268a"
//                          channel:@"Publish channel"
//                 apsForProduction:0
//            advertisingIdentifier:nil];
//    [JPUSHService setTags:[NSSet setWithObject:@"tag"] alias:@"tag" callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:(self)];
    
    
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        //第一次启动
//        
//        NSLog(@"第一次启动");
//    }else{
//        //不是第一次启动了
//          NSLog(@"不是第一次启动");
//    }
    
    
    
    [self checkvision];

    return YES;
}
-(void) checkvision{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
   
    
    
    [sessionManager GET:@"https://paqcabg.chinacloudsites.cn/BD/getvison.php" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lld", downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        NSLog(@"%@",responseObject );
        
        
        NSUserDefaults*version=[NSUserDefaults standardUserDefaults];
        

        [version setObject:[responseObject objectForKey:@"version"] forKey:@"version"];
        [version synchronize];
        
        
        if (![[responseObject objectForKey:@"version"]isEqualToString:@"20200601.1"]) {
            
            _plistName=[responseObject objectForKey:@"plistname"];
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"更新只需1分钟。强烈建议您立即进行更新，如不更新将影响相关功能使用。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
            alertView.tag=1;
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    


}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag==1) {
        if (buttonIndex==0) {
            NSString *urlString = [NSString stringWithFormat:@"itms-services://?action=download-manifest&url=https://b.webbsn.com/download/app/%@", _plistName];
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            NSLog(@"%@",url);
            
            
            [[UIApplication sharedApplication] openURL:url];
            
        }
    }
    
}
- (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet *)tags
                    alias:(NSString *)alias {
    NSString *callbackString =
    [NSString stringWithFormat:@"%d, \ntags: %@, \nalias: %@\n", iResCode,
     [self logSet:[NSSet setWithObject:@"tag"]], alias];
    //    if ([_callBackTextView.text isEqualToString:@"服务器返回结果"]) {
    //        _callBackTextView.text = callbackString;
    //    } else {
    //        _callBackTextView.text = [NSString
    //                                  stringWithFormat:@"%@\n%@", callbackString, _callBackTextView.text];
    //    }
    NSLog(@"TagsAlias回调:%@", callbackString);
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logSet:(NSSet *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    
    return str;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    
    [application cancelAllLocalNotifications];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}



- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required -    DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    
    
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:
(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    
    
    
    
    
    
    [JPUSHService handleRemoteNotification:userInfo];
    application.applicationIconBadgeNumber = 0;
    NSLog(@"尼玛的推送消息呢===%@",userInfo);
    
    
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // IOS 7 Support Required
    [JPUSHService handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
    
}



- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
@end
