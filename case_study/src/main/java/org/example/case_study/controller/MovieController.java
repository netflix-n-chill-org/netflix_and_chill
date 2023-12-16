package org.example.case_study.controller;

import org.example.case_study.entity.Movie;
import org.example.case_study.repository.Impl.MovieImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class MovieController {
    private MovieImpl movieImpl;

    public MovieController() {
        movieImpl = new MovieImpl();
    }

    public void updateMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
//        Movie movie = new Movie(id);
//        movieImpl.updateMovie(movie);
    }}
