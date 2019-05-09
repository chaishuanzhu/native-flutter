/*
 * The MIT License (MIT)
 * 
 * Copyright (c) 2019 Alibaba Group
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

 //Generated by AIOCodeGen.
 
 #import "ServiceGateway.h"
 #import "NavigationService_onFlutterPageResult.h"
#import "FlutterBoost.h"
 
 @implementation NavigationService_onFlutterPageResult
 
 - (void)onCall:(void (^)(BOOL))result uniqueId:(NSString *)uniqueId key:(NSString *)key resultData:(NSDictionary *)resultData params:(NSDictionary *)params 
 {
    //Add your handler code here!
     [FlutterBoostPlugin.sharedInstance onResultForKey:key
                                            resultData:resultData];
 }
 
 #pragma mark - Do not edit these method.
 - (void)__flutter_p_handler_onFlutterPageResult:(NSDictionary *)args result:(void (^)(BOOL))result {
     [self onCall:result uniqueId:args[@"uniqueId"] key:args[@"key"] resultData:args[@"resultData"] params:args[@"params"]];
 }
 + (void)load{
     [[ServiceGateway sharedInstance] registerHandler:[NavigationService_onFlutterPageResult new]];
 }
 - (NSString *)returnType
 {
   return @"BOOL";
 }
 - (NSString *)service
 {
   return @"NavigationService";
 }
 
 @end
