//
//  XYTHttpRequest.m
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/13.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import "XYTHttpRequest.h"
#import <AFNetworking.h>


@implementation XYTHttpRequest

//
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

+(void)get:(NSString*)url params:(NSDictionary*)parama success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failue {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr GET:url parameters:parama progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failue){
            
            failue(error);
        }
    }];
    
}

- (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = self.manager;
    // 2.申明返回的结果是text/html类型
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 3.设置超时时间为10s
    mgr.requestSerializer.timeoutInterval = 10;
    
    // 4.发送POST请求
    
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
