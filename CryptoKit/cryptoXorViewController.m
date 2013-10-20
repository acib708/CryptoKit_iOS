//
//  cryptoXorViewController.m
//  CryptoKit
//
//  Created by Alejandro Cárdenas on 10/19/13.
//  Copyright (c) 2013 Alejandro Cardenas. All rights reserved.
//

#import "cryptoXorViewController.h"

@interface cryptoXorViewController ()
//UI
@property (weak, nonatomic) IBOutlet UITextField *tf1; //Top TextField
@property (weak, nonatomic) IBOutlet UITextField *tf2; //Bottom TextField
@property (weak, nonatomic) IBOutlet UIButton *bXor;   //XOR Button

@end

@implementation cryptoXorViewController
@synthesize tf1 = _tf1, tf2 = _tf2, bXor = _bXor, outputStream = _outputStream, inputStream = _inputStream;

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate Implementation
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Button Pressed
- (IBAction)xor:(id)sender {
    NSString *toServer = [NSString stringWithFormat:@"xor_%@_%@\n", _tf1.text, _tf2.text];
    NSData   *data     = [[NSData alloc] initWithData:[toServer dataUsingEncoding:NSUTF8StringEncoding]];
	[_outputStream write:[data bytes] maxLength:[data length]];
}


@end
