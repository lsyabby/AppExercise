# AppExercise

## File
* Service
    * APIService: Get data from GitHub API
        * func getListData: List users with pagenation
        * func getDetailData: Get a user 

* Model
    * UserModel
        * User: Data model for ListViewController
        * Detail: Data model for DetailViewController

* Scene
    * List
        * ListViewController
            * setupTableView: Layout of tableView
            * bind: Binding to ListViewModel for update dataSource

        * ListViewModel: ViewModel for ListViewController
            * pageSince: For pagination
            * list: Get list users from API
            * binding: Connection with ListViewController for update tableView

        * ListTableViewDataSource: DataSource for TableView and update UI of cell

        * UserTableViewCell
            * tapCell: Pass selection to open DetailViewController

    * Detail
        * DetailViewController
            * setupView: Layout of DetailView
            * bind: Binding to DetailViewModel for update UI
            * dismissAction: Tap for dismiss page
            * tapAction: Tap for open url link

        * DetailViewModel
            * userName: Getting From previous page to get detail data from API
            * detail: Get detail information of user from API
            * binding: Connection with DetailViewController for update UI

        * DetailView: View of DetailViewController

---
<br/>


## Design Pattern: MVVM

## Language: Swift

## Requirement
* iOS 14.4+
* Xcode 12.4+