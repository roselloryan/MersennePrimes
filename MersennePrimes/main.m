//
//  main.m
//  MersennePrimes


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 2^p-1
        NSString *line = @"8000";
        NSInteger maxInt = [line integerValue];
        
        NSInteger testInt = 0;
        
        NSMutableString *solutionString= [[NSMutableString alloc]init];
        
        // gets a number less than max
        for (testInt = 3; testInt < maxInt; testInt++) {

            NSInteger i = 0;
            NSInteger twoToTheP = 1;
            NSInteger p = 1;
            BOOL isPPrime = YES;
            BOOL is2ToThePMinusOne = NO;
            
//            NSLog(@"\ntestInt%ld\n", testInt);
            
            while (twoToTheP < testInt) {
                
                // builds two to the p without p() sigh...
                twoToTheP = 1;
                for (i = 0; i < p; i++) {
                    twoToTheP = twoToTheP * 2;
                }
//                NSLog(@"TwoToTheP= %ld", twoToTheP);
                
                // is 2^p-1
                if (twoToTheP - 1 == testInt) {
//                    NSLog(@"P = %ld", p);
//                    NSLog(@"\nNumber is 2^p-1 ... %ld == %ld\n\n", twoToTheP - 1, testInt);
                    is2ToThePMinusOne = YES;
                }
                // is p prime
                if (is2ToThePMinusOne) {
                    NSInteger k = 0;
                    for (k = 2; k < p/2 +1; k++) {
//                        NSLog(@"p mod k == %ld", p % k);
                        if (p % k == 0) {
//                            NSLog(@"p mod k == %ld", p % k);
//                            NSLog(@"\n%ld is not prime", p);
                            isPPrime = NO;
                            break;
                        }
                        else {
                            // make sure it's prime
                        }
                    }
                }
                if (p == 2) {
                    isPPrime = YES;
                }
                if (is2ToThePMinusOne && isPPrime){
                    // add testInt to solution string
                    [solutionString appendFormat:@"%ld, ", testInt];
//                    NSLog(@"\nSolution string: %@", solutionString);
                }
                p++;
            }

        }
        NSRange lastCommaAndSpaceRange = NSMakeRange(solutionString.length - 2, 2);
        [solutionString deleteCharactersInRange:lastCommaAndSpaceRange];
        
        NSLog(@"\nFINAL Solution string: %@", solutionString);
        
    }
    return 0;
}
