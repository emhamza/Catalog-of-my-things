CREATE DATABASE catalog;

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

-- Create author table

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(255),
    last_name varchar(255),
    primary key (id)
);

-- Create game table

CREATE TABLE Game(
    id int generated always as identity,
    multiplayer varchar(255),
    last_played_at date,
    published_date date,
    archived boolean,
    author_id int,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
    primary key (id)
);

-- create schema for book
CREATE TABLE books (
  id INT PRIMARY KEY,
  cover_state VARCHAR(255),
  FOREIGN KEY (id) REFERENCES items(id)
);

-- schema for labels
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);
