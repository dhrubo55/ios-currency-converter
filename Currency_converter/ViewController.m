//
//  ViewController.m
//  Currency_converter
//
//  Created by mac-lab on 9/8/18.
//  Copyright © 2018 Dhrubo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)showCurrency{
    NSString *taka_value = _display.text;
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    //US currency block
    NSNumber *us_currency_number = [f numberFromString:taka_value];
    double taka = [us_currency_number doubleValue];
    double us = taka;
    us = us*0.012;
    NSLog(@"%f",us);
    _us_currency_show.text = [NSString stringWithFormat:@"%.2f $",us];
    
    //china block
    double china = taka;
    china = china*0.082;
    _china_currency_show.text = [NSString stringWithFormat:@"%.2f renimbi",china];
    
    //russia block
    double russia = taka;
    russia = russia*0.83;
    _russia_currency_show.text = [NSString stringWithFormat:@"%.2f rubel",russia];
    
    //india blcok
    double india = taka;
    NSLog(@"%f",india);
    india = india*0.86;
    _india_currency_show.text = [NSString stringWithFormat:@"%.2f rupee",india];
}



@end
