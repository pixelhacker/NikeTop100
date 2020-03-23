## iOS Code Challenge ##
Create a sample iPhone app that displays the top 100 albums across all genres using Apple’s RSS
generator found here: https://rss.itunes.apple.com/en-us.

The app should:
* Use Auto Layout

The app should **NOT**:
* Use storyboards or nibs
* Use any third-party libraries
* Use SwiftUI or Combine

#### Expected behavior: ####
On launch, the user should see a UITableView showing one album per cell. Each cell should display the name of the album, the artist, and the album art (thumbnail image). Tapping on a cell should push another view controller onto the navigation stack where we see a larger image at the top of the screen and the same information that was shown on the cell, plus genre, release date, and copyright info below the image. A button should also be included on this second view that when tapped fast app switches to the album page in the iTunes store. The button should be centered horizontally and pinned 20 points from the bottom of the view and 20 points from the leading and trailing edges of the view. Unlike the first one, this “detail” view controller should NOT use a UITableView for layout.

#### Developer Notes ####
Made sure all of the expected behavior is fully functioning, as well as added some slight visual elements (borders, shadows, etc). Built to work on an iPhone SE as well. Added localization so that it currently works in English and French. Given more time I would add more unit tests and add UITableViewDataSourcePrefetching. 
