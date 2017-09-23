//
//  ViewController.m
//  TP1
//
//  Created by Michaud, Julien on 17-09-21.
//  Copyright © 2017 Michaud, Julien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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

// Initialisation functions
- (IBAction)ResetAllFields:(UIButton *)sender;
- (IBAction)AcceptAndStartGame:(UIButton *)sender;
- (struct TeamMemberInfo)ConstructMemberInformation: (NSString *) name andNumber:(NSString *) number;
- (struct TeamInfo)ConstructTeamInformation: (NSString *)teamName andMember1:(struct TeamMemberInfo) member1 andMember2:(struct TeamMemberInfo) member2 andMember3:(struct TeamMemberInfo) member3 andMember4:(struct TeamMemberInfo) member4 andMember5:(struct TeamMemberInfo) member5;
- (void)ShowTeamInfo:(struct TeamInfo)teamInfo;

// Team informations !
@property struct TeamInfo Team1Information;
@property struct TeamInfo Team2Information;
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
        .Member5 = member5
    };
    
    return teamInformation;
};

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
        ViewController *sample = [[ViewController alloc]init];
        
        NSLog(@"Creating first team.  here are the members : ");
        NSLog(@"Creating member #1 : ");
        struct TeamMemberInfo team1Member1Info = [sample ConstructMemberInformation:_TextField_NameT1M1.text andNumber:_TextField_NoT1M1.text];
        NSLog(@"Creating member #2 : ");
        struct TeamMemberInfo team1Member2Info = [sample ConstructMemberInformation:_TextField_NameT1M2.text andNumber:_TextField_NoT1M2.text];
        NSLog(@"Creating member #3 : ");
        struct TeamMemberInfo team1Member3Info = [sample ConstructMemberInformation:_TextField_NameT1M3.text andNumber:_TextField_NoT1M3.text];
        NSLog(@"Creating member #4 : ");
        struct TeamMemberInfo team1Member4Info = [sample ConstructMemberInformation:_TextField_NameT1M4.text andNumber:_TextField_NoT1M4.text];
        NSLog(@"Creating member #5 : ");
        struct TeamMemberInfo team1Member5Info = [sample ConstructMemberInformation:_TextField_NameT1M5.text andNumber:_TextField_NoT1M5.text];
        
        _Team1Information = [sample ConstructTeamInformation:_TextField_NameTeam1.text
                                                  andMember1:team1Member1Info andMember2:team1Member2Info
                                                  andMember3:team1Member3Info andMember4:team1Member4Info
                                                  andMember5:team1Member5Info];
        
        // Debug, shows team information in the output console
        [sample ShowTeamInfo:_Team1Information];
        
        NSLog(@"Creating second team.  here are the members : ");
        NSLog(@"Creating member #1 : ");
        struct TeamMemberInfo team2Member1Info = [sample ConstructMemberInformation:_TextField_NameT2M1.text andNumber:_TextField_NoT2M1.text];
        NSLog(@"Creating member #2 : ");
        struct TeamMemberInfo team2Member2Info = [sample ConstructMemberInformation:_TextField_NameT2M2.text andNumber:_TextField_NoT2M2.text];
        NSLog(@"Creating member #3 : ");
        struct TeamMemberInfo team2Member3Info = [sample ConstructMemberInformation:_TextField_NameT2M3.text andNumber:_TextField_NoT2M3.text];
        NSLog(@"Creating member #4 : ");
        struct TeamMemberInfo team2Member4Info = [sample ConstructMemberInformation:_TextField_NameT2M4.text andNumber:_TextField_NoT2M4.text];
        NSLog(@"Creating member #5 : ");
        struct TeamMemberInfo team2Member5Info = [sample ConstructMemberInformation:_TextField_NameT2M5.text andNumber:_TextField_NoT2M5.text];

        
        _Team2Information = [sample ConstructTeamInformation:_TextField_NameTeam2.text
                                                  andMember1:team2Member1Info andMember2:team2Member2Info
                                                  andMember3:team2Member3Info andMember4:team2Member4Info
                                                  andMember5:team2Member5Info];
        
        // Debug, shows team information in the output console
        [sample ShowTeamInfo:_Team2Information];
        
        
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
        _Label_TeamCreation.hidden = YES;
        _Label_Team1.hidden = YES;
        _Label_Team2.hidden = YES;
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
    }

}
@end
