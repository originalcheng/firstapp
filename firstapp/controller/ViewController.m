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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray <TodoModel *> *todoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.todoList = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    TodoModel *model = [[TodoModel alloc] init];
    model.todoMessage = self.todoTextField.text;
    [self.todoList insertObject:model atIndex:0];
    self.todoTextField.text = @"";
    [self.collectionView reloadData];
//    NSString *todoText = [NSString stringWithFormat:@"My text is %@", self.todoTextField.text];
//    NSLog(todoText);
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
