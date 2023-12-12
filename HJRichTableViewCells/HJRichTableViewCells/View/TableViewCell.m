//
//  TableViewCell.m
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import "TableViewCell.h"
#import "SettingModel.h"

@interface TableViewCell ()
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UISwitch *swithView;
@property (nonatomic,strong) UIView *nilView;
@end

@implementation TableViewCell

+ (TableViewCell *)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"TableViewCell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setData:(SettingModel *)data {
    _data = data;
    
    self.imageView.image = data.icon.length ? [UIImage imageNamed:data.icon] : [UIImage new];
    self.textLabel.text = data.text.length ? data.text : nil;
    self.detailTextLabel.text = data.detailText.length ? data.detailText : nil;
    if (data.type == AccessoryTypeDefault) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.nilView;
    } else if (data.type == AccessoryTypeArrow) {
        self.imgView.image = [UIImage imageNamed:data.imgName];
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if (data.type == AccessoryTypeSwith) {
        self.accessoryView = self.swithView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.swithView.on = data.status;
    }
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 24)];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.backgroundColor = UIColor.clearColor;
    }
    return _imgView;
}

- (UISwitch *)swithView {
    if (_swithView == nil) {
        _swithView = [[UISwitch alloc] init];
        [_swithView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _swithView;
}

- (UIView *)nilView {
    if (_nilView == nil) {
        _nilView = [[UIView alloc] init];
    }
    return _nilView;
}

- (void)valueChange:(UISwitch *)sender {
    SettingModel *model = _data;
    if (_data && _data.block) {
        _data.block(model);
    }
}

@end
