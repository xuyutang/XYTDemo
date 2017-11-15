//
//  XYTHttpRequest.h
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/13.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface XYTHttpRequest : NSObject

@property (nonatomic,strong) AFHTTPSessionManager * manager;
//get请求
+(void)get:(NSString*)url params:(NSDictionary*)parama success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failue;


- (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end

