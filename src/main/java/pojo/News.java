package pojo;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class News {
    private int id;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date create_date;
    private String content;
    private String author;
    private String tag;
}
