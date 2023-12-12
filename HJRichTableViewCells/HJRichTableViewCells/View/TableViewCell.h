//
//  TableViewCell.h
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import <UIKit/UIKit.h>
@class SettingModel;
NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (nonatomic,strong) SettingModel *data;
+ (TableViewCell *)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
