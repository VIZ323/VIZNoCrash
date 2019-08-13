//
//  VIZViewController.m
//  VIZNoCrash
//
//  Created by VIZ323 on 08/13/2019.
//  Copyright (c) 2019 VIZ323. All rights reserved.
//

#import "VIZViewController.h"
#import "VIZNoCrash.h"

@interface VIZViewController ()

@end

@implementation VIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)testAttribute{
    
    NSAttributedString *str = [[NSAttributedString alloc] init];
    [str attributedSubstringFromRange:NSMakeRange(100, 100)];
}

- (void)testMutableAttribute{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] init];
    [str attributedSubstringFromRange:NSMakeRange(100, 100)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self testAttribute];
    
    [self testMutableAttribute];
    
    NSString *str = [UIImage new];
    [str intValue];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
