package dao;

import pojo.News;

import java.util.Date;
import java.util.List;

public interface newsMapper {
    int addNews(News news);
    News queryNewsById(int id);
    int deleteNewsById(int id);
    int updateNews(News news);
    List<News> queryAllNews();
    List<News> queryNewsByTitle(String title);
    List<News>queryNewsByAuthor (String author);
    List<News> queryNewsByTime(Date create_date);
}
