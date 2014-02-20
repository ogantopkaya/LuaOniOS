//
//  NSString+Paths.m
//  LuaOniOS
//
//  Created by Ogan Topkaya on 20/02/14.
//  Copyright (c) 2014 Peak Games. All rights reserved.
//

#import "NSString+Paths.h"

@implementation NSString (Paths)

+ (NSString *) applicationDocumentsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

@end
