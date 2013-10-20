//
//  cryptoAesViewController.m
//  CryptoKit
//
//  Created by Alejandro Cárdenas on 10/19/13.
//  Copyright (c) 2013 Alejandro Cardenas. All rights reserved.
//

#import "cryptoAesViewController.h"

@interface cryptoAesViewController ()
//UI
@property (weak, nonatomic) IBOutlet UITextField *tf1;          //TextField of string to act on
@property (weak, nonatomic) IBOutlet UISegmentedControl *sBits; //AES type
@property (weak, nonatomic) IBOutlet UIButton *bEncrypt;        //Ecrypt Button
@property (weak, nonatomic) IBOutlet UIButton *bDecrypt;        //Decrypt Button

@property (nonatomic) int aesType;

@end

@implementation cryptoAesViewController
@synthesize tf1 = _tf1, sBits = _sBits, bEncrypt = _bEncrypt, bDecrypt = _bDecrypt;
@synthesize aesType = _aesType;
@synthesize inputStream = _inputStream, outputStream = _outputStream;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_sBits addTarget:self
               action:@selector(segmentedControlDidChangeState)
     forControlEvents:UIControlEventValueChanged];
    
    //Set type to 256-bit AES by default
    [_sBits setSelectedSegmentIndex:1];
    _aesType = 1;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segmented Control
- (void)segmentedControlDidChangeState{
    _aesType = _sBits.selectedSegmentIndex;
}

#pragma mark - TextField Delegate Implementation
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
