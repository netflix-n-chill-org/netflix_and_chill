package org.example.case_study.repository.Impl;

import org.example.case_study.controller.ConnectionConfig;
import org.example.case_study.entity.Movie;
import org.example.case_study.repository.IMovieRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieImpl implements IMovieRepository {
    private static final String url = "jdbc:mysql://localhost:3306/case_study_03";
    private static final String userName = "root";
    private static final String password = "thien306";

    private static final String ADD_MOVIE_SQL = "INSERT INTO movie(title, genre, releaseYear, rating) VALUE (?,?,?,?)";
    private static final String UPDATE_MOVIE_SQL = "UPDATE MOVIE SET TITLE = ?, GENRE = ?, RELEASEYEAR = ?, RATING = ? WHERE ID = ?";
    private static final String DELETE_MOVIE_SQL = "UPDATE movie set status = 1 where id = ?;";
    private static final String SHOW_ALL_MOVIE_SQL = "SELECT id, title, genre, releaseYear, rating FROM movie";
    private static final String SEARCH_FOR_MOVIE_SQL = "SELECT title, genre, releaseYear, rating FROM movie " +
            "WHERE title LIKE ? OR genre LIKE ? OR releaseYear LIKE ? OR rating LIKE ?;";


    @Override
    public void addMovie(Movie movie) throws SQLException {

        Connection connection = ConnectionConfig.getConnection();
        System.out.println(ADD_MOVIE_SQL);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_MOVIE_SQL);
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getGenre());
            preparedStatement.setInt(3, movie.getReleaseYear());
            preparedStatement.setDouble(4, movie.getRating());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.print("Movie added successfully.");
            } else {
                System.out.print("Failed to add the movie");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    @Override
    public boolean updateMovie(Movie movie) {
        Connection connection = ConnectionConfig.getConnection();

        try (Connection connections = ConnectionConfig.getConnection();
             PreparedStatement statement = connections.prepareStatement(UPDATE_MOVIE_SQL)) {
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getGenre());
            statement.setInt(3, movie.getReleaseYear());
            statement.setFloat(4, movie.getRating());
            statement.setInt(5, movie.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public boolean deleteMovie(int id) throws SQLException {
        boolean movieDeleted;

        try (Connection connection = ConnectionConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MOVIE_SQL)) {

            statement.setInt(1, id);
            movieDeleted = statement.executeUpdate() > 0;
        }
        return movieDeleted;
    }


    @Override
    public List<Movie> showAllMovies() {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = ConnectionConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_MOVIE_SQL)) {

            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("releaseYear");
                float rating = resultSet.getFloat("rating");
                movieList.add(new Movie(id, title, genre, releaseYear, rating));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movieList;
    }

    @Override
    public List<Movie> searchForMovie(String keyword) throws SQLException {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = ConnectionConfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FOR_MOVIE_SQL)) {

            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, "%" + keyword + "%");
            preparedStatement.setString(3, "%" + keyword + "%");
            preparedStatement.setString(4, "%" + keyword + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("releaseYear");
                float rating = resultSet.getFloat("rating");

                Movie movie = new Movie(title, genre, releaseYear, rating);
                movieList.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movieList;
    }
}
