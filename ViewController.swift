/**
 Francis Jemuel A. Bergonia
 Xi Apps Inc. 2019
 
 Controller: The controller is the mediator that coordinates all the work.
 It accesses the data from the model and displays it with the views, listens to events and manipulates the data as necessary.
 
 Can you guess which class is your controller? That’s right: ViewController.
 */

import UIKit

final class ViewController: UIViewController {

  private enum Constants {
    static let CellIdentifier = "Cell"
  }
  
  private var currentAlbumIndex = 0
  private var currentAlbumData: [AlbumData]?
  private var allAlbums = [Album]()
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var undoBarButtonItem: UIBarButtonItem!
  @IBOutlet var trashBarButtonItem: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //1 Get a list of all the albums via the API. Remember, the plan is to use the facade of LibraryAPI rather than PersistencyManager directly!
    allAlbums = LibraryAPI.shared.getAlbums()
    
    //2 This is where you setup the UITableView. You declare that the view controller is the UITableView data source; therefore, all the information required by UITableView will be provided by the view controller. Note that you can actually set the delegate and datasource in a storyboard, if your table view is created there.
    tableView.dataSource = self
    
    //This loads the current album at app launch. And since currentAlbumIndex is set to 0, this shows the first album in the collection.
    showDataForAlbum(at: currentAlbumIndex)
    
  }
  
  
  //fetches the required album data from the array of albums. When you want to present the new data, you just need to call reloadData on the UITableView.
  
  private func showDataForAlbum(at index: Int) {
    
    // defensive code: make sure the requested index is lower than the amount of albums
    if (index < allAlbums.count && index > -1) {
      // fetch the album
      let album = allAlbums[index]
      // save the albums data to present it later in the tableview
      currentAlbumData = album.tableRepresentation
    } else {
      currentAlbumData = nil
    }
    // we have the data we need, let's refresh our tableview
    tableView.reloadData()
  }

}

extension ViewController: UITableViewDataSource {
  
  //returns the number of rows to display in the table view, which matches the number of items in the “decorated” representation of the album.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let albumData = currentAlbumData else {
      return 0
    }
    return albumData.count
  }
  
  //creates and returns a cell with the title and its value.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier, for: indexPath)
    if let albumData = currentAlbumData {
      let row = indexPath.row
      cell.textLabel!.text = albumData[row].title
      cell.detailTextLabel!.text = albumData[row].value
    }
    return cell
  }
}
