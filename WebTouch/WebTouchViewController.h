//
//  WebTouchViewController.h
//  WebTouch
//
//  Created by John Anderson on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebTouchViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
