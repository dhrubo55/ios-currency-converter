//
//  main.m
//  Currency_converter
//
//  Created by mac-lab on 9/8/18.
//  Copyright © 2018 Dhrubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
        
        NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/"];
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *postParams = @"/todos/1";
        NSData *postData = [postParams dataUsingEncoding:NSUTF8StringEncoding];
        
        [urlRequest setHTTPMethod:@"GET"];
        [urlRequest setHTTPBody:postData];
        
        __block BOOL done = NO;
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSLog(@"Response: %@",response);
            NSLog(@"Data: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            //NSLog(@"Request body %@", [[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding]);
            NSLog(@"Error: %@",error);
            done = YES;
        }];
        [dataTask resume];
        
        while (!done) {
            NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0.1];
            [[NSRunLoop currentRunLoop] runUntilDate:date];
        }
    }
    return 0;
}

