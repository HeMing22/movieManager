import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateTest {

    @Test
    public void DateTest() throws ParseException {
        SimpleDateFormat cstF = new SimpleDateFormat();
        TimeZone gmt = TimeZone.getTimeZone("GMT");
        TimeZone cst = TimeZone.getTimeZone("CST");
        cstF.setTimeZone(gmt);
        System.out.println(cstF.format(new Date()));
    }
}
