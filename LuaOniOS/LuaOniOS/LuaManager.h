//
//  LuaManager.h
//  LuaTest
//
//  Created by Ogan Topkaya on 17/02/14.
//  Copyright (c) 2014 Peak Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <lua.h>
#import <lualib.h>
#import <lauxlib.h>
#import "RootViewController.h"

@interface LuaManager : NSObject

+ (instancetype)defaultManager;
- (void)runCodeFromString:(NSString *)code;


// Test functions
- (NSInteger)calculate:(NSInteger)number;
- (BOOL)isAllowedToExecute:(NSString *)string;

- (NSInteger)consolePosition;
- (void)updateConsole:(RootViewController *)vc;

- (void *)performFuntionOnLuaFile:(NSString *)file function:(NSString *)function withObjects:(void *)obj,... NS_REQUIRES_NIL_TERMINATION;

- (void)registerFunction:(lua_CFunction)function withName:(NSString *)name;
- (void)callFunctionNamed:(NSString *)name withObject:(NSObject *)object;

@end
