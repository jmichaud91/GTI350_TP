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
    __unsafe_unretained NSString        *MemberNumber;
};

struct TeamInfo {
    __unsafe_unretained NSString        *TeamName;
    struct TeamMemberInfo               Member1;
    struct TeamMemberInfo               Member2;
    struct TeamMemberInfo               Member3;
    struct TeamMemberInfo               Member4;
    struct TeamMemberInfo               Member5;
};

- (struct TeamMemberInfo)ConstructMemberInformation: (NSString *)name andNumber:(NSString *)number;
- (struct TeamInfo)ConstructTeamInformation: (NSString *)teamName andMember1:(struct TeamMemberInfo) member1 andMember2:(struct TeamMemberInfo) member2 andMember3:(struct TeamMemberInfo) member3 andMember4:(struct TeamMemberInfo) member4 andMember5:(struct TeamMemberInfo) member5;

- (void)ShowTeamInfo: (struct TeamInfo)teamInfo;
@end

