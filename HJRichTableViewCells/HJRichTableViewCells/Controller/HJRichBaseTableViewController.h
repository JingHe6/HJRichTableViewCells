//
//  ViewController.h
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import <UIKit/UIKit.h>
#import "SettingModel.h"

@interface HJRichBaseTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *dataList;
@property (nonatomic,strong) SettingModel *model;//接收控制器传值
@end

