//
//  ViewController.m
//  TP1
//
//  Created by Michaud, Julien on 17-09-21.
//  Copyright © 2017 Michaud, Julien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
// Initialisation labels
@property (weak, nonatomic) IBOutlet UILabel *Label_TeamCreation;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Name;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Name;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Members;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Members;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1FullName;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Nb;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2FullName;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Nb;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Member1;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Member2;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Member3;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Member4;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team1Member5;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Member1;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Member2;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Member3;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Member4;
@property (weak, nonatomic) IBOutlet UILabel *Label_Team2Member5;

// Game  button
@property (weak, nonatomic) IBOutlet UIButton *Button_Team1Member1_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team1Member2_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team1Member3_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team1Member4_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team1Member5_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team2Member1_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team2Member2_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team2Member3_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team2Member4_Info;
@property (weak, nonatomic) IBOutlet UIButton *Button_Team2Member5_Info;
- (IBAction)Button_Team1Member1_Click:(UIButton *)sender;
- (IBAction)Button_Team1Member2_Click:(UIButton *)sender;
- (IBAction)Button_Team1Member3_Click:(UIButton *)sender;
- (IBAction)Button_Team1Member4_Click:(UIButton *)sender;
- (IBAction)Button_Team1Member5_Click:(UIButton *)sender;
- (IBAction)Button_Team2Member1_Click:(UIButton *)sender;
- (IBAction)Button_Team2Member2_Click:(UIButton *)sender;
- (IBAction)Button_Team2Member3_Click:(UIButton *)sender;
- (IBAction)Button_Team2Member4_Click:(UIButton *)sender;
- (IBAction)Button_Team2Member5_Click:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *UITableView_Goals;

// Initialisation textfields
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

// initialisation buttons
@property (weak, nonatomic) IBOutlet UIButton *Button_StartCounting;
@property (weak, nonatomic) IBOutlet UIButton *Button_ResetInitialisation;
@property (weak, nonatomic) IBOutlet UIButton *Button_NextPeriod;
- (IBAction)Button_NextPeriod_Click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Button_Goal;
- (IBAction)Button_Goal_Click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Button_AcceptGoal;
@property (weak, nonatomic) IBOutlet UIButton *Button_CancelGoal;
- (IBAction)Button_AcceptGoal_Click:(UIButton *)sender;
- (IBAction)Button_CancelGoal_Click:(UIButton *)sender;

// Initialisation functions
- (IBAction)ResetAllFields:(UIButton *)sender;
- (IBAction)AcceptAndStartGame:(UIButton *)sender;
- (struct TeamMemberInfo)ConstructMemberInformation: (NSString *) name andNumber:(NSString *) number;
- (struct TeamInfo)ConstructTeamInformation: (NSString *)teamName andMember1:(struct TeamMemberInfo) member1 andMember2:(struct TeamMemberInfo) member2 andMember3:(struct TeamMemberInfo) member3 andMember4:(struct TeamMemberInfo) member4 andMember5:(struct TeamMemberInfo) member5;
- (void)ShowTeamInfo:(struct TeamInfo)teamInfo;

// Team informations !
@property struct TeamInfo Team1Information;
@property struct TeamInfo Team2Information;
@property int CurrentPeriod;
@property bool GoalMode;
@property struct GoalInfo CurrentGoalInformation;
@property bool GoalerFound;
@property bool FirstAssistFound;
@property bool SecondAssistFound;
@property bool IsFirstTeamGoal;
// Array de goal info ici !

@property NSMutableArray* Goals;
@end

@implementation ViewController
- (struct TeamMemberInfo)ConstructMemberInformation:(NSString *)name andNumber:(NSString *)number {
    struct TeamMemberInfo memberInfo = {
        .MemberName = name,
        .MemberNumber = number
    };
    
    return memberInfo;
}

- (struct TeamInfo)ConstructTeamInformation: (NSString *)teamName andMember1:(struct TeamMemberInfo) member1 andMember2:(struct TeamMemberInfo) member2 andMember3:(struct TeamMemberInfo) member3 andMember4:(struct TeamMemberInfo) member4 andMember5:(struct TeamMemberInfo) member5 {

    struct TeamInfo teamInformation = {
        .TeamName = teamName,
        .Member1 = member1,
        .Member2 = member2,
        .Member3 = member3,
        .Member4 = member4,
        .Member5 = member5,
        .Score = 0
    };
    
    return teamInformation;
};

