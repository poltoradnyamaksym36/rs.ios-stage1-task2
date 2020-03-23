#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSArray *numsWordsList = @[@"zero", @"one", @"two", @"three", @"four",
                               @"five", @"six", @"seven", @"eight", @"nine",
                               @"ten", @"eleven", @"twelve", @"thirteen",
                               @"fourteen", @"fifteen", @"sixteen", @"seventeen",
                               @"eighteen", @"nineteen", @"twenty", @"twenty one",
                               @"twenty two", @"twenty three", @"twenty four",
                               @"twenty five", @"twenty six", @"twenty seven",
                               @"twenty eight", @"twenty nine"];
    
    int intHours = [hours intValue];
    int intMinutes = [minutes intValue];
    
    if (intMinutes == 0) {
        NSString *str = [NSString stringWithFormat:@"%@ o' clock", numsWordsList[intHours]];
        return str;
    } else if (intMinutes > 60) {
        return @"";
    } else if (intMinutes == 30) {
        return [NSString stringWithFormat:@"half past %@", numsWordsList[intHours]];
    }
        
    NSString *relation = intMinutes < 30 ? @"past" : @"to";
    int delta = intMinutes - 30;
    int absDelta = abs(delta);
    int index = intMinutes < 30 ? 0 : 1;
    
    if (absDelta == 1) {
        return [NSString stringWithFormat:@"1 minute %@ %@", relation, numsWordsList[intHours + index]];
    }
    
    if (absDelta == 15) {
        return [NSString stringWithFormat:@"quarter %@ %@",relation, numsWordsList[intHours + index]];
    }
    
    NSString* str = [NSString stringWithFormat:@"%@ minutes %@ %@",numsWordsList[absDelta], relation, numsWordsList[intHours + index]];
    return [NSString stringWithFormat:@"%@ minutes %@ %@",numsWordsList[30 - absDelta], relation, numsWordsList[intHours + index]];
}
@end
