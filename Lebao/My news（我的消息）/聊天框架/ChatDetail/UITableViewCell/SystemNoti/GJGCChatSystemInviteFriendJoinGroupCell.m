//
//  GJGCChatSystemInviteFriendJoinGroupCell.m
//  ZYChat
//
//  Created by ZYVincent on 14-12-10.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "GJGCChatSystemInviteFriendJoinGroupCell.h"
#import "GJGCChatSystemNotiCellStyle.h"

@interface GJGCChatSystemInviteFriendJoinGroupCell ()

@property (nonatomic,strong)GJCURoundCornerButton *inviteButton;

@end

@implementation GJGCChatSystemInviteFriendJoinGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.inviteButton = [[GJCURoundCornerButton alloc]init];
        self.inviteButton.backgroundColor = [UIColor clearColor];
        self.inviteButton.gjcf_left = 0;
        self.inviteButton.gjcf_width = self.stateContentView.gjcf_width;
        self.inviteButton.gjcf_height = 44;
        self.inviteButton.titleView.alignment = NSTextAlignmentCenter;
        self.inviteButton.highlightBackColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.inviteButton.cornerBackView.borderColor = [GJGCCommonFontColorStyle tapHighlightColor];
        self.inviteButton.cornerBackView.borderWidth = 0.5f;
        NSAttributedString *inviteTitle = [GJGCChatSystemNotiCellStyle formateButtonTitle:@"邀请好友"];
        self.inviteButton.titleView.contentAttributedString = inviteTitle;
        self.inviteButton.titleView.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:inviteTitle forBaseContentSize:self.inviteButton.gjcf_size];
        self.inviteButton.cornerBackView.cornerRadius = 8.f;
        self.inviteButton.cornerBackView.roundedCorners = TKRoundedCornerBottomRight|TKRoundedCornerBottomLeft;
        self.inviteButton.cornerBackView.drawnBordersSides = TKDrawnBorderSidesTop;

        GJCFWeakSelf weakSelf = self;
        [self.inviteButton configureButtonDidTapAction:^(GJCURoundCornerButton *button) {
            [weakSelf tapOnInviteButton:button];
        }];
        [self.stateContentView addSubview:self.inviteButton];
        
    }
    return self;
}

- (void)setContentModel:(GJGCChatContentBaseModel *)contentModel
{
    if (!contentModel) {
        return;
    }
    
    [super setContentModel:contentModel];
    
    GJGCChatSystemNotiModel *notiModel = (GJGCChatSystemNotiModel *)contentModel;

    /* 隐藏同意，拒绝，附加信息按钮 */
    self.applyButton.hidden = YES;
    self.rejectButton.hidden = YES;
    self.applyAuthorizReasonLabel.hidden = YES;
    self.sepreteLine.hidden = YES;
    
    /* 用附加信息标签显示群组操作通知内容 */
    self.applyAuthorizLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:notiModel.groupOperationTip forBaseContentSize:self.applyAuthorizLabel.contentBaseSize];
    self.applyAuthorizLabel.contentAttributedString = notiModel.groupOperationTip;

    /* 摆放邀请按钮 */
    self.inviteButton.gjcf_top = self.applyAuthorizLabel.gjcf_bottom + self.contentInnerMargin;
    
    /* 重新计算大小 */
    self.stateContentView.gjcf_height = self.inviteButton.gjcf_bottom;
}

- (void)tapOnInviteButton:(GJCURoundCornerButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(systemNotiBaseCellDidTapOnInviteFriendJoinGroup:)]) {
        
        [self.delegate systemNotiBaseCellDidTapOnInviteFriendJoinGroup:self];
    }
}

@end
