//
//  ViewController.h
//  test
//
//  Created by Patrick Cooney on 7/23/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weight.h"

@interface WeightCalculatorViewController : UIViewController

@property Weight *calculate;

//labels
///////////////////
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelSetOne;
@property (strong, nonatomic) IBOutlet UILabel *labelSetTwo;
@property (strong, nonatomic) IBOutlet UILabel *labelSetThree;
@property (strong, nonatomic) IBOutlet UILabel *labelSetFour;
@property (strong, nonatomic) IBOutlet UILabel *labelSetFive;
@property (strong, nonatomic) IBOutlet UILabel *labelSetSix;
@property (strong, nonatomic) IBOutlet UILabel *labelSetSeven;
@property (strong, nonatomic) IBOutlet UILabel *labelSetEight;



//buttons
/////////////////
@property (strong, nonatomic) IBOutlet UIButton *addTwoPointFive;
@property (strong, nonatomic) IBOutlet UIButton *addFive;
@property (strong, nonatomic) IBOutlet UIButton *reset;
@property (strong, nonatomic) IBOutlet UIButton *addTen;
@property (strong, nonatomic) IBOutlet UIButton *addTwentyFive;
@property (strong, nonatomic) IBOutlet UIButton *addThirtyFive;
@property (strong, nonatomic) IBOutlet UIButton *addFourtyFive;
@property (strong, nonatomic) IBOutlet UIButton *fifteenPoundBar;
@property (strong, nonatomic) IBOutlet UIButton *FourtyFivePoundBar;
@property (strong, nonatomic) IBOutlet UIButton *logWeight;

- (void) updateCurrentWeightLabel;
- (void) updateWeightLogLabel:(UILabel *)label;
- (void) displayWeightLog;


@end
