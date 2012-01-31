//
//  WebTouchViewController.m
//  WebTouch
//
//  Created by John Anderson on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebTouchViewController.h"
#import <CouchCocoa/CouchCocoa.h>
#import <CouchCocoa/CouchTouchDBServer.h>

@implementation WebTouchViewController

@synthesize webView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    CouchTouchDBServer* server = [CouchTouchDBServer sharedInstance];
    if (server.error) {
        NSLog(@"TouchDB fail %@",server.error);
        exit(-1);
    }
    CouchDatabase *database = [server databaseNamed: @"default"];
    NSError* error;
    if (![database ensureCreated: &error]) {
        NSLog(@"TouchDB fail %@",error);
        exit(-1);
    }
    NSLog(@"TouchDB start %@",database.URL);
    
//    NSString *htmlString = @"<body><h1>Hello Touch</h1></body>";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
	NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    
	NSString *htmlString = [[NSString alloc] initWithData: 
                            [readHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
    
    CouchDocument *doc = [database documentWithID:@"hello"];
    RESTOperation* op = [doc putProperties:[NSDictionary dictionaryWithObject: @"bar"
                                                                       forKey: @"foo"]];
    [op wait];
                         
    CouchRevision *rev = doc.currentRevision;
    NSLog(@"make rev %@",rev);

    
    CouchAttachment* attach = [rev createAttachmentWithName:@"index.html" type:@"text/html; charset=utf-8"];
    op = [attach PUT:[htmlString dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"make attachment %@",attach);

    [op wait];
    NSURL *attachURL = attach.unversionedURL;
    
    NSLog(@"attachURL %@",attachURL);

    [self.webView loadRequest:[NSURLRequest requestWithURL:attachURL]];
//    [self.webView loadHTMLString:htmlString baseURL:nil];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
