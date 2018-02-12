import Foundation

extension Date {
    
    func age(sinceDate presentDate: Date = Date()) -> String {
        
        let secondsAgo = Int(presentDate.timeIntervalSince(self))
        
        if secondsAgo < 0 {
            
            //Not expecting this to happen in this app, but must be prepared.
            return "The future"

        } else if secondsAgo == 0 {

            return "Now"
            
        } else if secondsAgo == 1 {
            
            return "A second ago"
            
        } else if secondsAgo < 60 {
            
            return "\(secondsAgo) seconds ago"

        } else if secondsAgo < 2 * 60 {
            
            return "A minute ago"

        } else if secondsAgo < 60 * 60 {
            
            return "\(secondsAgo / 60) minutes ago"

        } else if secondsAgo < 2 * 60 * 60 {
            
            return "An hour ago"

        } else if secondsAgo < 24 * 60 * 60 {
            
            return "\(secondsAgo / (60 * 60)) hours ago"

        } else if secondsAgo < 2 * 24 * 60 * 60 {
            
            return "A day ago"

        } else if secondsAgo < 6 * 24 * 60 * 60 {
            
            return "\(secondsAgo / (24 * 60 * 60)) days ago"
            
        } else {
            
            return "A long time ago"
        }
    }
}
