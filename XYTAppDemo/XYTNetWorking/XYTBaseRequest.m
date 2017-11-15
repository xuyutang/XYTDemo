//
//  XYTBaseRequest.m
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/13.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import "XYTBaseRequest.h"
#import "XYTHttpRequest.h"
#import <MJExtension.h>



@implementation XYTBaseRequest

+(XYTBaseRequest*)shareRequest {
    static XYTBaseRequest *shareRequest = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareRequest = [[XYTBaseRequest alloc] init];
    });
    return shareRequest ;
}

- (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSDictionary *params = [param mj_keyValues];
    [XYTHttpRequest get:url params:params success:^(id responseObj) {
        if(success){
            NSLog(@"%@",responseObj);
            
            id result = [resultClass mj_objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        failure(error);
        
    }];
}
@end

