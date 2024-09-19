-- Crear la base de datos
CREATE DATABASE music_player;
USE music_player;

-- Crear la tabla de usuarios
CREATE TABLE `users` (
  `id_user` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `profile_picture` VARCHAR(255), -- Ruta de la imagen de perfil
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de canciones
CREATE TABLE `songs` (
  `id_song` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `duration` FLOAT NOT NULL,
  `album` VARCHAR(255),
  `gender` VARCHAR(255),
  `file_location` VARCHAR(255), -- Ruta o URL del archivo de la canción
  `add_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de listas de reproducción
CREATE TABLE `list_playlist` (
  `id_playL` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `total_songs` INTEGER DEFAULT 0,
  `id_user` INTEGER,
  `playlist_picture` VARCHAR(255), -- Imagen para la lista de reproducción
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id_user`) ON DELETE CASCADE
);

-- Crear la tabla de asociación entre canciones y listas de reproducción
CREATE TABLE `playlist` (
  `id_playlist` INTEGER,
  `id_song` INTEGER,
  `date_add` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `duration_song` FLOAT NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_song`),
  FOREIGN KEY (`id_playlist`) REFERENCES `list_playlist`(`id_playL`) ON DELETE CASCADE,
  FOREIGN KEY (`id_song`) REFERENCES `songs`(`id_song`) ON DELETE CASCADE
);
