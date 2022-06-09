<p align="center">
  <img src="https://raw.githubusercontent.com/victrme/Bonjourr/master/src/assets/bonjourr.png" width="50%"></img>
</p>

# Install

### Start

-   Clone this repo & the [main repo](https://github.com/victrme/Bonjourr)
-   In that folder: `npm i` `npm run chrome`
-   Open `BonjourrStartpage.xcodeproj` in Xcode (version >13.0)
-   Link `release/chrome` files to `Shared (Extension)` in Xcode
-   Manually build for each changes in the main repo (😞)

### In Safari

-   Safari > Preferences > Advanced tab
-   **Show Develop menu in menu bar**
-   Develop > **Allow Unsigned Extensions**

# Features not working

-   Bookmarks import (browser.bookmarks still not available on safari webExtension API)
-   Settings synchronisation (settings saves in local but doesn't save on cloud)
-   Something not listed here ? Open an [issue on the main repo](https://github.com/victrme/Bonjourr/issues) !
