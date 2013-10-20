//
//  cryptoAesViewController.h
//  CryptoKit
//
//  Created by Alejandro Cárdenas on 10/19/13.
//  Copyright (c) 2013 Alejandro Cardenas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cryptoAesViewController : UIViewController <UITextFieldDelegate>
//Sockets
@property (weak, nonatomic) NSInputStream*  inputStream;
@property (weak, nonatomic) NSOutputStream* outputStream;

@end
