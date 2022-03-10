package service;

import pojo.News;

import java.util.Date;
import java.util.List;

public interface newsService {
    int addNews(News news);
    int deleteNewsById(int id);
    int updateNews(News news);
    List<News> queryAllNews();
    List<News> queryNewsByTitle(String title);
    List<News>queryNewsByAuthor (String author);
    List<News> queryNewsByTime(Date create_date);
    News queryNewsById(int id);
}
