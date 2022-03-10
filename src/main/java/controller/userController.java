package controller;

import com.google.code.kaptcha.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.User;
import service.userService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/user")
@Controller
public class userController {

    @Autowired
    @Qualifier("userServiceImpl")
    private userService userService;


    @RequestMapping("/getAllUser")
    public String getAllUser(Model model){
        List<User> users = userService.queryAllUser();
        model.addAttribute("users",users);
        return "userManager";
    }

    @RequestMapping("/deleteUser")
    public String deleteUserById(int id){
        userService.deleteUserById(id);
        return "redirect:/user/getAllUser";
    }
    @RequestMapping("/toUpdateUser")
    public String toUpdate(int id,Model model){
        User user = userService.queryUserById(id);
        model.addAttribute("user",user);
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUser(user);
        return "redirect:/user/getAllUser";
    }

    @RequestMapping("toAddUser")
    public String toAddUser(){
        return "addUser";
    }

    @RequestMapping("/addUser")
    public String addUser(User user){
        userService.addUser(user);
        return "redirect:/user/getAllUser";
    }

    @RequestMapping("/queryUserById")
    public String queryUserById(int id,Model model){
        User user = userService.queryUserById(id);
        List<User> users = new ArrayList<>();
        users.add(user);
        model.addAttribute("users",users);
        return "userManager";
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        //使session失效
        session.invalidate();
        return "redirect:/user/toLogin";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/login")
    public String login(String username, String password, String verifyCode, Model model, HttpSession session,
                        HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        String generateCode =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        String result = "";

        System.out.println("接收到的验证码=============="+verifyCode);
        List<User> users = userService.queryAllUser();
        for (User user : users) {
            if(user.getUsername().equals(username) && user.getPassword().equals(password) &&generateCode.equals(verifyCode)){
                session.setAttribute("user",user);
                model.addAttribute("user",user);
                model.addAttribute("msg","登录成功");
                return "main";
            }
        }

        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.print(result);
        out.flush();
        model.addAttribute("msg","检查用户名,密码或验证码是否输入有误");
        return "login";
    }

    /**
     * 跳转到主页面
     */
    @RequestMapping("/main")
    public String toMain() {
        return "main";
    }
}
