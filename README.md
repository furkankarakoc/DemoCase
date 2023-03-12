# DemoCase
Demo Case for KocSistem

The project consisting of 4 tabbars and 1 detail screen was designed.
When the item on the list pages is clicked, the detail page opens. The relevant information in the item is displayed on the detail page.
It is shown as TableView on the 1st and 2nd screens, and as CollectionView on the 3rd and 4th screens.

On the first page, the data were drawn 20 each. Pagination has been done on this page.
Service on first page: https://itunes.apple.com/search?term=jack+johnson&amp;limit=N&amp;offset=X


The 2nd tabbar screen is listed with tableView only. How many results are written in total.
On the 3rd tabbar screen, the data is displayed with collectionView.
On the 4th tabbar screen, the data is shown using collectionView as in the design.
Unlike other pages, it has the ability to delete with the X button. 
When this button is pressed, the relevant item is deleted at the same time wherever this data is used.

There is a section that contains the user name in the area above the tabbar screens. Name field can be changed in this section. namespace
When it is changed, it is updated automatically in other tabbar pages.

Service Page;
This code defines a Service class that fetches data from the iTunes API by making a GET request to a specific URL that searches for "jack johnson". 
The data returned from this API call is in JSON format and is decoded into a Response object using JSONDecoder.

The fetchData function takes a callback function that is called when the data is successfully fetched and decoded. 
The function uses Alamofire, an HTTP networking library, to make the API request and asynchronously fetch the data. 
When the data is received, the function attempts to decode it using JSONDecoder. If the decoding fails, an error message is printed to the console.

The purpose of this code is to demonstrate how to use Alamofire and JSONDecoder to fetch and parse data from an external data source.

For example FirstVC;
The class has a few properties, including a viewModel of type FirstVM, a selectedItem of type TrackInfo (an object representing track information), and outlets to two UI elements (navBarView and firstTableView).

In the viewDidLoad method, the viewModel is used to set the table view's configuration, and a completion block is defined that will be called after data is fetched and loaded into the table view. 

There is also a block defined for when a table view cell is selected, which sets selectedItem to the selected item and performs a segue to the detail view controller.

There is also an observer defined for the changeText notification, which listens for updates to the text and posts a textUpdate notification with the updated text.

Finally, there is a prepare method that is called before performing a segue to the detail view controller. 
If the segue identifier matches "detailSegue", the selectedItem is unwrapped and passed to the updateUI method in the DetailVC.

And for example FirstTableViewCell;
In the awakeFromNib method, the backView UI element is styled to have a card view appearance.

There is a loadData method that takes a TrackInfo object as a parameter and sets the artistLabel, trackLabel, and cellImageView UI elements to display data from the object. 
The image is loaded from a URL using the SDWebImage library.

Finally, there is an overridden setSelected method that is called when the cell is selected, but it doesn't currently have any additional configuration beyond the superclass implementation.

![3](https://user-images.githubusercontent.com/44609894/224569771-5461a771-713e-48dd-80cf-8a75537dbd92.png)
![4](https://user-images.githubusercontent.com/44609894/224569774-260662ad-2c80-4b2e-a3c8-30bd739a90c3.png)
![5](https://user-images.githubusercontent.com/44609894/224569776-a0f915dc-c0ca-428a-b87e-6c6022edd9e9.png)
![6](https://user-images.githubusercontent.com/44609894/224569777-40563c9f-f615-4830-9607-628f189fe68c.png)
![2](https://user-images.githubusercontent.com/44609894/224569783-2af2426e-4a4b-4fbf-b5ad-dc17ca0ce704.png)
![1](https://user-images.githubusercontent.com/44609894/224569784-ec891b42-f9bd-4c26-bf50-913d17a57f78.png)


