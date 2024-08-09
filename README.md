#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data; // 主数据
@property (nonatomic, strong) NSMutableArray *expandedData; // 用于跟踪哪些cell是展开的

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数据
    self.data = [NSMutableArray arrayWithArray:@[@"Cell 1", @"Cell 2", @"Cell 3"]];
    self.expandedData = [NSMutableArray array];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowCount = self.data.count;
    for (NSString *expandedCell in self.expandedData) {
        if ([self.data containsObject:expandedCell]) {
            rowCount += 3; // 每个展开的cell增加3个额外cell
        }
    }
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger originalIndex = indexPath.row;
    for (NSString *expandedCell in self.expandedData) {
        NSInteger index = [self.data indexOfObject:expandedCell];
        if (index != NSNotFound && originalIndex > index) {
            originalIndex -= 3;
        }
    }
    
    if ([self.expandedData containsObject:self.data[originalIndex]]) {
        NSInteger extraCellIndex = indexPath.row - originalIndex - 1;
        if (extraCellIndex < 3) {
            UITableViewCell *extraCell = [tableView dequeueReusableCellWithIdentifier:@"ExtraCell" forIndexPath:indexPath];
            extraCell.textLabel.text = [NSString stringWithFormat:@"Extra Cell %ld for %@", (long)extraCellIndex + 1, self.data[originalIndex]];
            return extraCell;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[originalIndex];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger originalIndex = indexPath.row;
    for (NSString *expandedCell in self.expandedData) {
        NSInteger index = [self.data indexOfObject:expandedCell];
        if (index != NSNotFound && originalIndex > index) {
            originalIndex -= 3;
        }
    }
    
    NSString *selectedCell = self.data[originalIndex];
    if ([self.expandedData containsObject:selectedCell]) {
        [self.expandedData removeObject:selectedCell];
    } else {
        [self.expandedData addObject:selectedCell];
    }
    
    [tableView reloadData];
}

@end