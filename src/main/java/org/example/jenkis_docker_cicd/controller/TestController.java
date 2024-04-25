package org.example.jenkis_docker_cicd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/helloworld")
public class TestController {

    @GetMapping()
    public String helloWorld(){
        return  "Hello world jenkis project";
    }
}
