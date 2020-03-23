#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *mutableA = [a mutableCopy];
    
    for (int i = 0; i < [b length]; i++) {
        NSString *chB = [b substringWithRange:NSMakeRange(i, 1)];
        
        for (int j = i; j < [mutableA length]; j++) {
            NSString *chA = [mutableA substringWithRange:NSMakeRange(j, 1)];
            
            if ([chB isEqualToString:chA]) {
                break;
            }
            
            chA = [chA uppercaseString];
            
            if ([chB isEqualToString:chA]) {
                [mutableA replaceCharactersInRange:NSMakeRange(j, 1) withString:chA];
                break;
            }
            
            [mutableA deleteCharactersInRange:NSMakeRange(j, 1)];
            j--;
        }
    }
    
    if ([mutableA containsString:b]) {
        return @"YES";
    }
    
    return @"NO";
}
@end
