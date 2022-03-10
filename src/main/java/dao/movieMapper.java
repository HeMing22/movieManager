package dao;

import pojo.Movie;

import java.util.Date;
import java.util.List;

public interface movieMapper {
    List<Movie> queryAllMovie();
    int addMovie(Movie movie);
    int deleteMovieById(int id);
    int updateMovie(Movie movie);
    Movie queryMovieById(int id);
    List<Movie> queryMovieByTitle(String title);
    List<Movie> queryMovieByAuthor(String author);
    List<Movie> queryMovieByTime(Date create_date);
}
