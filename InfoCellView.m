#import "InfoCellView.h"

@implementation InfoCellModuleView

- (instancetype)init {
  self = [super init];
  if (self) {
    self.layer.cornerRadius = 13;
    if (@available(iOS 13, *)) {
      self.backgroundColor = [UIColor secondarySystemBackgroundColor];
    } else {
      self.backgroundColor = [UIColor grayColor];
    }

    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentLeading;
    stackView.spacing = 5;

    UILabel *label = [[UILabel alloc] init];
    label.text = @"Battery Health";
    if (@available(iOS 13, *)) {
      [label setTextColor:[UIColor labelColor]];
    } else {
      [label setTextColor:[UIColor blackColor]];
    }
    [label setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize] + 4]];
    label.numberOfLines = 1;
    [label.heightAnchor constraintEqualToConstant:20].active = true;

    UILabel *capacityLabel = [[UILabel alloc] init];
    capacityLabel.text = @"Maximum Capacity: 100%";
    if (@available(iOS 13, *)) {
      [capacityLabel setTextColor:[UIColor labelColor]];
    } else {
      [capacityLabel setTextColor:[UIColor blackColor]];
    }
    capacityLabel.numberOfLines = 2;

    [self addSubview:stackView];
    [stackView addArrangedSubview:label];
    [stackView addArrangedSubview:capacityLabel];
    stackView.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    [stackView setLayoutMarginsRelativeArrangement:YES];

    stackView.translatesAutoresizingMaskIntoConstraints = NO;

    [stackView.heightAnchor constraintEqualToConstant:125].active = true;
    [stackView.widthAnchor constraintEqualToAnchor:self.widthAnchor].active =
        true;
    [stackView.heightAnchor constraintEqualToAnchor:self.heightAnchor].active =
        true;
    [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
        .active = true;
    [capacityLabel.widthAnchor constraintEqualToAnchor:stackView.widthAnchor]
        .active = true;
    [label.widthAnchor constraintEqualToAnchor:stackView.widthAnchor].active =
        true;

    /*[stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor
                                            constant:5]
        .active = true;
    [stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor
                                             constant:-5]
        .active = true;*/
  }
  return self;
}

@end

@implementation InfoCellGroupView
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.axis = UILayoutConstraintAxisHorizontal;
    self.alignment = UIStackViewAlignmentCenter;
    self.distribution = UIStackViewDistributionEqualSpacing;
    self.spacing = 5;

    InfoCellModuleView *moduleView = [[InfoCellModuleView alloc] init];
    InfoCellModuleView *anotherModuleView = [[InfoCellModuleView alloc] init];

    [self addArrangedSubview:moduleView];
    [self addArrangedSubview:anotherModuleView];
    self.bounds = CGRectInset(self.frame, -10.0f, 0.0f);

    moduleView.translatesAutoresizingMaskIntoConstraints = NO;
    anotherModuleView.translatesAutoresizingMaskIntoConstraints = NO;

    [moduleView.heightAnchor constraintEqualToAnchor:self.heightAnchor].active =
        true;
    [moduleView.widthAnchor constraintEqualToAnchor:self.widthAnchor
                                         multiplier:0.5f
                                           constant:-20]
        .active = true;
    [anotherModuleView.heightAnchor constraintEqualToAnchor:self.heightAnchor]
        .active = true;
    [anotherModuleView.widthAnchor constraintEqualToAnchor:self.widthAnchor
                                                multiplier:0.5f
                                                  constant:-20]
        .active = true;
  }
  return self;
}
@end