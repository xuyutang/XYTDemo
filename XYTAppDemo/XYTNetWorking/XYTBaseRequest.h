//
//  XYTBaseRequest.h
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/13.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTBaseRequest : NSObject

+(XYTBaseRequest*)shareRequest;

- (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end

