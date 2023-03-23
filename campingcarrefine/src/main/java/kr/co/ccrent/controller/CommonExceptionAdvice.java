package kr.co.ccrent.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	
 @ExceptionHandler(Exception.class)
 public ModelAndView errorModelAndView(Exception ex) {
	 
	 ModelAndView modelAndView = new ModelAndView();
	 modelAndView.setViewName("/error_common");
	 modelAndView.addObject("exception" , ex);
	 
	 return modelAndView;
	 
	
 }
	
	

}
