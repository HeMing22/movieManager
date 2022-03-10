package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.News;
import service.newsService;
import java.util.List;



@RequestMapping("/news")
@Controller
public class newsController {
    @Autowired
    @Qualifier(value = "newsServiceImpl")
    private newsService newsService;

    @RequestMapping("/getAllNews")
    public String getAllNews(Model model){
        List<News> newsList = newsService.queryAllNews();
        model.addAttribute("newsList",newsList);
        return "newsManager";
    }

    @RequestMapping("/deleteNews")
    public String deleteNewById(int id){
        newsService.deleteNewsById(id);
        return "redirect:/news/getAllNews";
    }

    @RequestMapping("/toAddNews")
    public String toAddNews(){
        return "addNews";
    }

    @RequestMapping("/addNews")
    public String addNews(News news){
        newsService.addNews(news);
        return "redirect:/news/getAllNews";
    }

    @RequestMapping("/toUpdateNews")
    public String toUpdateNews(int id,Model model){
        News news = newsService.queryNewsById(id);
        model.addAttribute("news",news);
        return "updateNews";
    }

    @RequestMapping("/updateNews")
    public String updateNews(News news){
        newsService.updateNews(news);
        return "redirect:/news/getAllNews";
    }

    @RequestMapping("/queryNewsByTitle")
    public String queryNewsByTitle(String title,Model model){
        List<News> newsList = newsService.queryNewsByTitle(title);
        model.addAttribute("newsList",newsList);
        return "newsManager";
    }

    @RequestMapping("/queryNewsByAuthor")
    public String queryNewsByAuthor(String author,Model model){
        List<News> newsList = newsService.queryNewsByAuthor(author);
        model.addAttribute("newsList",newsList);
        return "newsManager";
    }

}
