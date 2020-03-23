#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSString *alphabetPattern = @"[A-Z]";
    NSRegularExpression *alphabetRegex = [[NSRegularExpression alloc] initWithPattern:alphabetPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    NSString *vowelsPattern = @"[AEIOUY]";
       NSRegularExpression *vowelRegex = [[NSRegularExpression alloc] initWithPattern:vowelsPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSMutableArray *lettersList = [[NSMutableArray alloc] init];
    
    NSString* upperacasedSelf = [self uppercaseString];
    
    for (int i = 0; i < [upperacasedSelf length]; i ++) {
        NSString *ch = [upperacasedSelf substringWithRange:NSMakeRange(i, 1)];
        
        if ([alphabetRegex firstMatchInString:ch options:0 range:NSMakeRange(0, 1)]) {
            [lettersList addObject:ch];
        }
    }
    
    BOOL isPangram = ([[lettersList valueForKeyPath:@"@distinctUnionOfObjects.self"] count] == 26);
    
    NSMutableArray* words = [[self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/ \n\t"]] mutableCopy];
    NSMutableArray* result = [@[] mutableCopy];
    
    for (NSString *word in words) {
        int matchesVowelsCount = 0;
        NSMutableString *normalizedWord = [@"" mutableCopy];
        
        for (int i = 0; i < [word length]; i++) {
            NSString *ch = [word substringWithRange:NSMakeRange(i, 1)];
            
            if ([alphabetRegex firstMatchInString:ch options:0 range:NSMakeRange(0, 1)] && ([vowelRegex firstMatchInString:ch options:0 range:NSMakeRange(0, 1)] == nil) == !isPangram) {
                matchesVowelsCount++;
                [normalizedWord appendString:[ch uppercaseString]];
            } else {
                [normalizedWord appendString:ch];
            }
        }
        
        if ([normalizedWord length] > 0) {
            [result addObject:[NSString stringWithFormat:@"%i%@", matchesVowelsCount, normalizedWord]];
        }
    }
    
    if ([result count] > 0) {
        [result sortUsingComparator:^NSComparisonResult (NSString *left, NSString *right) {
            return [[left substringWithRange:NSMakeRange(0, 1)] compare: [right substringWithRange:NSMakeRange(0, 1)]];
        }];
        
        NSString* str = [result componentsJoinedByString:@" "];
        return str;
    }
    
    return @"";
}

@end
