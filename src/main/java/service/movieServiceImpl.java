package service;

import dao.movieMapper;
import pojo.Movie;

import java.util.Date;
import java.util.List;

public class movieServiceImpl implements movieService{
    private movieMapper movieMapper;
    public void setMovieMapper(movieMapper mapper){
        this.movieMapper = mapper;
    }
    @Override
    public List<Movie> queryAllMovie() {
        return movieMapper.queryAllMovie();
    }

    @Override
    public int addMovie(Movie movie) {
        return movieMapper.addMovie(movie);
    }

    @Override
    public int deleteMovieById(int id) {
        return movieMapper.deleteMovieById(id);
    }

    @Override
    public int updateMovie(Movie movie) {
        return movieMapper.updateMovie(movie);
    }

    @Override
    public Movie queryMovieById(int id) {
        return movieMapper.queryMovieById(id);
    }

    @Override
    public List<Movie> queryMovieByTitle(String title) {
        return movieMapper.queryMovieByTitle(title);
    }

    @Override
    public List<Movie> queryMovieByAuthor(String author) {
        return movieMapper.queryMovieByAuthor(author);
    }

    @Override
    public List<Movie> queryMovieByTime(Date create_date) {
        return movieMapper.queryMovieByTime(create_date);
    }
}
