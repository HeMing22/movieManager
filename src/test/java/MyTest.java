import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Movie;
import pojo.News;
import pojo.User;
import service.movieServiceImpl;
import service.newsServiceImpl;
import service.userServiceImpl;
import java.util.Date;
import java.util.List;

public class MyTest {
    @Test
    public void T1(){
        ApplicationContext con = new ClassPathXmlApplicationContext("applicationContext.xml");
        userServiceImpl userServiceImpl = con.getBean("userServiceImpl", userServiceImpl.class);
        System.out.println(userServiceImpl.queryAllUser());

    }
    @Test
    public void T2(){
        ApplicationContext con = new ClassPathXmlApplicationContext("applicationContext.xml");
        movieServiceImpl movieServiceImpl = con.getBean("movieServiceImpl", movieServiceImpl.class);
        List<Movie> movies = movieServiceImpl.queryAllMovie();
        System.out.println(movies);
    }

    @Test
    public void T3(){
        ApplicationContext con = new ClassPathXmlApplicationContext("applicationContext.xml");
        newsServiceImpl newsServiceImpl = con.getBean("newsServiceImpl", newsServiceImpl.class);
        System.out.println(newsServiceImpl.queryAllNews());
    }
}
