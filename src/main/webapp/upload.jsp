<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ActiveMQ Demo程序</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/uploadify.css" />
<script type="text/javascript" src="<%=basePath%>resources/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/jquery.uploadify.min.js"></script>
<style type="text/css">
.h1 {
	margin: 0 auto;
}

#producer{
	width: 48%;
	border: 1px solid blue;
	height: 80%;
	align:center;
	margin:0 auto;
}

body{
	text-align :center;
} 
div {
	text-align :center;
}
textarea{
	width:80%;
	height:100px;
	border:1px solid gray;
}
button{
	background-color: rgb(62, 156, 66);
	border: none;
	font-weight: bold;
	color: white;
	height:30px;
}
</style>
<script type="text/javascript">
$(document).ready(function()
        {
            $("#uploadify").uploadify({
            	'debug': true,
                'swf': '<%=basePath%>resources/uploadify.swf',
                'uploader': 'video/upload',
                'buttonText': '上传图片',
                'height': 15,
                'width': 80,
                'fileTypeDesc': 'Image Files',
                'fileTypeExts': '*.gif; *.jpg; *.png',
                'queueSizeLimit': 2,
                'fileSizeLimit': '8MB',
                'removeTimeout': 0.5,
                'cancelImg': '<%=basePath%>resources/uploadify-cancel.png',
                'queueID': 'fileQueue',
                'overrideEvents': ['onUploadStart', 'onUploadSuccess', 'onSelectError', 'onUploadError', 'onDialogClose'],
                'auto': false,
                'multi': true,
                'onUploadStart': function(file) {
                	var user = {};
                	var userName = $("#userName").val();
                	var password = $("#password").val();
                	/* if(userName == "" || password == "") {
                		$('#uploadify').uploadify('stop');
                		alert("文本域不能为空！");
                		return false;
                	} */
                	user.userName = userName;
                	user.password = password
                	$('#uploadify').uploadify('settings', 'formData', user);
                },
                'onUploadSuccess': function(file, data, response) {
                	var jsonResult = eval('(' + data + ')');
                	alert(jsonResult);
                },
                'onSelectError': function(file, errorCode, errorMsg) {
                	var msgText = "上传失败\n";
                	switch (errorCode) {
					case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
						msgText += "每次最多上传" + this.settings.queueSizeLimit + "个文件";
						break;
						
					case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
						msgText += "文件大小超过限制(" + this.settings.fileSizeLimit + ")";
						break;
						
					case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
						msgText += "文件大小为0";
						break;
						
					case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
						msgText += "文件格式不正确，仅限" + this.settings.fileTypeExts;
						break;

					default:
						msgText += "错误代码" + errorCode + "\n" + errorMsg;
						break;
					}
                	alert(msgText);
                },
                'onUploadError': function(file, errorCode, errorMsg, errorString) {
                	if(errorCode == SWFUpload.UPLOAD_ERROR.FILE_CANCELLED 
                			|| errorCode == SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED) {
                		return;
                	}
                	var msgText = "上传失败\n";
                	switch (errorCode) {
					case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
						msgText += "HTTP 错误\n" + errorMsg;
						break;
						
					case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
						msgText += "上传文件丢失，请重新上传";
						break;
						
					case SWFUpload.UPLOAD_ERROR.IO_ERROR:
						msgText += "IO错误";
						break;
						
					case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
						msgText += "安全性错误";
						break;
						
					case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
						msgText += "每次最多上传" + this.settings.queueSizeLimit + "个文件";
						break;
						
					case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
						msgText += errorMsg;
						break;
						
					case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
						msgText += "找不到指定文件，请重新操作";
						break;

					default:
						msgText += "错误代码" + errorCode + "\n" + errorMsg;
						break;
					}
                	alert(msgText);
                }
            });
            
            
            
            $("#upload").click(function() {
            	$('#uploadify').uploadify('upload', '*');
            });
            $("#cancel").click(function() {
            	$('#uploadify').uploadify('cancel');
            });
        });  
    </script>
</script>
</head>

<body>
	<form>  
        <table>  
            <tr>  
                <td>账号</td>  
                <td>  
                    <input type="text" name="userName" id="userName">  
                </td>  
            </tr>  
            <tr>  
                <td>密码</td>  
                <td>  
                    <input type="password" name="password" id="password">  
                </td>  
            </tr>  
            <tr>  
                <td> </td>  
                <td>  
                    <input type="button" value="提交">  
                </td>  
            </tr>  
        </table>
    </form>  
    <div>
        <%--用来作为文件队列区域--%>
        <div id="fileQueue">
        </div>
        <input type="file" name="uploadify" id="uploadify" />
        <p>
            <a id="upload" href="javascript:void(0);">上传</a>| 
            <a id="cancel" href="javascript:void(0);">取消上传</a>
        </p>
    </div>
</body>
</html>
