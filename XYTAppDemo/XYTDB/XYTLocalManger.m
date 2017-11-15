//
//  XYTLocalManger.m
//  XYTNetworkingDemo
//
//  Created by iOS-Dev on 2017/11/15.
//  Copyright © 2017年 Administrator. All rights reserved.
//

#import "XYTLocalManger.h"
#import <FMDB.h>

@implementation XYTLocalManger
{
    NSString *dbPath;
}

static NSString *CREATE_TABLE_XYT = @"create table if not exists xyt_table (name varchar(100),age integer)";

+(XYTLocalManger*)manger {
    static  XYTLocalManger *manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[XYTLocalManger alloc] init];
    });
    return manger;
}

-(id)init {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [doc stringByAppendingPathComponent:@"XYTDB.sqlite"];
    [self initTable];
    
    return self;
}

-(void) initTable{
    [self createTableWithSql:CREATE_TABLE_XYT];
}

-(void)createTableWithSql:(NSString *)sql {
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        BOOL res = [db executeUpdate:sql];
        if (!res)
        {
            NSLog(@"error when creating db table");
        }
        else
        {
            NSLog(@"sucesse to creating db table");
        }
        
        [db close];
        
    }
    else
    {
        NSLog(@"error when open db");
        
    }
    
}
-(BOOL)saveImformation:(NSArray *)array {
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        [db beginTransaction];
        [db executeUpdate:@"delete from xyt_table;"];
        
        for (NSDictionary* dic in array)
        {
            NSString* sql = @"";
            sql = [NSString stringWithFormat:@"insert into xyt_table (name,age) values ('%@',%d);",[dic objectForKey:@"name"],[[dic objectForKey:@"age"] intValue]];
            [db executeUpdate:sql];
        }
        [db commit];
        [db close];
        return YES;
    }
    
    return NO;
    
}
-(NSMutableArray *)getImformation {
    NSMutableArray* result = [[NSMutableArray alloc]init];
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        NSString * sql = @"select * from xyt_table";
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next])
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            [dic setValue:[rs stringForColumn:@"name"] forKey:@"name"];
            [dic setValue:[rs stringForColumn:@"age"] forKey:@"age"];
            
            [result addObject:dic];
        }
        [rs close];
        [db close];
        return result;
        
    }
    else
    {
        NSLog(@"error when query inspection type.");
        
    }
    return nil;
    
}

-(BOOL)deleteTable {
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    if ([db open])
    {
        [db beginTransaction];
        [db executeUpdate:@"delete from xyt_table;"];
        
        
        [db commit];
        [db close];
        return YES;
    }
    
    return NO;
    
}


@end

