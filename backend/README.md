#  Backend API Specification

Deployed at https://songmatchappdev.herokuapp.com/
## GET
### Get list of songs by querying params of genre or mood or both
Examples:
```
GET https://songmatchappdev.herokuapp.com/getsongs?mood=sad&genre=indie

GET http://songmatchappdev.herokuapp.com/getsongs/?genre=pop

GET https://songmatchappdev.herokuapp.com/getsongs?mood=happy
```
### Get genre + mood by querying params of song id
```
GET https://songmatchappdev.herokuapp.com/song/{song_id}
```
## POST
### Input a song with genre and mood -> get genre and mood assigned to this song
```
Post request to https://songmatchappdev.herokuapp.com/song/ with request like below 

{
"title": xxx,
"artist": xxx,
"genre": xxx,
"mood": xxx,
}
```

## DELETE
### Delete a song in the list of songs in the output
```

Delete request to https://songmatchappdev.herokuapp.com/song/{song name}

```
##  And also some test routes 
1. https://songmatchappdev.herokuapp.com/tests/genres
2. https://songmatchappdev.herokuapp.com/tests/songs
3. https://songmatchappdev.herokuapp.com/tests/moods









