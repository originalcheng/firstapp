//
//  ViewController.m
//  firstapp
//
//  Created by Cheng Hu on 11/12/17.
//  Copyright © 2017 Cheng Hu. All rights reserved.
//

#import "ViewController.h"
#import "TodoModel.h"
#import "TodoCell.h"
#import <Realm/RLMObject.h>
#import <Realm/RLMRealm.h>
#import <Realm/RLMResults.h>

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray <TodoModel*> *todoList;   //<TodoModel*> is the type per item in the array of todoList
// @property NSMutableArray *todoList;   this btw still works. yOU don't need to be explicit about the type of array, todoList
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.todoList = [[NSMutableArray alloc] init];
    RLMResults *puppies = [TodoModel allObjects];
    for (TodoModel *model in puppies) {
        [self.todoList addObject:model];
    }
    
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    TodoModel *model = [[TodoModel alloc] init];    // TodoModel is a class, and model is an instance of TodoModel
    model.todoMessage = self.todoTextField.text;    // model.todomessage is assigned the value of the input text
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
    [self.todoList insertObject:model atIndex:0];    // [object(array), method:input_variable, i
    self.todoTextField.text = @"";
  //  [self method1:0];
    [self.collectionView reloadData];
//    NSString *todoText = [NSString stringWithFormat:@"My text is %@", self.todoTextField.text];
//    NSLog(todoText);
}

- (void)method1: (int)field {
    
}

- (IBAction)resetButtonPressed:(UIButton *)sender{
    [self.todoList removeAllObjects];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.todoList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TodoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    NSInteger index = indexPath.row;
    cell.todoText.text = [self.todoList objectAtIndex:index].todoMessage;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.contentSize.width, 40.0f);
}

@end
