//
//  ViewController.m
//  test
//
//  Created by Patrick Cooney on 7/23/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "WeightCalculatorViewController.h"

@interface WeightCalculatorViewController ()

@end

@implementation WeightCalculatorViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frameSize = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:frameSize];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    UIView *calculatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.scrollView addSubview:calculatorView];
    UIView *totalLoad = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    totalLoad.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:totalLoad];
    
    
    self.calculate = [[Weight alloc] init];
    
    
    self.barSelector = [[UISegmentedControl alloc] initWithItems:@[@"15lb", @"45lb"]];
    self.barSelector.frame = CGRectMake(68, 198, 182, 29);
    [calculatorView addSubview:self.barSelector];
    
    [self.barSelector addTarget:self action:@selector(setBarWeight:) forControlEvents:UIControlEventValueChanged];
    
    [self.calculate addBar:15];
    [self updateCurrentWeightLabel];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateCurrentWeightLabel {
    self.weightLabel.text = [NSString stringWithFormat:@"%.0f", self.calculate.currentWeight];
}

- (void) resetWeightLog {
    
    //set all labels to blank strings
    self.labelSetOne.text = @"";
    self.labelSetTwo.text = @"";
    self.labelSetThree.text = @"";
    self.labelSetFour.text = @"";
    self.labelSetFive.text = @"";
    self.labelSetSix.text = @"";
    self.labelSetSeven.text = @"";
    self.labelSetEight.text = @"";
}

- (void) updateWeightLogLabel:(UILabel *)label{
    label.text = [NSString stringWithFormat:@"%.0f", self.calculate.currentWeight];
}

- (void) displayWeightLog {
    NSUInteger arrayCount = self.calculate.weightLog.count;
    switch (arrayCount) {
        case 0:
            //do nothing
            break;
        case 1:
            [self updateWeightLogLabel:self.labelSetOne];
            break;
        case 2:
            [self updateWeightLogLabel:self.labelSetTwo];
            break;
        case 3:
            [self updateWeightLogLabel:self.labelSetThree];
            break;
        case 4:
            [self updateWeightLogLabel:self.labelSetFour];
            break;
        case 5:
            [self updateWeightLogLabel:self.labelSetFive];
            break;
        case 6:
           [self updateWeightLogLabel:self.labelSetSix];
            break;
        case 7:
            [self updateWeightLogLabel:self.labelSetSeven];
            break;
        case 8:
            [self updateWeightLogLabel:self.labelSetEight];
            break;
        default:
            break;
    }
    
    /*if the count is greater than 8 shift everything up one set each time the log button is hit
    and drop the oldest set off the screen */
    
    if(arrayCount > 8){
        self.labelSetOne.text = self.labelSetTwo.text;
        self.labelSetTwo.text = self.labelSetThree.text;
        self.labelSetThree.text = self.labelSetFour.text;
        self.labelSetFour.text = self.labelSetFive.text;
        self.labelSetFive.text = self.labelSetSix.text;
        self.labelSetSix.text = self.labelSetSeven.text;
        self.labelSetSeven.text = self.labelSetEight.text;
        self.labelSetEight.text = [NSString stringWithFormat:@"%.0f", self.calculate.currentWeight];
    }
}

- (IBAction)logWeight:(id)sender {
    [self.calculate addSetToLog:self.calculate.currentWeight];
    [self displayWeightLog];
}

- (IBAction)reset:(id)sender {
    [self.calculate reset];
    if (self.barSelector.selectedSegmentIndex == 1) {
        [self.calculate addBar:45];
    } else{
        [self.calculate addBar:15];
    }
    [self updateCurrentWeightLabel];
    [self resetWeightLog];

}

- (IBAction)addTwoAndAHalfPounds:(id)sender {
    [self.calculate addWeight:2.5];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFivePounds:(id)sender {
    [self.calculate addWeight:5.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addTenPounds:(id)sender {
    [self.calculate addWeight:10.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addTwentyFivePounds:(id)sender {
    [self.calculate addWeight:25.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addThirtyFivePounds:(id)sender {
    [self.calculate addWeight:35.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFourtyFivePounds:(id)sender {
    [self.calculate addWeight:45.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)setBarWeight:(id)sender {
    if (self.barSelector.selectedSegmentIndex == 1) {
        [self.calculate subtractBarWeight:15];
        [self.calculate addBar:45];
        [self updateCurrentWeightLabel];
    } else{
        [self.calculate subtractBarWeight:45];
        [self.calculate addBar:15];
        [self updateCurrentWeightLabel];
    }
}

@end
