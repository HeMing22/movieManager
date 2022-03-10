package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Type;
import service.typeService;

import java.util.List;


@Controller
@RequestMapping("/type")
public class typeController {

    @Autowired
    @Qualifier(value = "typeServiceImpl")
    private service.typeService typeService;

    @RequestMapping("/getAllType")
    public String getAllType(Model model){
        List<Type> types = typeService.getAllType();
        model.addAttribute("types",types);
        return "/typeManager";
    }

    @RequestMapping("/toAddType")
    public String toAddType(){
        return "/addType";
    }

    @RequestMapping("/addType")
    public String addType(Type type){
        typeService.addType(type);
        return "redirect:/type/getAllType";
    }

    @RequestMapping("/deleteTypeById")
    public String deleteTypeById(int id){
        typeService.deleteTypeById(id);
        return "redirect:/type/getAllType";
    }

    @RequestMapping("/toUpdateType")
    public String toUpdateType(int id,Model model){
        Type type = typeService.queryTypeById(id);
        model.addAttribute("type",type);
        return "/updateType";
    }

    @RequestMapping("/updateType")
    public String updateType(Type type){
        typeService.updateType(type);
        return "redirect:/type/getAllType";
    }

}
