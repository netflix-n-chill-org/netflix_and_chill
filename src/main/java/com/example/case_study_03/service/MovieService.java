package com.example.case_study_03.service;

import com.example.case_study_03.Model.entity.Movie;
import com.example.case_study_03.repository.MovieRepository;

import java.sql.SQLException;
import java.util.List;

public class MovieService {
    private MovieRepository movieRepository;

    public MovieService(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }

    public void addMovie(Movie movie) throws SQLException {
        movieRepository.addMovie(movie);
    }

    public boolean deleteMovie(int id) throws SQLException {
        return movieRepository.deleteMovie(id);
    }

    public List<Movie> showAllMovies() {
        return movieRepository.showAllMovies();
    }

    public void updateMovie(Movie movie) {
        movieRepository.updateMovie(movie);
    }

    public List<Movie> searchForMovie(String keyword) throws SQLException {
        try {
            return movieRepository.searchForMovie(keyword);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for movies", e);
        }
    }
}
