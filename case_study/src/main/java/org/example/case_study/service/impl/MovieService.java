package org.example.case_study.service.impl;

import org.example.case_study.entity.Movie;
import org.example.case_study.repository.Impl.MovieImpl;
import java.sql.SQLException;
import java.util.List;

public class MovieService {
    private MovieImpl movieImpl;

    public MovieService(MovieImpl movieImpl) {
        this.movieImpl = movieImpl;
    }

    public void addMovie(Movie movie) throws SQLException {
        movieImpl.addMovie(movie);
    }

    public boolean deleteMovie(int id) throws SQLException {
        return movieImpl.deleteMovie(id);
    }

    public List<Movie> showAllMovies() {
        return movieImpl.showAllMovies();
    }

    public void updateMovie(Movie movie) {
        movieImpl.updateMovie(movie);
    }

    public List<Movie> searchForMovie(String keyword) throws SQLException {
        try {
            return movieImpl.searchForMovie(keyword);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for movies", e);
        }
    }
}
