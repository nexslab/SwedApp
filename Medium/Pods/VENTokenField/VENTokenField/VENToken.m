// VENToken.m
//
// Copyright (c) 2014 Venmo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "VENToken.h"

@interface VENToken ()
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@end

@implementation VENToken

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    if (self) {
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit
{
    self.backgroundView.layer.cornerRadius = 5;
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapToken:)];
    self.colorScheme = [UIColor blueColor];
    self.titleLabel.textColor = self.colorScheme;
    
    self.titleLabel.textColor = [UIColor grayColor];
    self.titleLabel.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    [self.titleLabel.layer setCornerRadius:4.0f];
    [self.titleLabel.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.titleLabel.layer setBorderWidth:0.0f];
    
    [self addGestureRecognizer:self.tapGestureRecognizer];
}

- (void)setTitleText:(NSString *)text
{
    text = [text stringByReplacingOccurrencesOfString:@"," withString:@""];
    self.titleLabel.text = [NSString stringWithFormat:@" %@ ",text];
    self.titleLabel.textColor = self.colorScheme;
    [self.titleLabel sizeToFit];
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetMaxX(self.titleLabel.frame) + 10, CGRectGetHeight(self.frame));
    [self.titleLabel sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    UIColor *textColor = highlighted ? [UIColor whiteColor] : [UIColor whiteColor];
    UIColor *backgroundColor = highlighted ? [UIColor colorWithRed:47.0/255.0 green:178.0/255.0 blue:83.0/255.0 alpha:1.0] : [UIColor colorWithRed:47.0/255.0 green:178.0/255.0 blue:83.0/255.0 alpha:1.0];
    //self.titleLabel.textColor = textColor;
    self.backgroundView.backgroundColor = backgroundColor;
}

- (void)setColorScheme:(UIColor *)colorScheme
{
    _colorScheme = colorScheme;
    self.titleLabel.textColor = self.colorScheme;
    [self setHighlighted:_highlighted];
}


#pragma mark - Private

- (void)didTapToken:(UITapGestureRecognizer *)tapGestureRecognizer
{
    if (self.didTapTokenBlock) {
        self.didTapTokenBlock();
    }
}

@end
