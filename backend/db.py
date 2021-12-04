from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()



association_table = db.Table(
    "association",
    db.Model.metadata,
    db.Column("song_id", db.Integer, db.ForeignKey("song.id")),
    db.Column("genre_id", db.Integer, db.ForeignKey("genre.id")),
    db.Column("mood_id", db.Integer, db.ForeignKey("mood.id")),
)

class Song(db.Model):
    __tablename__ = "song"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    artist = db.Column(db.String, nullable=False)
    album = db.Column(db.String, nullable=False)
    cover = db.Column(db.String, nullable=False)
    genre = db.relationship(
        "Genre", secondary=association_table, back_populates="songs"
    )
    mood = db.relationship(
        "Mood", secondary=association_table, back_populates="songs"
    )

    def __init__(self, **kwargs):
        self.title = kwargs.get("title")
        self.artist = kwargs.get("artist")
        self.album = kwargs.get("album")
        self.cover = kwargs.get("cover")

    def serialize(self):
        return {
            "title": self.title,
            "artist": self.artist,
            "album": self.album,
            "cover": self.cover,
            "genre": [g.sub_serialize() for g in self.genre],
            "mood": [m.sub_serialize() for m in self.mood],
        }

    def sub_serialize(self):
        return {
            "title": self.title,
            "artist": self.artist,
            "album": self.album,
            "cover": self.cover,
        }



class Genre(db.Model):
    __tablename__ = "genre"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    songs = db.relationship(
        "Song", secondary=association_table, back_populates="genre"
    )

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")

    def serialize(self):
        return {
            "name": self.name,
            "songs": [s.sub_serialize() for s in self.songs],
        }

    def sub_serialize(self):
        return{
            "name": self.name
        }


class Mood(db.Model):
    __tablename__ = "mood"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    songs = db.relationship(
        "Song", secondary = association_table, back_populates="mood"
    )

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")

    def serialize(self):
        return {
            "name": self.name,
            "songs": [s.sub_serialize() for s in self.songs],
        }

    def sub_serialize(self):
        return{
            "name": self.name
        }
