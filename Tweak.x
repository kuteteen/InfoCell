#import "InfoCell.h"

static PSSpecifier *appleAccountSpecifier = nil;
static UIImage *accountImage = nil;
BOOL shouldDoOrig = NO;

%hook PSUIPrefsListController
- (id)specifiers {
	NSMutableArray *specifiers = %orig;
	for(PSSpecifier *specifier in specifiers) {
		if(specifier.identifier) {
			if([specifier.identifier isEqualToString:@"APPLE_ACCOUNT"]) {
				appleAccountSpecifier = specifier;
			}
		}
	}
	return specifiers;
}

- (void)reloadSpecifierAtIndex:(long long)arg1 animated:(bool)arg2 {
	%orig;
	if(appleAccountSpecifier) {
		accountImage = [appleAccountSpecifier propertyForKey:@"iconImage"];
	}
}


-(void)viewDidAppear:(BOOL)animated {
	%orig;
	UIImage *image = [[accountImage imageWithSize:CGSizeMake(35, 35)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(showiCloud)];
	barButtonItem.imageInsets = UIEdgeInsetsMake(-4, 0, 0, 0);
	self.navigationItem.rightBarButtonItem = barButtonItem; 
}

- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSTableCell *o = %orig;

    if ([o isKindOfClass:objc_getClass("PSUIAppleAccountCell")]) {
		PSTableCell *new = [[%c(PSTableCell) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infocellView"];
        InfoCellGroupView *infoCellView = [[InfoCellGroupView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 125)];
		infoCellView.translatesAutoresizingMaskIntoConstraints = NO;

		new.accessoryType = UITableViewCellAccessoryNone;
		new.backgroundColor = [UIColor clearColor];
		new.separatorInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, CGFLOAT_MAX);

		[new.contentView addSubview:infoCellView];

		[infoCellView.widthAnchor
			constraintEqualToAnchor:new.contentView.widthAnchor constant:-20]
			.active = true;
		[infoCellView.heightAnchor
			constraintEqualToAnchor:new.contentView.heightAnchor]
			.active = true;
		[infoCellView.centerXAnchor constraintEqualToAnchor:new.contentView.centerXAnchor constant:-10]
			.active = true;
		[infoCellView.centerYAnchor constraintEqualToAnchor:new.contentView.centerYAnchor]
			.active = true; 

		return new;
    } 
	
	return o;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   if(indexPath.section == 0 && indexPath.row == 0) {
	   return 125;
   } else {
	   return %orig;
   }
}

-(void)tableView:(UITableView *)arg1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0 && indexPath.row == 0 && !shouldDoOrig) {
		[arg1 deselectRowAtIndexPath:indexPath animated:YES];
		return;
	} else {
		%orig;
	}
}

%new
-(void)showiCloud {
	shouldDoOrig = YES;
	[self tableView:self.table didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	shouldDoOrig = NO;
}
%end