# DataDominantTableView
一个UITableView辅助工具。当页面中有多种Cell时，可以使用此工具实现根据不同的数据来显示不同的Cell，从而避免在“- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath”方法里面根据indexPath区分Cell，从而降低TableView的维护成本。
