//
//  ViewController.m
//  TP1
//
//  Created by Michaud, Julien on 17-09-21.
//  Copyright © 2017 Michaud, Julien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameTeam1;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameTeam2;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT1M1;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT1M2;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT1M3;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT1M4;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT1M5;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT2M1;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT2M2;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT2M3;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT2M4;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NameT2M5;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT1M1;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT1M2;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT1M3;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT1M4;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT1M5;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT2M1;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT2M2;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT2M3;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT2M4;
@property (weak, nonatomic) IBOutlet UITextField *TextField_NoT2M5;

- (IBAction)ResetAllFields:(UIButton *)sender;
- (IBAction)AcceptAndStartGame:(UIButton *)sender;

@property NSString *team1Name;
@property NSString *team2Name;
@property NSString *team1Member1Name;
@property NSString *team1Member2Name;
@property NSString *team1Member3Name;
@property NSString *team1Member4Name;
@property NSString *team1Member5Name;
@property NSString *team2Member1Name;
@property NSString *team2Member2Name;
@property NSString *team2Member3Name;
@property NSString *team2Member4Name;
@property NSString *team2Member5Name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ResetAllFields:(UIButton *)sender {
    _TextField_NameTeam2.text = @"";
    _TextField_NameTeam1.text = @"";
    _TextField_NameT1M1.text = @"";
    _TextField_NameT1M2.text = @"";
    _TextField_NameT1M3.text = @"";
    _TextField_NameT1M4.text = @"";
    _TextField_NameT1M5.text = @"";
    _TextField_NameT2M1.text = @"";
    _TextField_NameT2M2.text = @"";
    _TextField_NameT2M3.text = @"";
    _TextField_NameT2M4.text = @"";
    _TextField_NameT2M5.text = @"";
    _TextField_NoT1M1.text = @"";
    _TextField_NoT1M2.text = @"";
    _TextField_NoT1M3.text = @"";
    _TextField_NoT1M4.text = @"";
    _TextField_NoT1M5.text = @"";
    _TextField_NoT2M1.text = @"";
    _TextField_NoT2M2.text = @"";
    _TextField_NoT2M3.text = @"";
    _TextField_NoT2M4.text = @"";
    _TextField_NoT2M5.text = @"";
    
}

- (IBAction)AcceptAndStartGame:(UIButton *)sender {
    bool team1InfoAreValids = false;
    bool team2InfoAreValids = false;
    
    if (_TextField_NameTeam1.text.length > 0 && _TextField_NoT1M1.text.length > 0 && _TextField_NoT1M2.text.length > 0 && _TextField_NoT1M3.text.length > 0 && _TextField_NoT1M4.text.length > 0 && _TextField_NoT1M5.text.length > 0) {
        team1InfoAreValids = true;
        NSLog(@"Team 1 informations are ok !");
    }
    
    if (_TextField_NameTeam2.text.length > 0 && _TextField_NoT2M1.text.length > 0 && _TextField_NoT2M2.text.length > 0 && _TextField_NoT2M3.text.length > 0 && _TextField_NoT2M4.text.length > 0 && _TextField_NoT2M5.text.length > 0) {
        team2InfoAreValids = true;
        NSLog(@"Team 2 informations are ok !");
    }
    
    if (team1InfoAreValids && team2InfoAreValids) {
        // Team names
        _team1Name = _TextField_NameTeam1.text;
        _team2Name = _TextField_NameTeam2.text;
        
        // Team 1 members
        _team1Member1Name = _TextField_NameT1M1.text;
        _team1Member2Name = _TextField_NameT1M2.text;
        _team1Member3Name = _TextField_NameT1M3.text;
        _team1Member4Name = _TextField_NameT1M4.text;
        _team1Member5Name = _TextField_NameT1M5.text;
        
        // Team 2 members
        _team2Member1Name = _TextField_NameT2M1.text;
        _team2Member2Name = _TextField_NameT2M2.text;
        _team2Member3Name = _TextField_NameT2M3.text;
        _team2Member4Name = _TextField_NameT2M4.text;
        _team2Member5Name = _TextField_NameT2M5.text;
        
        NSLog(@"1st team name : %@", _team1Name);
        NSLog(@"2nd team name : %@", _team2Name);
        
        NSLog(@"1st team 1st mbr name : %@", _team1Member1Name);
        NSLog(@"1st team 2nd mbr name : %@", _team1Member2Name);
        NSLog(@"1st team 3rd mbr name : %@", _team1Member3Name);
        NSLog(@"1st team 4th mbr name : %@", _team1Member4Name);
        NSLog(@"1st team 5th mbr name : %@", _team1Member5Name);
        
        NSLog(@"2nd team 1st mbr name : %@", _team2Member1Name);
        NSLog(@"2nd team 2nd mbr name : %@", _team2Member2Name);
        NSLog(@"2nd team 3rd mbr name : %@", _team2Member3Name);
        NSLog(@"2nd team 4th mbr name : %@", _team2Member4Name);
        NSLog(@"2bnd team 5th mbr name : %@", _team2Member5Name);
    }
}
@end
