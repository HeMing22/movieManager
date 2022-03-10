package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Movie;
import pojo.Type;
import service.movieService;
import service.typeService;
import utils.FileUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/movie")
public class movieController {

    @Autowired
    @Qualifier("movieServiceImpl")
    private movieService movieService;

    @Autowired
    @Qualifier("typeServiceImpl")
    private service.typeService typeService;

    @RequestMapping("/getAllMovie")
    public String getAllMovie(Model model){
        List<Movie> movies = movieService.queryAllMovie();
        model.addAttribute("movies",movies);
        return "movieManager";
    }

    @RequestMapping("/deleteMovie")
    public String deleteMovie(int id,HttpServletRequest request){

        Movie movie = movieService.queryMovieById(id);
        String rp = request.getSession().getServletContext().getRealPath("upload")+"/";
        boolean res =  FileUtil.deleteFile(rp+movie.getMoviecover_url());
        boolean res2 = FileUtil.deleteFile(rp+movie.getMovie_link());
        movieService.deleteMovieById(id);
        return "redirect:/movie/getAllMovie";
    }

    @RequestMapping("/queryMovieByTitle")
    public String queryMovieByTitle(String title,Model model){
        List<Movie> movies = movieService.queryMovieByTitle(title);
        model.addAttribute("movies",movies);
        return "movieManager";
    }

    @RequestMapping("/queryMovieByAuthor")
    public String queryMovieByAuthor(String author,Model model){
        List<Movie> movies = movieService.queryMovieByAuthor(author);
        model.addAttribute("movies",movies);
        return "movieManager";
    }


    @RequestMapping("/updateMovie")
    public String update(Movie movie){
        movieService.updateMovie(movie);
        return "redirect:/movie/getAllMovie";
    }


    @RequestMapping("/toAddMovie")
    public String toAddMovie(Model model){
        List<Type> typeList = typeService.getAllType();
        model.addAttribute("typeList",typeList);
        System.out.println(typeList);
        return "addMovie";
    }


    @RequestMapping(value = "/addMovie")
    @ResponseBody
    public int  addMovie(@RequestParam(value = "pic_url",required = false) MultipartFile pic_url,
                          @RequestParam(value = "mov_url",required=false) MultipartFile mov_url, Movie movie, HttpServletRequest request) throws IOException {
        MultipartFile[] url = {pic_url,mov_url};
        String[] upload = FileUtil.upload(url, request);
        int res = 0;
        if(upload.length>0){
            movie.setMoviecover_url(upload[0]);
            movie.setMovie_link(upload[1]);
            movieService.addMovie(movie);
            res = 1;
        }else{
            res = 0;
        }
        return res;
    }
}
