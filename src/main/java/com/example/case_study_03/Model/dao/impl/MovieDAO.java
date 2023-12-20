package com.example.case_study_03.Model.dao.impl;

import com.example.case_study_03.Model.dao.MyConnection;
import com.example.case_study_03.Model.entity.Movie;
import com.example.case_study_03.Model.utlis.IUtilityMovieDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.example.case_study_03.Model.dao.MyConnection.getConnection;

public class MovieDAO  implements IUtilityMovieDao {
    private static final String ADD_MOVIE_SQL = "INSERT INTO movie(title, genre, releaseYear, rating, english_title, img) VALUE (?,?,?,?,?,?)";
    private static final String UPDATE_MOVIE_SQL = "UPDATE MOVIE SET TITLE = ?, ENGLISH_TITLE = ?, GENRE = ?, RELEASEYEAR = ?, RATING = ?, IMG = ? WHERE ID = ?";
    private static final String SELECT_MOVIE_BY_ID = "select id, title, genre, releaseYear, rating, img, english_title from movie where id = ?";
    private static final String SELECT_ALL_MOVIE = "select * from movie";
    private static final String DELETE_MOVIE_SQL = "UPDATE movie set status = 1 where id = ?;";
    private static final String SHOW_ALL_MOVIE_SQL = "SELECT * FROM movie where status = 0";
    private static final String SEARCH_FOR_MOVIE_SQL = "SELECT title, genre, releaseYear, rating, english_title FROM movie " +
            "WHERE title LIKE ? OR genre LIKE ? OR releaseYear LIKE ? OR rating LIKE ? OR english_title LIKE ?;";
    @Override
    public boolean addMovie(Movie movie) throws SQLException {
        Connection connection = getConnection();
        System.out.println(ADD_MOVIE_SQL);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_MOVIE_SQL);
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getGenre());
            preparedStatement.setInt(3, movie.getReleaseYear());
            preparedStatement.setDouble(4, movie.getRating());
            preparedStatement.setString(5, movie.getEnglishTitle());
            preparedStatement.setString(6, movie.getImg());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.print("Movie added successfully.");
                return true;
            } else {
                System.out.print("Failed to add the movie");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    @Override
    public boolean updateMovie(Movie movie) throws SQLException {
        Connection connection = getConnection();
        try (Connection connections = MyConnection.getConnection();
             PreparedStatement statement = connections.prepareStatement(UPDATE_MOVIE_SQL)) {

            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getEnglishTitle());
            statement.setString(3, movie.getGenre());
            statement.setInt(4, movie.getReleaseYear());
            statement.setFloat(5, movie.getRating());
            statement.setString(6, movie.getImg());
            statement.setInt(7, movie.getId());

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

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MOVIE_SQL)) {

            statement.setInt(1, id);
            movieDeleted = statement.executeUpdate() > 0;
        }
        return movieDeleted;
    }

    @Override
    public List<Movie> showAllMovies() {
        List<Movie> movieList = new ArrayList<>();
        try (Connection connection = MyConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ALL_MOVIE_SQL)) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("releaseYear");
                String img = resultSet.getString("img");
                float rating = resultSet.getFloat("rating");
                String englishTitle = resultSet.getString("english_title");
                movieList.add(new Movie(id, title, englishTitle, genre, releaseYear, rating, img));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movieList;
    }

    @Override
    public List<Movie> searchForMovie(String keyword) throws SQLException {
        List<Movie> movieList = new ArrayList<>();
        try (   Connection connection = MyConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FOR_MOVIE_SQL)) {
            String keywordPattern = "%" + keyword + "%";
            for (int i = 1; i <= 5; i++) {
                preparedStatement.setString(i, keywordPattern);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("releaseYear");
                float rating = resultSet.getFloat("rating");
                String englishTitle = resultSet.getString("english_title");
                Movie movie = new Movie(title, genre, releaseYear, rating, englishTitle);
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;

    }
    public Movie selectMovie(int id) {
        Movie movie = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idMovie = Integer.parseInt( resultSet.getString("id"));
                String img = resultSet.getString("img");
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                int releaseYear = resultSet.getInt("releaseYear");
                float rating = resultSet.getFloat("rating");
                String englishTitle = resultSet.getString("english_title");
                movie = new Movie(id, title, englishTitle, genre, releaseYear, rating, img);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return movie;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error code: " + ((SQLException) e).getErrorCode());
                System.err.println("Massage: " + e.getMessage());
                Throwable t = ex.getCause();

                while (t != null) {
                    System.out.println("Cause" + t);
                    t = t.getCause();
                }
            }
        }
    }
}
