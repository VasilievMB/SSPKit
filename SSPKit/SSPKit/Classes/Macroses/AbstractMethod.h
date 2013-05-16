//
//  AbstractMethod.h
//  PuzzleGame
//
//  Created by Dirsha A.A. on 16.05.13.
//
//

#define ABSTRACT_METHOD { @throw [NSException exceptionWithName:@"Must override" \
                              reason:[NSString stringWithFormat:@"Abstract %s method", __FUNCTION__] \
                                                       userInfo:nil]; }
