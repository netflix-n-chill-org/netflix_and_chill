package com.example.case_study_03.Model.utlis;

import com.example.case_study_03.Model.entity.Movie;

import java.sql.SQLException;
import java.util.List;

public interface IUtilityMovieDao {
    boolean addMovie(Movie movie) throws SQLException;

    boolean updateMovie(Movie movie) throws SQLException;

    boolean deleteMovie (int id) throws SQLException;

    List<Movie> showAllMovies();

    List<Movie> searchForMovie(String keyword) throws SQLException;
}
