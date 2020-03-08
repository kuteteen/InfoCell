#line 1 "Tweak.x"
#import "InfoCell.h"

static PSSpecifier *appleAccountSpecifier = nil;
static UIImage *accountImage = nil;
BOOL shouldDoOrig = NO;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class PSUIPrefsListController; @class PSTableCell; 
static id (*_logos_orig$_ungrouped$PSUIPrefsListController$specifiers)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$PSUIPrefsListController$specifiers(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, long long, bool); static void _logos_method$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, long long, bool); static void (*_logos_orig$_ungrouped$PSUIPrefsListController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$PSUIPrefsListController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static id _logos_method$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static CGFloat (*_logos_orig$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static CGFloat _logos_method$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void (*_logos_orig$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void _logos_method$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void _logos_method$_ungrouped$PSUIPrefsListController$showiCloud(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$PSTableCell(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("PSTableCell"); } return _klass; }
#line 7 "Tweak.x"

static id _logos_method$_ungrouped$PSUIPrefsListController$specifiers(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSMutableArray *specifiers = _logos_orig$_ungrouped$PSUIPrefsListController$specifiers(self, _cmd);
	for(PSSpecifier *specifier in specifiers) {
		if(specifier.identifier) {
			if([specifier.identifier isEqualToString:@"APPLE_ACCOUNT"]) {
				appleAccountSpecifier = specifier;
			}
		}
	}
	return specifiers;
}

static void _logos_method$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1, bool arg2) {
	_logos_orig$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$(self, _cmd, arg1, arg2);
	if(appleAccountSpecifier) {
		accountImage = [appleAccountSpecifier propertyForKey:@"iconImage"];
	}
}


static void _logos_method$_ungrouped$PSUIPrefsListController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
	_logos_orig$_ungrouped$PSUIPrefsListController$viewDidAppear$(self, _cmd, animated);
	UIImage *image = [[accountImage imageWithSize:CGSizeMake(35, 35)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 	UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(showiCloud)];
	barButtonItem.imageInsets = UIEdgeInsetsMake(-4, 0, 0, 0);
	self.navigationItem.rightBarButtonItem = barButtonItem; 
}

static id _logos_method$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
    PSTableCell *o = _logos_orig$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);

    if ([o isKindOfClass:objc_getClass("PSUIAppleAccountCell")]) {
		PSTableCell *new = [[_logos_static_class_lookup$PSTableCell() alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infocellView"];
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

static CGFloat _logos_method$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath) {
   if(indexPath.section == 0 && indexPath.row == 0) {
	   return 125;
   } else {
	   return _logos_orig$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$(self, _cmd, tableView, indexPath);
   }
}

static void _logos_method$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * arg1, NSIndexPath * indexPath) {
	if(indexPath.section == 0 && indexPath.row == 0 && !shouldDoOrig) {
		[arg1 deselectRowAtIndexPath:indexPath animated:YES];
		return;
	} else {
		_logos_orig$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$(self, _cmd, arg1, indexPath);
	}
}


static void _logos_method$_ungrouped$PSUIPrefsListController$showiCloud(_LOGOS_SELF_TYPE_NORMAL PSUIPrefsListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	shouldDoOrig = YES;
	[self tableView:self.table didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	shouldDoOrig = NO;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$PSUIPrefsListController = objc_getClass("PSUIPrefsListController"); MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(specifiers), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$specifiers, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$specifiers);MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(reloadSpecifierAtIndex:animated:), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$reloadSpecifierAtIndex$animated$);MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$viewDidAppear$);MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$tableView$cellForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$tableView$heightForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$PSUIPrefsListController, @selector(tableView:didSelectRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$PSUIPrefsListController$tableView$didSelectRowAtIndexPath$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$PSUIPrefsListController, @selector(showiCloud), (IMP)&_logos_method$_ungrouped$PSUIPrefsListController$showiCloud, _typeEncoding); }} }
#line 91 "Tweak.x"
