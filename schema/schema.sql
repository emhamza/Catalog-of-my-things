-- Create genres table
CREATE TABLE genres (
  id INT Generated ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
);

-- Create music albums table
CREATE TABLE music_albums (
  id INT Generated ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL DEFAULT DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);