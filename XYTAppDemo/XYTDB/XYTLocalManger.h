//
//  XYTLocalManger.h
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/15.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTLocalManger : NSObject

+(XYTLocalManger*)manger;

-(BOOL)saveImformation:(NSArray *)array;
-(NSMutableArray *)getImformation;
-(BOOL)deleteTable;
@end

