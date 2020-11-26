/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#import "CDVInAppBrowserGlogin.h"
#import "CDVInAppBrowserGloginOptions.h"
#if !WK_WEB_VIEW_ONLY
#import "CDVUIInAppGloginBrowser.h"
#endif
#import "CDVWKInAppGloginBrowser.h"
#import <Cordova/CDVPluginResult.h>


#pragma mark CDVInAppBrowserGlogin

@implementation CDVInAppBrowserGlogin

- (void)pluginInitialize
{
    // default values
    self.usewkwebview = NO;

#if __has_include("CDVWKWebViewEngine.h")
    self.wkwebviewavailable = YES;
#else
    self.wkwebviewavailable = NO;
#endif
}

- (void)open:(CDVInvokedUrlCommand*)command
{
    NSString* options = [command argumentAtIndex:2 withDefault:@"" andClass:[NSString class]];
    CDVInAppBrowserGloginOptions* browserOptions = [CDVInAppBrowserGloginOptions parseOptions:options];
    if(browserOptions.usewkwebview && !self.wkwebviewavailable){
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:@{@"type":@"loaderror", @"message": @"usewkwebview option specified but but no plugin that supplies a WKWebView engine is present"}] callbackId:command.callbackId];
        return;
    }
    self.usewkwebview = browserOptions.usewkwebview;
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] open:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] open:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] open:command];
      }
    #endif
}

- (void)close:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] close:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] close:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] close:command];
      }
    #endif
}


- (void)show:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] show:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] show:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] show:command];
      }
    #endif
}

- (void)hide:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] hide:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] hide:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] hide:command];
      }
    #endif
}


- (void)injectScriptCode:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] injectScriptCode:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] injectScriptCode:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] injectScriptCode:command];
      }
    #endif
}

- (void)injectScriptFile:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] injectScriptFile:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] injectScriptFile:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] injectScriptFile:command];
      }
    #endif
}

- (void)injectStyleCode:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] injectStyleCode:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] injectStyleCode:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] injectStyleCode:command];
      }
    #endif
}

- (void)injectStyleFile:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] injectStyleFile:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] injectStyleFile:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] injectStyleFile:command];
      }
    #endif
}

- (void)loadAfterBeforeload:(CDVInvokedUrlCommand*)command
{
    #if WK_WEB_VIEW_ONLY
      [[CDVWKInAppGloginBrowser getInstance] loadAfterBeforeload:command];
    #else
      if(self.usewkwebview){
          [[CDVWKInAppGloginBrowser getInstance] loadAfterBeforeload:command];
      }else{
          [[CDVUIInAppGloginBrowser getInstance] loadAfterBeforeload:command];
      }
    #endif
}


@end