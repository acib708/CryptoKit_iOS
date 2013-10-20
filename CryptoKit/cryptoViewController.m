//
//  cryptoViewController.m
//  CryptoKit
//
//  Created by Alejandro Cárdenas on 10/19/13.
//  Copyright (c) 2013 Alejandro Cardenas. All rights reserved.
//

#import "cryptoViewController.h"

@interface cryptoViewController ()
//Sockets
@property (weak, nonatomic) NSInputStream*  inputStream;
@property (weak, nonatomic) NSOutputStream* outputStream;

@end

@implementation cryptoViewController
@synthesize inputStream = _inputStream, outputStream = _outputStream;

- (void)viewDidLoad{
    [super viewDidLoad];
    cryptoAppDelegate* appDelegate = (cryptoAppDelegate *)[[UIApplication sharedApplication] delegate];
    _inputStream  = appDelegate.inputStream;
    _outputStream = appDelegate.outputStream;
    
    [self initSocketWithHost:@"localhost" andPort:1993];
    [_inputStream  open];
    [_outputStream open];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Sockets
-(void)initSocketWithHost:(NSString *)hostname andPort:(int)port{
    CFReadStreamRef  readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)(hostname), port, &readStream, &writeStream);
    
    _inputStream  = (__bridge NSInputStream  *)readStream;
    _outputStream = (__bridge NSOutputStream *)writeStream;
    [_inputStream  setDelegate:self];
    [_outputStream setDelegate:self];
    
    [_inputStream  scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark - Testing
- (IBAction)sendMsg:(id)sender {
    NSData *data = [[NSData alloc] initWithData:[@"Hello, SERVER!\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[_outputStream write:[data bytes] maxLength:[data length]];
}

#pragma mark - Segues
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"pushToXor"]){
        cryptoXorViewController* cxvc = (cryptoXorViewController *)segue.destinationViewController;
        cxvc.outputStream = _outputStream;
        cxvc.inputStream  = _inputStream;
    }
    else if([[segue identifier] isEqualToString:@"pushToAes"]){
        cryptoAesViewController* cavc = (cryptoAesViewController *)segue.destinationViewController;
        cavc.outputStream = _outputStream;
        cavc.inputStream  = _inputStream;
    }
}

@end
