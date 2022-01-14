<p align="center">
  <img src="https://raw.githubusercontent.com/victrme/Bonjourr/master/src/assets/bonjourr.png" width="50%"></img>
</p>

# Install

### Start

- Clone this repo & the [original repo](https://github.com/victrme/Bonjourr)
- Open `Bonjourr Startpage.xcodeproj` in Xcode (version >13.0)
- Copy `manifest-safari.json` from original repo and rename `manifest.json`

### In Safari

- Safari > Preferences > Advanced tab
- **Show Develop menu in menu bar**
- Develop > **Allow Unsigned Extensions**


### If Extension Ressources are missing
- In `Bonjourr Startpage > Bonjourr Startpage Extension > Ressources`
- **Add Files to "Bonjourr Startpage Ext...**
- Select: `index.html` `settings.html` `/src/` `/locales/` & `manifest.json`
- Check only **Create folder references** & **Add to targets "Bonj... Extension"** (should be default)

# Features not working

- Bookmarks import (browser.bookmarks still not available on safari webExtension API)
- Settings synchronisation (settings saves in local but doesn't save on cloud)
- Something not listed here ? Open an [issue on the main repo](https://github.com/victrme/Bonjourr/issues) !

# Todo

- [ ] Localization for App window
- [ ] Fix popup removal styling bug
- [ ] Geolocation prompt or no geolocation by default ?
- [x] Replace auto-generated app-icon & AccentColor
