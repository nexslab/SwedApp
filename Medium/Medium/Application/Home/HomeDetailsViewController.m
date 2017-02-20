//
//  HomeDetailsViewController.m
//  Medium
//
//  Created by macmini on 03/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "HomeDetailsViewController.h"

@interface HomeDetailsViewController ()

@end

@implementation HomeDetailsViewController

- (void)viewDidLoad
{
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setInitParam
{
    
    view_Scrl.frame = CGRectMake(0, 0, WIDTH, view_Scrl.frame.size.height);
    
    arrTags = [[NSMutableArray alloc] init];
    [arrTags addObject:@"Life"];
    [arrTags addObject:@"On Writing"];
    [arrTags addObject:@"Politics"];
    [arrTags addObject:@"Travel"];
    [arrTags addObject:@"Music"];
    [arrTags addObject:@"Art"];
    [arrTags addObject:@"Movies and Television"];
    [arrTags addObject:@"Education"];
    [arrTags addObject:@"Design"];
    [arrTags addObject:@"Technology"];
    [arrTags addObject:@"Books"];
    [arrTags addObject:@"Food"];
    [arrTags addObject:@"Photography"];
    [arrTags addObject:@"Creative Writing"];
    [arrTags addObject:@"Health"];

    
    [self setTags];
    
    
    
    [scrl addSubview:view_Scrl];
    scrl.contentSize = CGSizeMake(WIDTH, view_Scrl.frame.size.height);

}
#pragma mark - TAGS

-(void)setTags
{
    int x_tags= 0;
    int y_tags = 10;
    
    int Heightview = 0;
    for (int ik=0; ik < [arrTags count]; ik++)
    {
        NSString *valueEmoj = [arrTags objectAtIndex:ik];
        UIFont *font = [UIFont systemFontOfSize:12];
        
        CGRect textRect = [valueEmoj boundingRectWithSize:CGSizeMake(250, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        CGSize size = textRect.size;
        
        Heightview = y_tags + size.height + 10;
        
        UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(x_tags, y_tags, size.width + 10, size.height + 10)];
        [btn setTitle:(valueEmoj ? valueEmoj : @"") forState:UIControlStateNormal];
        btn.titleLabel.font = font;
        btn.tag = ik;
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        //[btn addTarget:self action:@selector(ClickTag:) forControlEvents:UIControlEventTouchUpInside];
        [APP_DELEGATE setBorderToView:btn withBorderWidth:0 radious:4.0 color:[UIColor clearColor]];
        //[_globalGDXData setShaowOnView:btn shadowRadius:1.0 shadowOpacity:1.0 cornerRadius:0.0];
        // border radius
        [btn.layer setCornerRadius:4.0f];
        // border
        [btn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [btn.layer setBorderWidth:1.0f];
        // drop shadow
        [btn.layer setShadowColor:[UIColor grayColor].CGColor];
        [btn.layer setShadowOpacity:0.8];
        [btn.layer setShadowRadius:1.0];
        [btn.layer setShadowOffset:CGSizeMake(1.0, 2.0)];
        
        [view_tags addSubview:btn];
                
        int checkposition = 0;
        int xposition = size.width + 10;
        
        if ([arrTags count]-1 == ik)
        {
            
        }
        else
        {
            NSString *valueEmoj = [arrTags objectAtIndex:ik+1];
            
            CGRect textRect = [valueEmoj boundingRectWithSize:CGSizeMake(WIDTH - 40, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
            
            CGSize size1 = textRect.size;
            
            checkposition = x_tags + xposition+size1.width;
        }
        if ((WIDTH - 40) <= checkposition)
        {
            x_tags = 0;
            y_tags += 30;
        }
        else
        {
            x_tags+=size.width + 20;
        }
        
    }
    
    //scrl.contentSize = CGSizeMake(WIDTH , Heightview);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)userTapped:(id)sender
{
    FriendsProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsProfileViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)like:(id)sender
{
    int likecount = [btn_likeCount.titleLabel.text intValue];
    if (btn_like.selected == TRUE)
    {
        likecount = likecount - 1;
        btn_like.selected = FALSE;
    }
    else
    {
        likecount = likecount + 1;
        btn_like.selected = TRUE;
    }
    
    [btn_likeCount setTitle:[NSString stringWithFormat:@" %d",likecount] forState:UIControlStateNormal];
}

- (IBAction)bookmarks:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.selected == TRUE)
    {
        btn.selected = FALSE;
    }
    else
    {
        btn.selected = TRUE;
    }
}

- (IBAction)FollowUser:(id)sender
{
    UIButton *btn_follow = (UIButton *)sender;
    
    if (btn_follow.selected == FALSE)
    {
        btn_follow.selected = TRUE;
        
        btn_follow.backgroundColor = kColorLightGreen;
        [btn_follow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn_follow setTitle:@"Following" forState:UIControlStateNormal];
    }
    else
    {
        btn_follow.selected = FALSE;
        
        btn_follow.backgroundColor = [UIColor whiteColor];
        [btn_follow setTitleColor:kColorLightGreen forState:UIControlStateNormal];
        [btn_follow setTitle:@"Follow" forState:UIControlStateNormal];
    }

}
@end