- (struct GoalInfo)ConstructGoalInformation {
    struct GoalInfo goalInformation = {
        .Goaler = nil,
        .FirstAssist = nil,
        .SecondAssist = nil
    };
    
    return goalInformation;
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _Goals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.textLabel.text = _Goals[indexPath.row];
    
    return cell;
}


- (void)ShowTeamInfo:(struct TeamInfo)teamInfo {
    NSLog(@"++++ Team information ++++");
    NSLog(@"Team name : %@", teamInfo.TeamName);
    NSLog(@"++ Members");
    NSLog(@"Name : %@ Number : %@", teamInfo.Member1.MemberName, teamInfo.Member1.MemberNumber);
    NSLog(@"Name : %@ Number : %@", teamInfo.Member2.MemberName, teamInfo.Member2.MemberNumber);
    NSLog(@"Name : %@ Number : %@", teamInfo.Member3.MemberName, teamInfo.Member3.MemberNumber);
    NSLog(@"Name : %@ Number : %@", teamInfo.Member4.MemberName, teamInfo.Member4.MemberNumber);
    NSLog(@"Name : %@ Number : %@", teamInfo.Member5.MemberName, teamInfo.Member5.MemberNumber);
    NSLog(@"++++++++++++++++++++++++++");
};

- (void)startGame {
    // Hide textfields
    _TextField_NameTeam1.hidden = YES;
    _TextField_NoT1M1.hidden = YES;
    _TextField_NoT1M2.hidden= YES;
    _TextField_NoT1M3.hidden= YES;
    _TextField_NoT1M4.hidden= YES;
    _TextField_NoT1M5.hidden= YES;
    _TextField_NameT1M1.hidden = YES;
    _TextField_NameT1M2.hidden = YES;
    _TextField_NameT1M3.hidden = YES;
    _TextField_NameT1M4.hidden = YES;
    _TextField_NameT1M5.hidden = YES;
    _TextField_NameTeam2.hidden = YES;
    _TextField_NoT2M1.hidden = YES;
    _TextField_NoT2M2.hidden= YES;
    _TextField_NoT2M3.hidden= YES;
    _TextField_NoT2M4.hidden= YES;
    _TextField_NoT2M5.hidden= YES;
    _TextField_NameT2M1.hidden = YES;
    _TextField_NameT2M2.hidden = YES;
    _TextField_NameT2M3.hidden = YES;
    _TextField_NameT2M4.hidden = YES;
    _TextField_NameT2M5.hidden = YES;
    
    // Hide labels
    _Label_Team1Members.hidden = YES;
    _Label_Team2Members.hidden = YES;
    _Label_Team1Nb.hidden = YES;
    _Label_Team2Nb.hidden = YES;
    _Label_Team1Name.hidden = YES;
    _Label_Team2Name.hidden = YES;
    _Label_Team1FullName.hidden = YES;
    _Label_Team2FullName.hidden = YES;
    _Label_Team1Member1.hidden = YES;
    _Label_Team1Member2.hidden = YES;
    _Label_Team1Member3.hidden = YES;
    _Label_Team1Member4.hidden = YES;
    _Label_Team1Member5.hidden = YES;
    _Label_Team2Member1.hidden = YES;
    _Label_Team2Member2.hidden = YES;
    _Label_Team2Member3.hidden = YES;
    _Label_Team2Member4.hidden = YES;
    _Label_Team2Member5.hidden = YES;
    
    // Hide buttons
    _Button_StartCounting.hidden = YES;
    _Button_ResetInitialisation.hidden = YES;
    
    // Modify lables for the game
    _Label_Team1.text = [NSString stringWithFormat:@"%@ : %d", _Team1Information.TeamName, _Team1Information.Score];
    _Label_Team2.text = [NSString stringWithFormat:@"%@ : %d", _Team2Information.TeamName, _Team2Information.Score];
    _Label_TeamCreation.text = [NSString stringWithFormat:@"Period : %d", _CurrentPeriod];
    
    _Label_TeamCreation.frame = CGRectMake(_Label_TeamCreation.frame.origin.x + _Button_NextPeriod.frame.size.width + 10, _Label_TeamCreation.frame.origin.y, _Label_TeamCreation.frame.size.width, _Label_TeamCreation.frame.size.height);
    
    _Button_NextPeriod.hidden = NO;
    [_Button_Team1Member1_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team1Information.Member1.MemberName, _Team1Information.Member1.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team1Member2_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team1Information.Member2.MemberName, _Team1Information.Member2.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team1Member3_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team1Information.Member3.MemberName, _Team1Information.Member3.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team1Member4_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team1Information.Member4.MemberName, _Team1Information.Member4.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team1Member5_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team1Information.Member5.MemberName, _Team1Information.Member5.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team2Member1_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team2Information.Member1.MemberName, _Team2Information.Member1.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team2Member2_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team2Information.Member2.MemberName, _Team2Information.Member2.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team2Member3_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team2Information.Member3.MemberName, _Team2Information.Member3.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team2Member4_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team2Information.Member4.MemberName, _Team2Information.Member4.MemberNumber] forState: UIControlStateNormal];
    
    [_Button_Team2Member5_Info setTitle:[NSString stringWithFormat:@"%@ - #%@", _Team2Information.Member5.MemberName, _Team2Information.Member5.MemberNumber] forState: UIControlStateNormal];
 
    _Button_Team1Member1_Info.hidden = NO;
    _Button_Team1Member2_Info.hidden = NO;
    _Button_Team1Member3_Info.hidden = NO;
    _Button_Team1Member4_Info.hidden = NO;
    _Button_Team1Member5_Info.hidden = NO;
    _Button_Team2Member1_Info.hidden = NO;
    _Button_Team2Member2_Info.hidden = NO;
    _Button_Team2Member3_Info.hidden = NO;
    _Button_Team2Member4_Info.hidden = NO;
    _Button_Team2Member5_Info.hidden = NO;
    
    _Button_Goal.hidden = NO;
    _UITableView_Goals.hidden = NO;
}

