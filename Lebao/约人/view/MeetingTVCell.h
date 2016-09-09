//
//  MeetingTVCell.h
//  Lebao
//
//  Created by adnim on 16/8/25.
//  Copyright © 2016年 David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutMeetingModal.h"
@interface MeetingTVCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headImgV;// 头像
@property (nonatomic,strong)UILabel *nameLab;//用户名
@property (nonatomic,strong)UIImageView *certifyImg;//认证
@property (nonatomic,strong)UILabel *companyLab;//公司
@property (nonatomic,strong)UILabel *jobLab;//职位
@property (nonatomic,strong)UILabel *yearLab;//年限
@property (nonatomic,strong)UILabel *timerLab;//时间
@property (nonatomic,strong)UILabel *distanceLab;//距离
@property (nonatomic,strong)UILabel *woNumLab;//匹配度
@property (nonatomic,strong)UIButton *meetingBtn;//约见
@property (nonatomic,assign)float cellHeight;

-(void )configCellWithObjiect:(LayoutMeetingModal *)layout;//传入model
-(void)customView;
@end
