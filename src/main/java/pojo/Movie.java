package pojo;


import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Movie {
    private int id;
    private String title;
    private String moviecover_url;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date create_date;
    private String description;
    private String author;
    private String movie_link;
    private String type;
    private MultipartFile pic_url;
    private MultipartFile mov_url;
}
