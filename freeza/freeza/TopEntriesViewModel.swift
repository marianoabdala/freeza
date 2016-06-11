import Foundation

class TopEntriesViewModel {
    
    var hasError = false
    var errorMessage: String? = nil
    var entries = [EntryViewModel]()

    private let client: Client

    init(withClient client: Client) {
        
        self.client = client
    }
    
    func loadEntries(withCompletion completionHandler:() -> ()) {
        
        self.client.fetchTop(withCompletion: { [weak self] responseDictionary in
            
                guard let strongSelf = self else {
                    
                    return
                }
            
                guard let data = responseDictionary["data"] as? [String: AnyObject],
                    children = data["children"] as? [[String:AnyObject]] else {
                    
                    strongSelf.hasError = true
                    strongSelf.errorMessage = "Invalid responseDictionary."
                        
                    return
                }
                
                strongSelf.entries = children.map { dictionary in

                    // Empty [String: AnyObject] dataDictionary will result in a non-nill EntryViewModel
                    // with hasErrors set to true.
                    let dataDictionary = dictionary["data"] as? [String: AnyObject] ?? [String: AnyObject]()
                    
                    let entryModel = EntryModel(withDictionary: dataDictionary)
                    let entryViewModel = EntryViewModel(withModel: entryModel)
                    
                    return entryViewModel
                }
                
                strongSelf.hasError = false
                strongSelf.errorMessage = nil

                dispatch_async(dispatch_get_main_queue()) {
                    
                    completionHandler()
                }
            
            }, errorHandler: { [weak self] message in
                
                guard let strongSelf = self else {
                    
                    return
                }

                strongSelf.hasError = true
                strongSelf.errorMessage = message
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    completionHandler()
                }
        })
    }
}
