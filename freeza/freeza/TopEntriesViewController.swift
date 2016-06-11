import Foundation
import UIKit

class TopEntriesViewController: UITableViewController {

    private let viewModel = TopEntriesViewModel(withClient: RedditClient())
    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    private let errorLabel = UILabel()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureViews()
        
        self.activityIndicatorView.startAnimating()
        self.viewModel.loadEntries { 
            
            self.entriesReloaded()
        }
    }
    
    func dismissErrorToolbar() {
        
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    private func configureViews() {

        func configureActivityIndicatorView() {
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.activityIndicatorView)
        }

        func configureTableView() {
            
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 44.0 //TODO: Probably more.
        }
        
        func configureToolbar() {
            
            self.errorLabel.frame = CGRectMake(0, 0, 200, 22) //TODO: Make sure this works for all device sizes.
            let errorItem = UIBarButtonItem(customView: self.errorLabel)
            let spaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            let closeItem = UIBarButtonItem(image: UIImage(named: "close-button"), style: .Plain, target: self, action: #selector(TopEntriesViewController.dismissErrorToolbar))
            
            self.toolbarItems = [errorItem, spaceItem, closeItem]
        }
        
        configureActivityIndicatorView()
        configureTableView()
        configureToolbar()
    }
    
    private func entriesReloaded() {
        
        self.activityIndicatorView.stopAnimating()
        self.tableView.reloadData()
        
        if self.viewModel.hasError {

            self.errorLabel.text = self.viewModel.errorMessage
            self.navigationController?.setToolbarHidden(false, animated: true)
        }
    }
}

extension TopEntriesViewController { // UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let entryTableViewCell = tableView.dequeueReusableCellWithIdentifier(EntryTableViewCell.cellId, forIndexPath: indexPath) as! EntryTableViewCell
        
        entryTableViewCell.entry = self.viewModel.entries[indexPath.row]
        
        return entryTableViewCell
    }
}
