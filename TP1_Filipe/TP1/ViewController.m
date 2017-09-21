//
//  ViewController.m
//  TP1
//
//  Created by Arker, Filipe on 17-09-14.
//  Copyright © 2017 Arker, Filipe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *PeriodText;
@property (weak, nonatomic) IBOutlet UITableView *ScoreBoard;
@property int periodCounter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _periodCounter = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)AddPeriod:(UIButton *)sender {
    if(_periodCounter < 3){
        _periodCounter++;
        _PeriodText.text = [NSString stringWithFormat:@"Period: %d", _periodCounter];
    }
    else{
        //alert game ended
    }
}

@end
