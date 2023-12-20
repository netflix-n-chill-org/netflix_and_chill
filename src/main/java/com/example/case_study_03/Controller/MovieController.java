package com.example.case_study_03.Controller;
import com.example.case_study_03.Model.dao.impl.MovieDAO;
import com.example.case_study_03.Model.entity.Movie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "MovieServlet", urlPatterns = "/movie")
public class MovieController extends HttpServlet {
    private static final long serialVersionUID = 1l;
    private MovieDAO movieDAO;

    public void init() {
        movieDAO = new MovieDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    addMovie(request, response);
                    break;
                case "update":
                    updateMovie(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "exit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteMovie(request, response);
                    break;
                case "show-movie":
                    showMoviePage(request, response);
                    break;
                default:
                    listMovie(request, response);
                    break;
            }
        } catch (SQLException ex) {

            throw new ServletException(ex);
        }
    }


    private void addMovie(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        try {
            String title = request.getParameter("titleMovie");
            String englishTitle = request.getParameter("titleEnglishMovie");
            String genre = request.getParameter("genreMovie");
            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
            float rating = Float.parseFloat(request.getParameter("ratingMovie"));
            String img = request.getParameter("imgMovie");
            if (movieDAO != null) {
                Movie newMovie = new Movie(title, englishTitle, genre, releaseYear, rating, img);
                if (movieDAO.addMovie(newMovie)) {
//                    response.sendRedirect("/movie");
                    request.setAttribute("successMessage", "Add movie successful");
                    listMovie(request, response);

                } else {
                    response.getWriter().println("Failed to add the movie.");
                }
            } else {
                response.getWriter().println("Movie repository is not initialized.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid format for release year or rating.");
        }
    }

    private void updateMovie(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String englishTitle = request.getParameter("english_title");
            String genre = request.getParameter("genre");
            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
            float rating = Float.parseFloat(request.getParameter("rating"));
            String img = request.getParameter("img");

            if (title == null || genre == null) {
                response.getWriter().println("Invalid data. Title and genre are required.");
                return;
            }
            Movie movieToUpdate;
            try {
                movieToUpdate = new Movie(id, title, englishTitle, genre, releaseYear, rating, img);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid format for release year or rating.");
                response.getWriter().println("releaseYear: " + request.getParameter("releaseYear"));
                response.getWriter().println("rating: " + request.getParameter("rating"));
                return;
            }
            movieDAO.updateMovie(movieToUpdate);
            request.setAttribute("updateMessage",true);
            listMovie(request,response);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid format for release year or rating.");
        }
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Movie existingMovie = movieDAO.selectMovie(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
        request.setAttribute("movie", existingMovie);
        dispatcher.forward(request, response);
    }

    private void deleteMovie(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        movieDAO.deleteMovie(id);
        List<Movie> movieList = movieDAO.showAllMovies();
        request.setAttribute("movieList", movieList);
       listMovie(request,response);


    }

    private void listMovie(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<Movie> movieList = movieDAO.showAllMovies();
        request.setAttribute("movieList", movieList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/movie/movie.jsp");
        dispatcher.forward(request, response);
    }

    private void showMoviePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Movie movie = movieDAO.selectMovie(id);
        request.setAttribute("movie", movie);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/movie/showMovie.jsp");
        dispatcher.forward(request, response);
    }
}
