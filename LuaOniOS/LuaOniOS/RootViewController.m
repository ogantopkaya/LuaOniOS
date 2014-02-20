//
//  RootViewController.m
//  LuaOniOS
//
//  Created by Ogan Topkaya on 20/02/14.
//  Copyright (c) 2014 Peak Games. All rights reserved.
//

#import "RootViewController.h"
#import "LuaManager.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)calculate:(id)sender;
- (IBAction)execute:(id)sender;
- (IBAction)updateConsole:(id)sender;

@end

@implementation RootViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)calculate:(id)sender {
    NSInteger result = [[LuaManager defaultManager] calculate:5];
    self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"\nresult: %d",result]];
}

- (IBAction)execute:(id)sender {
    [self executeCodeOnConsole];
}

- (IBAction)updateConsole:(id)sender {
    [self updateConsolePosition]; // Get value from lua and make changes
//    [[LuaManager defaultManager] updateConsole:self]; // Lua Calls directly our code
}

- (void)executeCodeOnConsole{
    NSString *text =  self.textView.text;
    
    if ([[LuaManager defaultManager] isAllowedToExecute:text]) {
        [[LuaManager defaultManager] runCodeFromString:text];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Allowed to run code" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)updateConsolePosition{
    NSInteger y = [[LuaManager defaultManager] consolePosition];
    CGRect frame =  self.textView.frame;
    frame.origin.y = y;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.textView.frame = frame;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
