//
//  ViewController.h
//  TP1
//
//  Created by Michaud, Julien on 17-09-21.
//  Copyright © 2017 Michaud, Julien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
struct  TeamMemberInfo {
    __unsafe_unretained NSString        *MemberName;
    __unsafe_unretained NSString        *LastName;
    __unsafe_unretained NSString        *MemberNumber;
};

struct TeamInfo {
    __unsafe_unretained NSString        *TeamName;
    struct TeamMemberInfo               Member1;
    struct TeamMemberInfo               Member2;
    struct TeamMemberInfo               Member3;
    struct TeamMemberInfo               Member4;
    struct TeamMemberInfo               Member5;
    int                                 Score;
};

struct GoalInfo {
    struct TeamMemberInfo Goaler;
    struct TeamMemberInfo FirstAssist;
    struct TeamMemberInfo SecondAssist;
    int                   Period;
};

- (struct GoalInfo)ConstructGoalInformation;
- (struct TeamMemberInfo)ConstructMemberInformation: (NSString *)name andLName:(NSString *)lName andNumber:(NSString *)number;
- (struct TeamInfo)ConstructTeamInformation: (NSString *)teamName andMember1:(struct TeamMemberInfo) member1 andMember2:(struct TeamMemberInfo) member2 andMember3:(struct TeamMemberInfo) member3 andMember4:(struct TeamMemberInfo) member4 andMember5:(struct TeamMemberInfo) member5;

- (void)ShowTeamInfo: (struct TeamInfo)teamInfo;

- (void)startGame;

- (IBAction)textFieldReturn:(id)sender;

- (void)AssignPlayerToGoal: (struct TeamMemberInfo)member andSender:(UIButton *)sender;
- (void)UpdateToDefaultColor;
- (bool)CheckIfAssistIsSameAsGoaler: (struct TeamMemberInfo)assist;
- (bool)CheckIfMemberParOfteam: (struct TeamMemberInfo)member andTeam:(struct TeamInfo)team;
- (void)ShowWrongAssistTeamAlert: (struct TeamMemberInfo)member andTeam: (struct TeamInfo)team;
- (NSString *)FindMatchStars;
@end

