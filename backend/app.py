import json
import os

from sqlalchemy.orm import contains_eager

from db import db
from db import Song
from db import Genre
from db import Mood
from flask import Flask
from flask import request
from sqlalchemy import event
from sqlalchemy import func

db_filename = "songs.db"
app = Flask(__name__)


app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///song_recommendation.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# t, g, m, a, al, c
initial_Data = [('The Feels', 'Pop', 'Energetic','Twice','Formula of Love: O+T=<3', 'formula of love: o+t=<3'),
                ('WAP', 'Hip Hop', 'Energetic', 'Cardi B', 'WAP', 'wap'),
                ('DISCO','Indie','Energetic', 'Surf Curse', 'Heaven Surrounds You', 'heaven surrounds you'),
                ('Speechless',	'Pop',	'Calm','Naomi Scott', 'Aladdin', 'aladdin'),
                ("Nothin I Won't Do",	'Hip Hop','Sad','Russ', "Nothin I Won't Do","nothin i won't do"),
                ('Forever Dumb','Indie', 'Sad', 'Surf Curse','Sad Boys EP','sad boys ep'),
                ('Thinking out Loud', 	'Pop',  'Calm',	'Ed Sheeran','x','x'),
                ('Wu-Tang Forever',	'Hip Hop',	'Calm',	'Drake','Nothing Was the Same', 'nothing was the same'),
                ('Hide & Seek',	'Indie',	'Sad',	'Etta Marcus','View from the Bridge','view from the bridge'),
                ('Beautiful Day',	'Rock',	'Happy',	'U2', "All That You Can't Leave Behind", "all that you can't leave behind"),
                ("Livin' on a Prayer",	'Rock',	'Happy',	'Bon Jovi', 'Slippery When Wet', 'slippery when wet')]

db.init_app(app)
with app.app_context():
    db.create_all()

    for t, g, m, a, al, c in initial_Data:
        song = Song.query.filter_by(title=t).first()
        if song is None:
            newsong = Song(title=t, artist=a, album=al, cover=c)
            new_genre=Genre.query.filter_by(name=g).first()
            if new_genre is None:
                new_genre = Genre(name=g)
                db.session.add(new_genre)
            new_genre.songs.append(newsong)
            new_mood=Mood.query.filter_by(name=m).first()
            if new_mood is None:
                new_mood = Mood(name=m)
                db.session.add(new_mood)
            new_mood.songs.append(newsong)
            db.session.commit()



def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(message, code=404):
    return json.dumps({"error": message}), code



#input song, output genre / mood; get, completed
@app.route("/song/<int:song_id>/", methods=["GET"])
def get_gm(song_id):
    song = Song.query.filter_by(id=song_id).first()
    if song is None:
        return failure_response("Song not found!")
    return success_response(song.serialize())

#input song, assign it to genre / mood; post, finish implementing
@app.route("/song/", methods=["POST"])
def create_song():
    body = json.loads(request.data)
    if not body.get("title") or not body.get("artist") or not body.get("genre") or not body.get("mood"):
        return failure_response("Please input a song title, artist, genre and mood!", 400)

    #create song
    new_song = Song(title=body.get("title"), artist=body.get("artist"))
    db.session.add(new_song)

    #assign song to genre
    genre=body.get("genre")
    new_genre=Genre.query.filter_by(name=genre).first()
    if new_genre is None:
        new_genre = Genre(name=genre)
        db.session.add(new_genre)
    new_genre.songs.append(new_song)

    #assign song to mood
    mood=body.get("mood")
    new_mood=Mood.query.filter_by(name=mood).first()
    if new_mood is None:
        new_mood = Mood(name=mood)
        db.session.add(new_mood)
    new_mood.songs.append(new_song)

    db.session.commit()
    return success_response(new_song.serialize(), 201)


#delete song in list of songs of output; post
@app.route("/song/<song_title>", methods=["DELETE"])
def delete_song(song_title):
    song = Song.query.filter_by(id=song_title).first()
    if song is None:
        return failure_response("Song not found!")

    db.session.delete(song)
    db.session.commit()
    return success_response(song.serialize())

# input genre or mood, get list of songs output
@app.route("/getsongs/", methods= ["GET"])
def get_song_list():
    genre  = request.args.get('genre', None)
    mood  = request.args.get('mood', None)

    if genre is not None and mood is not None:
        songs= Song.query.join(Song.mood, aliased = True).filter(func.lower(Mood.name)== func.lower(mood)).join(Song.genre, aliased = True).filter(func.lower(Genre.name)== func.lower(genre))
    elif genre is None:
        songs= Song.query.join(Song.mood, aliased = True).filter(func.lower(Mood.name)== func.lower(mood))
    elif mood is None:
        songs = Song.query.join(Song.genre, aliased = True).filter(func.lower(Genre.name)== func.lower(genre))
    else:
        return failure_response("No input!")

    data = [s.serialize() for s in songs]
    return success_response(
        {"songs": data}
    )

#tests
@app.route("/tests/genres/", methods=["GET"])
def get_genres():
    return success_response(
        {"genres": [g.serialize() for g in Genre.query.all()]}
    )

@app.route("/tests/songs/", methods=["GET"])
def get_songs():
    return success_response(
        {"songs": [s.serialize() for s in Song.query.all()]}
    )

@app.route("/tests/moods/", methods=["GET"])
def get_moods():
    return success_response(
        {"moods": [m.serialize() for m in Mood.query.all()]}
    )

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
