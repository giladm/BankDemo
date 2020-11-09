# Bank Demo  
  
### Description  
- Project includes 2 pages for the user.  
- The first page presents the following information:  
  - Name  
  - Date and Time (updated dynamically every minute )  
  - An Empty label, which is updated dynamically  
  - A Button to open the second page  
  
- The second page contains two tabs:  
  - First tab shows RSS feed for [cnn.com >Travel](http://rss.cnn.com/rss/edition_travel.rss)  
  - Second tab shows a unification feed for [cnn.com >Sport](http://rss.cnn.com/rss/edition_sport.rss) and [cnn.com >Entertainment](http://rss.cnn.com/rss/edition_entertainment.rss)  
  - Each feed item's background is colored with a different color  
  - Selecting a feed (either tab) lists the feed items and updating the label on the first page.
- The empty label on the page is updated based on the feed selected from the second page and is clickable
  - Clicking on this label shows the last opened feed from the second page  
- The application checks each RSS source every 5 seconds for an update. The application updates the feed immediately once the feed was updated.


### Testing
- App was developed in SwiftUI environment,  compiled with Xcode version 12.1 and tested on Simulator running iOS 14.1
- To test the app
  - Clone the repository
  - Open project in Xcode
  - Comile and run