- (void)ResetGame {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _Goals = [NSMutableArray array];
    
    _CurrentPeriod = 1;
    _GoalMode = false;
    _GoalerFound = false;
    _FirstAssistFound = false;
    _SecondAssistFound = false;
    _IsFirstTeamGoal = false;
    
    _UITableView_Goals.hidden = YES;
    
    _Button_NextPeriod.hidden = YES;
    _Button_Team1Member1_Info.hidden = YES;
    _Button_Team1Member2_Info.hidden = YES;
    _Button_Team1Member3_Info.hidden = YES;
    _Button_Team1Member4_Info.hidden = YES;
    _Button_Team1Member5_Info.hidden = YES;
    _Button_Team2Member1_Info.hidden = YES;
    _Button_Team2Member2_Info.hidden = YES;
    _Button_Team2Member3_Info.hidden = YES;
    _Button_Team2Member4_Info.hidden = YES;
    _Button_Team2Member5_Info.hidden = YES;
    _Button_Goal.hidden = YES;
    _Button_AcceptGoal.hidden = YES;
    _Button_CancelGoal.hidden = YES;
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
        NSLog(@"Creating first team.  here are the members : ");
        NSLog(@"Creating member #1 : ");
        struct TeamMemberInfo team1Member1Info = [self ConstructMemberInformation:_TextField_NameT1M1.text andNumber:_TextField_NoT1M1.text];
        NSLog(@"Creating member #2 : ");
        struct TeamMemberInfo team1Member2Info = [self ConstructMemberInformation:_TextField_NameT1M2.text andNumber:_TextField_NoT1M2.text];
        NSLog(@"Creating member #3 : ");
        struct TeamMemberInfo team1Member3Info = [self ConstructMemberInformation:_TextField_NameT1M3.text andNumber:_TextField_NoT1M3.text];
        NSLog(@"Creating member #4 : ");
        struct TeamMemberInfo team1Member4Info = [self ConstructMemberInformation:_TextField_NameT1M4.text andNumber:_TextField_NoT1M4.text];
        NSLog(@"Creating member #5 : ");
        struct TeamMemberInfo team1Member5Info = [self ConstructMemberInformation:_TextField_NameT1M5.text andNumber:_TextField_NoT1M5.text];
        
        _Team1Information = [self ConstructTeamInformation:_TextField_NameTeam1.text
                                                  andMember1:team1Member1Info andMember2:team1Member2Info
                                                  andMember3:team1Member3Info andMember4:team1Member4Info
                                                  andMember5:team1Member5Info];
        
        // Debug, shows team information in the output console
        [self ShowTeamInfo:_Team1Information];
        
        NSLog(@"Creating second team.  here are the members : ");
        NSLog(@"Creating member #1 : ");
        struct TeamMemberInfo team2Member1Info = [self ConstructMemberInformation:_TextField_NameT2M1.text andNumber:_TextField_NoT2M1.text];
        NSLog(@"Creating member #2 : ");
        struct TeamMemberInfo team2Member2Info = [self ConstructMemberInformation:_TextField_NameT2M2.text andNumber:_TextField_NoT2M2.text];
        NSLog(@"Creating member #3 : ");
        struct TeamMemberInfo team2Member3Info = [self ConstructMemberInformation:_TextField_NameT2M3.text andNumber:_TextField_NoT2M3.text];
        NSLog(@"Creating member #4 : ");
        struct TeamMemberInfo team2Member4Info = [self ConstructMemberInformation:_TextField_NameT2M4.text andNumber:_TextField_NoT2M4.text];
        NSLog(@"Creating member #5 : ");
        struct TeamMemberInfo team2Member5Info = [self ConstructMemberInformation:_TextField_NameT2M5.text andNumber:_TextField_NoT2M5.text];

        
        _Team2Information = [self ConstructTeamInformation:_TextField_NameTeam2.text
                                                  andMember1:team2Member1Info andMember2:team2Member2Info
                                                  andMember3:team2Member3Info andMember4:team2Member4Info
                                                  andMember5:team2Member5Info];
        
        // Debug, shows team information in the output console
        [self ShowTeamInfo:_Team2Information];
        
        // modify UI to play the game
        [self startGame];
    }

}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)Button_NextPeriod_Click:(UIButton *)sender {
    if (_CurrentPeriod < 3) {
        _CurrentPeriod++;
        _Label_TeamCreation.text = [NSString stringWithFormat:@"Period : %d", _CurrentPeriod];
    }
    else
    {
        UIAlertController* alert = [UIAlertController                                    alertControllerWithTitle:@"Match finished !"                                    message:@"Current match is finished.  You can not add more period."                                                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction
            actionWithTitle:@"Ok"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)Button_Goal_Click:(UIButton *)sender {
    _Button_Goal.hidden = YES;
    _Button_AcceptGoal.hidden = NO;
    _Button_CancelGoal.hidden = NO;
        
    _CurrentGoalInformation = [self ConstructGoalInformation];
    
    _GoalMode = true;
}
- (IBAction)Button_AcceptGoal_Click:(UIButton *)sender {
    _CurrentGoalInformation.Period = _CurrentPeriod;
    
    NSString *goalInfo;
    if (_GoalerFound) {
        if (_FirstAssistFound) {
            if (_SecondAssistFound) {
                if (_IsFirstTeamGoal) {
                    goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, Assists: %@ %@", _CurrentPeriod, _Team1Information.TeamName, _CurrentGoalInformation.Goaler.MemberName, _CurrentGoalInformation.FirstAssist.MemberName, _CurrentGoalInformation.SecondAssist.MemberName];
                }
                else {
                    goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, Assists: %@ %@", _CurrentPeriod, _Team2Information.TeamName, _CurrentGoalInformation.Goaler.MemberName, _CurrentGoalInformation.FirstAssist.MemberName, _CurrentGoalInformation.SecondAssist.MemberName];
                }
            }
            else {
                if (_IsFirstTeamGoal) {
                    goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, Assists: %@", _CurrentPeriod, _Team1Information.TeamName, _CurrentGoalInformation.Goaler.MemberName, _CurrentGoalInformation.FirstAssist.MemberName];
                }
                else {
                    goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, Assists: %@", _CurrentPeriod, _Team2Information.TeamName, _CurrentGoalInformation.Goaler.MemberName, _CurrentGoalInformation.FirstAssist.MemberName];
                }
            }
        }
        else {
            if (_IsFirstTeamGoal) {
                goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, No Assist.", _CurrentPeriod, _Team1Information.TeamName, _CurrentGoalInformation.Goaler.MemberName];
            }
            else {
                goalInfo = [NSString stringWithFormat:@"Period #%d Team: %@ - Goaler: %@, No Assist.", _CurrentPeriod, _Team2Information.TeamName, _CurrentGoalInformation.Goaler.MemberName];
            }
        }
        
        NSLog(@"%@", goalInfo);
        [_Goals addObject:goalInfo];
        
        [_UITableView_Goals reloadData];
    }
    
    
    _Button_Goal.hidden = NO;
    _Button_AcceptGoal.hidden = YES;
    _Button_CancelGoal.hidden = YES;
    _GoalMode = false;
    _GoalerFound = false;
    _FirstAssistFound = false;
    _SecondAssistFound = false;
    _IsFirstTeamGoal = false;
    
    [self UpdateToDefaultColor];
}

- (IBAction)Button_CancelGoal_Click:(UIButton *)sender {
    _Button_Goal.hidden = NO;
    _Button_AcceptGoal.hidden = YES;
    _Button_CancelGoal.hidden = YES;
    _GoalMode = false;
    _GoalerFound = false;
    _FirstAssistFound = false;
    _SecondAssistFound = false;
    _IsFirstTeamGoal = false;
    
    [self UpdateToDefaultColor];
}

- (void)UpdateToDefaultColor {
    _Button_Team1Member1_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team1Member2_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team1Member3_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team1Member4_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team1Member5_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team2Member1_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team2Member2_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team2Member3_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team2Member4_Info.backgroundColor = UIColor.whiteColor;
    _Button_Team2Member5_Info.backgroundColor = UIColor.whiteColor;
}

- (void)AssignPlayerToGoal:(struct TeamMemberInfo)member andSender:(UIButton *)sender {
    if (_GoalerFound) {
        if (_FirstAssistFound) {
            if (!_SecondAssistFound && [self CheckIfAssistIsSameAsGoaler:member]) {
                sender.backgroundColor = UIColor.orangeColor;
                _CurrentGoalInformation.SecondAssist = member;
                _SecondAssistFound = true;
            }
        }
        else if([self CheckIfAssistIsSameAsGoaler:member]){
            sender.backgroundColor = UIColor.cyanColor;
            _CurrentGoalInformation.FirstAssist = member;
            _FirstAssistFound = true;
        }
    }
    else {
        sender.backgroundColor = UIColor.greenColor;
        _CurrentGoalInformation.Goaler = member;
        _GoalerFound = true;
        
        if ([self CheckIfMemberParOfteam:member andTeam:_Team1Information]) {
            _IsFirstTeamGoal = true;
        }
    }
}

- (bool) CheckIfAssistIsSameAsGoaler:(struct TeamMemberInfo)assist {
    bool isSameTeam = false;

    
    if (_IsFirstTeamGoal) {
        if ([self CheckIfMemberParOfteam:assist andTeam:_Team1Information]) {
            isSameTeam = true;
        }
        else
        {
            [self ShowWrongAssistTeamAlert:assist andTeam:_Team1Information];
        }
    }
    else
    {
        if ([self CheckIfMemberParOfteam:assist andTeam:_Team2Information]) {
            isSameTeam = true;
        }
        else
        {
            [self ShowWrongAssistTeamAlert:assist andTeam:_Team2Information];
        }
    }
    
    return isSameTeam;
}

- (bool)CheckIfMemberParOfteam:(struct TeamMemberInfo)member andTeam:(struct TeamInfo)team {
    bool yes = false;
    
    if (team.Member1.MemberNumber == member.MemberNumber || team.Member4.MemberNumber == member.MemberNumber ||
        team.Member2.MemberNumber == member.MemberNumber || team.Member5.MemberNumber == member.MemberNumber ||
        team.Member3.MemberNumber == member.MemberNumber) {
        yes = true;
    }
    
    return yes;
}

- (void)ShowWrongAssistTeamAlert:(struct TeamMemberInfo)member andTeam:(struct TeamInfo)team {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Invalid member !"
                                message:[NSString stringWithFormat:@"Selected assist : %@ - #%@ is not part of previously selected goaling team %@.  If you meant another goaler, please cancel and start over.", member.MemberName, member.MemberNumber, team.TeamName]
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"I Understand"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)Button_Team1Member1_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team1Information.Member1 andSender:sender];
    }
}

- (IBAction)Button_Team1Member2_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team1Information.Member2 andSender:sender];
    }
}

- (IBAction)Button_Team1Member3_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team1Information.Member3 andSender:sender];
    }
}

- (IBAction)Button_Team1Member4_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team1Information.Member4 andSender:sender];
    }
}

- (IBAction)Button_Team1Member5_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team1Information.Member5 andSender:sender];
    }
}

- (IBAction)Button_Team2Member1_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team2Information.Member1 andSender:sender];
    }
}

- (IBAction)Button_Team2Member2_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team2Information.Member2 andSender:sender];
    }
}

- (IBAction)Button_Team2Member3_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team2Information.Member3 andSender:sender];
    }
}

- (IBAction)Button_Team2Member4_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team2Information.Member4 andSender:sender];
    }
}

- (IBAction)Button_Team2Member5_Click:(UIButton *)sender {
    if (_GoalMode) {
        [self AssignPlayerToGoal:_Team2Information.Member5 andSender:sender];
    }
}

@end
