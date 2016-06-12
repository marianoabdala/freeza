As part of my latests interviewing process, I was asked to complete a coding challenge and was asked to made it public.

This is the result of such exercise. It is my believe that it showcases my coding and architecting skills.

A few notes/considerations:
- Why `freeza`? Names change often, so I give all my projects code names. Lately, I’ve been using [DBZ characters](https://en.wikipedia.org/wiki/Freeza).
- For the image downloads I turned `Allow arbitrary loads` instead of whitelisting domains because I don’t know where those images will be coming from. I’m no reddit API expert and it exceed the scope of this exercise.
- I did a round of testing for leaks and found none.
- As a performance improvement, downloaded thumbnails should be stored in disk and fetched from the table view cells instead of stored in the cell’s view model. It uses too much memory this way. I judge it, again, out of the scope of this exercise.

For the bonus points:
* Saving pictures in the picture gallery

Since I’m explicitly asked not to implement IMGUR API I can’t obtain the image, thus, can’t save it to the _picture gallery_.

* App state preservation/restoration
Would require a bit more effort than I’m ready to put into the exercise. Would require to store all model, view models, and state of the app. Some of those may become out of sync, specially paging… In short, too complex for the chosen architecture.

* Support iPhone 6/ 6+ screen size (hint: size classes)
iPhone 6/ 6+ already supported with autolayout.


#### Original request
```
Your assignment is to create a simple Reddit client that shows the top 50 entries fromwww.reddit.com/top .

To do this please follow this guidelines:

- Asume the latest platform and use Swift
- Use UITableView / UICollectionView to arrange the data.
- Please refrain from using AFNetworking, instead use NSURLSession 
- Support Landscape
- Use Storyboards

The app show be able to show data from each entry like :

- Title (at its full length, so take this into account when sizing your cells)
- Author
- entry date, following a format like “x hours ago” 
- A thumbnail for those who have a picture.
- Number of comments

In addition, for those having a picture (besides the thumbnail) , please allow the user to tap on the thumbnail to be sent to the full sized picture. You don’t have to implement the IMGUR API, so just opening the URL would be OK.

Bonus points will be awarded for (in no particular order):

- Pagination support
- Saving pictures in the picture gallery
- App state preservation/restoration
- Support iPhone 6/ 6+ screen size (hint: size classes)

Note:
Please refrain from using external libraries (by way of using CocoaPods and similar), as we want to see your coding skills as much as possible :)

Some resources

Reddit API : http://www.reddit.com/dev/api
Apigee :https://apigee.com/console/reddit
```
