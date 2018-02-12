import Foundation

class TopEntriesViewModel {
    
    var hasError = false
    var errorMessage: String? = nil
    var entries = [EntryViewModel]()

    private let client: Client
    private var afterTag: String? = nil

    init(withClient client: Client) {
        
        self.client = client
    }
    
    func loadEntries(withCompletion completionHandler: @escaping () -> ()) {
        
        self.client.fetchTop(after: self.afterTag, completionHandler: { [weak self] responseDictionary in
            
                guard let strongSelf = self else {
                    
                    return
                }
            
                guard let data = responseDictionary["data"] as? [String: AnyObject],
                    let children = data["children"] as? [[String:AnyObject]] else {
                    
                    strongSelf.hasError = true
                    strongSelf.errorMessage = "Invalid responseDictionary."
                        
                    return
                }
            
                strongSelf.afterTag = data["after"] as? String
            
                let newEntries = children.map { dictionary -> EntryViewModel in

                    // Empty [String: AnyObject] dataDictionary will result in a non-nill EntryViewModel
                    // with hasErrors set to true.
                    let dataDictionary = dictionary["data"] as? [String: AnyObject] ?? [String: AnyObject]()
                    
                    let entryModel = EntryModel(withDictionary: dataDictionary)
                    let entryViewModel = EntryViewModel(withModel: entryModel)
                    
                    return entryViewModel
                }
            
            strongSelf.entries.append(contentsOf: newEntries)
            
                strongSelf.hasError = false
                strongSelf.errorMessage = nil

            DispatchQueue.main.async() {
                    
                    completionHandler()
                }
            
            }, errorHandler: { [weak self] message in
                
                guard let strongSelf = self else {
                    
                    return
                }

                strongSelf.hasError = true
                strongSelf.errorMessage = message
                
                DispatchQueue.main.async() {
                    
                    completionHandler()
                }
        })
    }
}
