# AppDevHack-songmatch
Team Members:
Lily Pham, lnp35; Elizabeth Tang, et362; Heitung Sun, hs835; Emily Wang, eyw23; Jiejun Zhang, jz2252

App Name: SongMatch
Connecting unique users to unique music

![screen1](https://user-images.githubusercontent.com/43019442/144697109-340e45b2-8bcb-41bf-808a-ef367557471e.png)
![screen2](https://user-images.githubusercontent.com/43019442/144697110-4d8e84ee-f041-4f72-8bfd-0102361de203.png)


Our app allows users to input their mood and/or preferred genre to generate a playlist from our database of songs. 

App Description:
  
  Our app can generate a playlist according to the mood and genre the users input. We have five screens: The homepage, the current song list page, the mood page, the genre page, and the generated song list page. There are two buttons on the homepage. By clicking to the "Your current song list" button, the users will be navigated to a list of songs that we currently have in our database. By click the other button, which is "Generate your song!", the users will be led to the mood page where they can choose between the four moods we have for now. When they click on "next", they will be led to the Genre page where they can choose a genre they like. When they click on the "OK" button, they will see a page with the songs generated based on their choice of mood and genre.

IOS Requirements:
  1. We used NSLayoutConstraint to position all of our app functions.
  2. Our playlist is displayed in a UITableView
  3. Our app has five screens and we used UINavigationController to navigate through them.
  4. Our app has integrated with an API written by our backend members.


Backend Requirements:
  1. We have API specification for each route in readme.md in our git repository
  2. We have at least 4 routes as specified in readme
  3. We have tables for genre, mood, and song and relationship song-genre, song-mood
  4. We deploy to Heroku at https://songmatchappdev.herokuapp.com/




Please note is that if there are no songs in the database that belong to an input category, the final playlist will be empty.

