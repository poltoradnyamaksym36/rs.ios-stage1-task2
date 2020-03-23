#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *dateString = [NSString stringWithFormat:@"%@/%@/%@", month, day, year];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM/dd/yyyy";
    
    NSDate *date = [formatter dateFromString:dateString];
    
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru"];;
    formatter.dateFormat = @"dd MMMM, EEEE";
    
    if (date) {
        return [formatter stringFromDate:date];
    } else {
        return @"Такого дня не существует";
    }
}

@end
