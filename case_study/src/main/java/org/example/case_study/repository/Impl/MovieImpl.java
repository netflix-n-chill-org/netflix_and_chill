package org.example.case_study.repository.Impl;

import org.example.case_study.entity.Movie;
import org.example.case_study.entity.User;
import org.example.case_study.repository.IMovieRepository;

import java.sql.SQLException;
import java.util.List;

public class MovieImpl implements IMovieRepository {
    @Override
    public void addMovie(Movie movie) throws SQLException {
        
    }

    @Override
    public boolean movieUpdate(Movie movie) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteMovie(int id) throws SQLException {
        return false;
    }

    @Override
    public List<Movie> showAllMovies() {
        return null;
    }

    @Override
    public List<User> SearchForMovieName(String keyword) {
        return null;
    }
}
