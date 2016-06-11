import UIKit

class EntryTableViewCell: UITableViewCell {

    static let cellId = "EntryTableViewCell"
    
    var entry: EntryViewModel? {
        
        didSet {
            
            self.configure()
        }
    }
    
    @IBOutlet private weak var entryTitleLabel: UILabel!
    
    private func configure() {
        
        self.entryTitleLabel.text = self.entry?.title
    }
}
