<p align="center">
  <img src="https://raw.githubusercontent.com/victrme/Bonjourr/master/src/assets/bonjourr.png" width="50%"></img>
</p>

# Bonjourr for Safari

Xcode files for building Bonjourr as a Safari extension.

## Install

### Setup Xcode

1.  Clone original repository: [victrme/Bonjourr](https://github.com/victrme/Bonjourr).
2.  Install and build Bonjourr, [follow the instructions](https://github.com/victrme/Bonjourr?tab=readme-ov-file#run-locally) if needed.
3.  Make sure `./release/safari` exists with the necessary files.
4.  Launch Xcode. On the launcher, select: "Clone git repository..."
5.  Add a reference of the build created in `release/safari` to `Shared (Extension)`
6.  Build bonjourrStartpage for (macOS) or (iOS). A window with instructions should appear.

### MacOS development build

-   In Safari status bar, got to Safari > Preferences > Advanced tab
-   Show Develop menu in menu bar
-   Develop > Allow Unsigned Extensions

## Features not working

-   Bookmarks import: `browser.bookmarks` will never be available on Safari
-   Safari doesn't have access to most visited websites
