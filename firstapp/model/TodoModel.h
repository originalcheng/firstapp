//
//  TodoModel.h
//  firstapp
//
//  Created by Cheng Hu on 11/12/17.
//  Copyright © 2017 Cheng Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/RLMObject.h>
//@interface TodoModel : NSObject
//@interface used to define the name of a class, in this example its 'TodoModel', which belongs to NSObject

@interface TodoModel : RLMObject
@property (nonatomic, retain) NSString *todoMessage;        // @property is used to define a variable of type NSString which belongs to TodoModel
@end
