import UIKit

class EntryTableViewCell: UITableViewCell {

    static let cellId = "EntryTableViewCell"
    
    var entry: EntryViewModel? {
        
        didSet {
            
            self.configureForEntry()
        }
    }
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var commentsCountLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var entryTitleLabel: UILabel!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.configureViews()
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        
        self.configureViews()
    }
    private func configureViews() {
        
        func configureThumbnailImageView() {
        
            self.thumbnailImageView.layer.borderColor = UIColor.blackColor().CGColor
            self.thumbnailImageView.layer.borderWidth = 1
        }
        
        func configureCommentsCountLabel() {
            
            self.commentsCountLabel.layer.cornerRadius = self.commentsCountLabel.bounds.size.height / 2
        }
        
        configureThumbnailImageView()
        configureCommentsCountLabel()
    }
    
    private func configureForEntry() {
        
        guard let entry = self.entry else {
            
            return
        }
        
        self.thumbnailImageView.image = entry.thumbnail
        self.authorLabel.text = entry.author
        self.commentsCountLabel.text = entry.commentsCount
        self.ageLabel.text = entry.age
        self.entryTitleLabel.text = entry.title
        
        entry.loadThumbnail { 
            
            self.thumbnailImageView.image =  entry.thumbnail
        }
    }
}
