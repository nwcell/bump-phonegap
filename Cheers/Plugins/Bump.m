 
#import "Bump.h"
#import <Cordova/CDV.h>
#import "BumpClient.h"

@implementation Bump



- (void)bump:(CDVInvokedUrlCommand*)command
{
    
    NSString* user_id = [command.arguments objectAtIndex:0];
    
    NSLog(@"User id %@",user_id);

          
    [BumpClient configureWithAPIKey:@"8751445c74854cd387db6e09050ebb22" andUserID: user_id];
    
    [[BumpClient sharedClient] setMatchBlock:^(BumpChannelID channel) {
        
        //auto confirm
        [[BumpClient sharedClient] confirmMatch:YES onChannel:channel];
        
        //send Bump with USER_ID, to javascript
        NSString *js = [NSString stringWithFormat:@"matchResult( '%@' );", [[BumpClient sharedClient] userIDForChannel:channel]];
        [self writeJavascript:js];
        
        NSLog(@"matched!");

        
    }];
    
    

 
    
    [[BumpClient sharedClient] setConnectionStateChangedBlock:^(BOOL connected) {
        if (connected) {
            
            [self bumpConnected];
            
        } else {
            
            [self bumpDisconnected];
        }
    }];
    
    [[BumpClient sharedClient] setBumpEventBlock:^(bump_event event) {
        
        
        switch(event) {
            case BUMP_EVENT_BUMP:
                 
                [self bumpDetected];
                break;
            case BUMP_EVENT_NO_MATCH:
                [self bumpNoMatch];
                break;
        }
    }];
   
}

- (void)bumpable:(CDVInvokedUrlCommand*)command{
    
    NSString* status = [command.arguments objectAtIndex:0];

    if ([status isEqualToString:@"NO"]){
     [BumpClient sharedClient].bumpable = NO;
        NSLog(@"not bumpable");
    }else{
        [BumpClient sharedClient].bumpable = YES;
        NSLog(@"yes bumpable");

    }
    
    
}

- (void) bumpNoMatch {
   
   // [BumpClient sharedClient].bumpable = YES;

    
    NSLog(@"NO-MATCH");
    NSString *js = [NSString stringWithFormat:@"updateContent( '%@' );", @"NO-MATCH"];
    [self writeJavascript:js];
}

- (void) bumpDetected {
   
   // [BumpClient sharedClient].bumpable = NO;
    
    NSLog(@"BUMP-DETECTED");
    NSString *js = [NSString stringWithFormat:@"updateContent( '%@' );", @"BUMP-DETECTED"];
    [self writeJavascript:js];
}

- (void) bumpDisconnected {
   
    NSLog(@"DISCONNECTED");
    NSString *js = [NSString stringWithFormat:@"updateContent( '%@' );", @"DISCONNECTED"];
    [self writeJavascript:js];
}

- (void) bumpConnected {
     
    NSLog(@"CONNECTED");
    NSString *js = [NSString stringWithFormat:@"updateContent( '%@' );", @"CONNECTED"];
    [self writeJavascript:js];
}


@end