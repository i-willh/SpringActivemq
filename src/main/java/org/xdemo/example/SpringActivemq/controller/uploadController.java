/**
 * 
 */
package org.xdemo.example.SpringActivemq.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.xdemo.example.SpringActivemq.model.User;
import org.xdemo.example.SpringActivemq.utils.BaseResponse;
import org.xdemo.example.SpringActivemq.utils.JacksonUtil;

@Controller
@RequestMapping("/video")
public class uploadController {
	
	/**
	 * 发送消息到主题
	 * @param message
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String topicSender(HttpServletRequest request, User user){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		BaseResponse baseResponse = new BaseResponse("0000", user);
		return JacksonUtil.beanToJson(baseResponse);
	}
	
}
