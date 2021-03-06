//
//  RESTManager.m
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import "RESTManager.h"

#define TESTING_URL @"http://jemiza.herokuapp.com/admin/"
#define SERVER_URL @"http://jemiza.herokuapp.com/admin/"
#define CATALOG_URL @"http://aroma-bakery-cafe.herokuapp.com/admin/foods.json"

@implementation RESTManager

+(void)sendData:(NSMutableDictionary *)data toService:(NSString *)service withMethod:(NSString *)method isTesting:(BOOL)testing withAccessToken:(NSString *)accessToken toCallBack:(void (^)(id))callback
{
    NSURL *url = nil;
    NSMutableURLRequest *request;
    if(![method isEqual: @"GET"])
    {
        if(testing)
            url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",TESTING_URL, service]];
        else
            url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", SERVER_URL, service]];
    }
    else
    {
        if(testing)
            url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@.json", TESTING_URL, service]];
        else
            url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@.json?access_token=%@", SERVER_URL, service, accessToken]];
    }
    
    request = [NSMutableURLRequest requestWithURL:url];
    if(accessToken)
    {
        [data setObject:accessToken forKey:@"access_token"];
    }
    if(data)
    {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:kNilOptions error:nil];
        
        NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
        NSLog(@"json string: %@", JSONString);
        [request setValue:[NSString stringWithFormat:@"%ld", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:jsonData];
    }
    
    NSLog(@"eeee: %@", request);
    
    [request setHTTPMethod:method];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"json" forHTTPHeaderField:@"Data-Type"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 204)
        {
            callback(@{@"success": @YES});
        }
        else if(!error && response != nil)
        {
            NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            callback(responseJson);
        }
        else
        {
            callback(nil);
        }
    }];
}

+(void)getProducts:(NSString*) products toCallBack:(void (^)(id))callback
{
    NSLog(@"getProducts %@", CATALOG_URL);
    NSURL *url = [NSURL URLWithString:CATALOG_URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"json" forHTTPHeaderField:@"Data-Type"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 204)
        {
            callback(@{@"success": @YES});
        }
        else if(!error && response != nil)
        {
            NSDictionary *responseJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"E_E %@", responseJson);
            callback(responseJson);
        }
        else
        {
            callback(nil);
        }
    }];
}

//+(void)getProductsRefactored:(NSString*) products toCallBack:(void (^)(id))callback
//{
//    [self getUrlCall:products toCallBack:callback withUrl:CATALOG_URL];
//}
//
//+(void)getUrlCall:(NSString*) products toCallBack:(void (^)(id))callback withUrl:callUrl
//{
//    NSURL *url = [NSURL URLWithString:callUrl];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"GET"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"json" forHTTPHeaderField:@"Data-Type"];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//        if(httpResponse.statusCode == 204){
//            callback(@{@"sucess": @YES});
//        }
//        else if(!error && response != nil)
//        {
//            NSDictionary *responseJSon = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            callback(responseJSon);
//        }
//        else
//        {
//            callback(nil);
//        }
//    }];
//}
@end
