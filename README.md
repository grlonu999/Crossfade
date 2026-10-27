CROSSFADE
One player for your Spotify and SoundCloud music, in its own window.

START IT (Windows)
  Double-click Crossfade.bat. Crossfade opens in its own window, with no
  tabs or address bar, and closes its background helper when you close it.
  It uses Microsoft Edge or Google Chrome, which Windows already has.

  Optional: double-click Make-Desktop-Shortcut.bat to put a Crossfade icon
  on your desktop. Pin that to the taskbar if you like.

START IT (Mac/Linux)
  In this folder run:  python3 -m http.server 8888 --bind 127.0.0.1
  then open http://127.0.0.1:8888/ in Chrome or Edge.

Crossfade keeps its own settings, separate from your normal browser. If you
used an earlier version in your browser, enter your Spotify Client ID and
SoundCloud links again the first time.

DEMO TRACKS
  Eight short original pieces play right away so you can try the player.
  Turn them off under Connections once your own music is in.

CONNECT SPOTIFY (needs Spotify Premium to play music)
  1. Go to https://developer.spotify.com/dashboard and create an app.
     Tick "Web API" and "Web Playback SDK". The app owner needs Premium.
  2. Add this redirect URI to the app: http://127.0.0.1:8888/
  3. Copy the app's Client ID, open Crossfade > Connections, paste it,
     and click Connect Spotify.
  Your Liked Songs and playlists you own or collaborate on will load.
  Spotify limits new apps to 5 users, which is fine for personal use.

CONNECT SOUNDCLOUD
  Open Connections and paste public track, playlist or profile links, one
  per line. A profile link brings in that account's own uploads only.
  "Add my likes" asks SoundCloud's player for your public likes. SoundCloud
  does not document this, so it may come back empty. If it does, paste the
  links of the tracks you liked, or add a public playlist that holds them.
  SoundCloud only gives API keys to Artist Pro accounts, so Crossfade reads
  links through SoundCloud's own embedded player instead.

CONNECT YOUTUBE MUSIC
  1. Open Connections and find the YouTube Music box.
  2. In YouTube Music, open a song or playlist, choose Share, then Copy link.
  3. Paste one or more links (one per line) and press Add links.
  Playlists must be set to Public or Unlisted. Crossfade reads up to 200 songs
  from each one. YouTube does not let other apps read your library, liked songs
  or private playlists, so those cannot be connected directly. Add them to a
  playlist you set to Unlisted and paste that link instead.
  Songs play through YouTube's own embedded player, so they need an internet
  connection, and songs whose owner blocks playing outside YouTube are skipped.

HIDING LINKS
  In Connections, the SoundCloud and YouTube Music boxes each have a Hide links
  button that tucks the list of added links away (and Show brings it back).
  Hiding only hides the list; your songs stay in your library.

THEMES
  Click the palette button next to the queue button (bottom right), or open
  Connections > Appearance. Pick one:
    Auto           follows your system light or dark setting
    Light, Dark    plain light and dark
    Coded          black and green terminal
    Glassy         frosted glass over purple, pink and blue light
    Frutiger Aero  glossy sky blue, bubbles and green hills
    Halloween      pumpkin orange on midnight purple, with a cobweb
    Christmas      pine green and gold, with falling snow and a candy-cane edge
  Crossfade remembers your choice. Halloween and Christmas use the normal font
  like the other themes; pick a different font in Settings if you like.

SETTINGS (left sidebar > Settings)
  My music
          Add your own mp3 and wav files: click "Add mp3 or wav files" or drop
          them onto the box. Titles, artists and cover art are read from the
          file's tags when it has them (otherwise the file name is used, and
          "Artist - Title" names are split). Songs are stored inside Crossfade
          on this computer (up to 150 MB each) and appear in Songs, Search and
          Playlists under "My files". Removing a song only removes it from
          Crossfade, never from your computer. Keep using Crossfade.bat so the
          app always opens at the same address, or your songs will not show up.
  Theme   Pick any theme, or Custom.
  Font    Theme default, Standard, Rounded, Easy reading, Serif, Monospace or
          System. A font you pick is used with every theme; "Theme default"
          lets each theme choose its own.
  Listening stats
          Keeps count of your most listened to artists, most played songs and
          genres, with how many times you have played each. A song counts as a
          play after 30 seconds of listening (or half of it, if it is shorter).
          Every artist on a song gets the play. Genres come from your own files'
          tags, SoundCloud, and Spotify when it shares them; YouTube does not
          provide genres. Use the tick box to pause tracking, and Reset stats to
          start again. Stats are stored on this computer only.
  Background picture
          Press "Use my own background picture" under the themes to choose a PNG,
          JPEG or GIF from your computer. It switches to the Custom theme.
  Custom theme
          Change the background, panel, text and accent colours. Start from
          Light or Dark, or just edit the colours. You can also add a
          background image (PNG, JPEG or GIF, up to 20 MB) and set how it
          fits, how much to dim it, and whether panels are frosted glass.
          A warning appears if your text colour is hard to read.
  Fonts other than System/Monospace load from Google Fonts, so they need an
  internet connection.

IMAGE WIDGET
  A small box in the left sidebar lets you add your own picture. Click it or
  drop a PNG, JPEG or GIF onto Crossfade (anywhere in the window).
  Hover over the picture to see the controls:
    Drag the picture, or the dots on the toolbar, to move it anywhere.
    Drag the round dot on its corner, or use the slider, to make it bigger or smaller.
    Upload icon swaps the picture. Bin removes it. X hides the widget, and a
    small tab on the right edge brings it back.
  Keyboard: Tab to the dots on the toolbar and use the arrow keys to move it,
  and Tab to the round corner dot and use the arrow keys to resize it.
  Large PNG and JPEG pictures are shrunk to 1600 pixels on their longest side.
  GIFs keep their animation. Pictures can be up to 20 MB.
  The picture and its size and position are saved on this computer and are
  there the next time you open Crossfade.

SORTING
  Songs, every playlist, Liked Songs and My Files have a "Sort by" menu: Default
  order, Title, Artist, Album, Date added, Duration, Most played or Source. The
  button next to it reverses the order. Each list remembers its own sorting, and
  Play, Shuffle and the queue follow the order you see.
  Date added comes from Spotify for your playlists and Liked Songs, from the
  day you added a song to one of your own playlists, and from the day you added
  a SoundCloud or YouTube Music link or an uploaded file. Songs you linked
  before this update use the day you added that link.

PLAYLISTS
  Playlists > New playlist makes your own playlist. Use the three-dot menu on
  any song to add it, and the queue's Save button to keep what is queued.
  One playlist can hold Spotify and SoundCloud songs together. SoundCloud
  cannot be edited from here, so your own playlists live in Crossfade only.
  To see a SoundCloud playlist, add its link under Connections.

PRIVACY
  Everything stays on your computer. Your Spotify sign-in token is stored in
  Crossfade's own profile folder (%LOCALAPPDATA%\Crossfade). Connections >
  Disconnect removes it.

CHANGING THE PORT
  If port 8888 is busy, change the number in Crossfade.ps1 and add the new
  redirect URI in the Spotify dashboard.
