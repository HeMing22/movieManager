package utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class FileUtil {

    public static String[] upload(MultipartFile[] link_url, HttpServletRequest request) throws IOException {
        String[] returnUrl = new String[2];
        for (int i = 0; i < link_url.length; i++) {
            //1. 获取上传的目录路径
            String path = request.getSession().getServletContext().getRealPath("upload");
            //3. 创建目录
            File file = new File(path);
            if (!file.exists()) {
                // 创建目录或子目录
                file.mkdirs();
            }
            //4.1 文件上传 获取原始文件名
            String fileName = link_url[i].getOriginalFilename();
            fileName = UUID.randomUUID().toString().replace("-","") + fileName.substring(fileName.lastIndexOf("."));
System.out.println(fileName+"===================");
            //4.2 文件上传[关键代码]
            link_url[i].transferTo(new File(path, fileName));
            returnUrl[i] = fileName;
        }
        return returnUrl;
    }

    public static boolean deleteFile(String fileName){
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            } else {
                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        } else {
            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }
}
