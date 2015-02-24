//
//  RESTManager.h
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESTManager : NSObject
+(void)sendData:(NSMutableDictionary *)data toService:(NSString *)service withMethod:(NSString *)method isTesting:(BOOL)testing withAccessToken:(NSString *)accessToken toCallBack:(void (^)(id))callback;
@end
