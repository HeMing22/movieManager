package service;

import dao.newsMapper;
import pojo.News;
import java.util.Date;
import java.util.List;

public class newsServiceImpl implements newsService{
    private newsMapper newsMapper;
    public void setNewsMapper(newsMapper newsMapper){
        this.newsMapper = newsMapper;
    }
    @Override
    public int addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public int deleteNewsById(int id) {
        return newsMapper.deleteNewsById(id);
    }

    @Override
    public int updateNews(News news)
    {
        return newsMapper.updateNews(news);
    }

    @Override
    public List<News> queryAllNews()
    {
        return newsMapper.queryAllNews();
    }

    @Override
    public List<News> queryNewsByTitle(String title)
    {
        return newsMapper.queryNewsByTitle(title);
    }

    @Override
    public List<News> queryNewsByAuthor(String author) {
        return newsMapper.queryNewsByAuthor(author);
    }

    @Override
    public List<News> queryNewsByTime(Date create_date) {
        return newsMapper.queryNewsByTime(create_date);
    }

    @Override
    public News queryNewsById(int id) {
        return newsMapper.queryNewsById(id);
    }
}
