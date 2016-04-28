package com.trs.web;
import javax.servlet.http.HttpServlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

import com.trs.dao.TaskDao;
import com.trs.model.Task;
import com.trs.model.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.trs.model.User;
public class TaskAdd extends HttpServlet {

    TaskDao taskDao = new TaskDao();
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");
        //以后还要加入 商品信息认证

        //提交商品信息
        if(method.equals("add"))
        {
            try{

                HttpSession session = request.getSession();
                User currentUser = (User)session.getAttribute("currentUser");

                int taskId = taskDao.getCount() + 1;
                String taskName  = request.getParameter("taskName");
                String ownerId = currentUser.getUserId();
                int taskDiscount = Integer.parseInt(request.getParameter("radiovalue"));
                double taskPrice = Double.parseDouble(request.getParameter("taskPrice"));

                //获取是否租借
                int isRent = Integer.parseInt(request.getParameter("radiovalue2"));

                float taskNew = Float.parseFloat(request.getParameter("taskNew"));
                String taskDesc = request.getParameter("taskDesc");
                //状态1 表示在架
                int taskStatue = 1;
                //当前时间
                java.sql.Date taskDate = new java.sql.Date(System.currentTimeMillis());
                int taskTypeId = Integer.parseInt(request.getParameter("taskType"));
                int taskTypeId2 = Integer.parseInt(request.getParameter("taskType2"));

                Task task = new Task( taskId,  taskDiscount,  taskName,
                        taskPrice,  ownerId,  isRent,  taskNew,
                        taskDesc,  taskStatue,  taskDate,
                        taskTypeId,  taskTypeId2);

                boolean res;
                res = taskDao.addTask(task);
                if(res){
                    HttpSession sessionTask =  request.getSession();
                    sessionTask.setAttribute("currentTask", task);
                    request.getRequestDispatcher("upPicture.jsp").forward(request, response);
                }
            }catch (Exception e) {

                e.printStackTrace();
            }

        }



        //上传图片，用数据库保存图片存放地址
        else if(method.equals("picture"))
        {
            Random random = new Random();
            HttpSession sessionTask = request.getSession();
            Task task = (Task) sessionTask.getAttribute("currentTask");
            try{
                final long MAX_SIZE = 3 * 1024 * 1024;// 设置上传文件最大为 3M
                // 允许上传的文件格式的列表
                final String[] allowedExt = new String[] { "jpg", "jpeg", "gif", "txt",
                        "doc", "docx", "mp3", "wma", "m4a" };
                response.setContentType("text/html");
                // 设置字符编码为UTF-8, 这样支持汉字显示
                response.setCharacterEncoding("UTF-8");
                // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
                DiskFileItemFactory dfif = new DiskFileItemFactory();
                dfif.setSizeThreshold(4096);// 设置上传文件时用于临时存放文件的内存大小,这里是4K.多于的部分将临时存在硬盘
                dfif.setRepository(new File(request.getRealPath("/")
                        + "imgs"));// 设置存放临时文件的目录,web根目录下的imgs目录
                // 用以上工厂实例化上传组件
                ServletFileUpload sfu = new ServletFileUpload(dfif);
                // 设置最大上传尺寸
                sfu.setSizeMax(MAX_SIZE);
                PrintWriter out = response.getWriter();
                // 从request得到 所有 上传域的列表
                List fileList = null;
                try {
                    fileList = sfu.parseRequest(request);
                } catch (FileUploadException e) {// 处理文件尺寸过大异常
                    if (e instanceof SizeLimitExceededException) {
                        out.println("文件尺寸超过规定大小:" + MAX_SIZE + "字节<p />");
                        out.println("<a href=\"/\" mce_href=\"/\"\"upload.html/\" target=/\"_top/\">返回</a>");
                        return;
                    }
                    e.printStackTrace();
                }



                // 得到所有上传的文件
                Iterator fileItr = fileList.iterator();
                //count 计算是第几张图
                int count = 0;
                // 循环处理所有文件
                while (fileItr.hasNext()) {
                    FileItem fileItem = null;
                    String path = null;
                    long size = 0;
                    // 得到当前文件
                    fileItem = (FileItem) fileItr.next();
                    // 忽略简单form字段而不是上传域的文件域(<input type="text" />等)
                    if (fileItem == null || fileItem.isFormField()) {
                        continue;
                    }
                    // 得到文件的完整路径
                    path = fileItem.getName();
                    // 得到文件的大小
                    size = fileItem.getSize();
                    if ("".equals(path) || size == 0) {
                        if(count!=0)
                        {
                            request.setAttribute("picCount", count);
                            request.getRequestDispatcher("upSuccess.jsp").forward(request, response);
                        }
                        else{
                            out.println("请选择上传文件<p />");
                            out.println("<a href=\"/\" mce_href=\"/\"\"upPicture.jsp/\" target=/\"_top/\">返回</a>");
                            return;
                        }
                    }
                    // 得到去除路径的文件名
                    String t_name = path.substring(path.lastIndexOf("//") + 1);
                    // 得到文件的扩展名(无扩展名时将得到全名)
                    String t_ext = t_name.substring(t_name.lastIndexOf(".") + 1);
                    // 拒绝接受规定文件格式之外的文件类型
                    int allowFlag = 0;
                    int allowedExtCount = allowedExt.length;
                    for (; allowFlag < allowedExtCount; allowFlag++) {
                        if (allowedExt[allowFlag].equals(t_ext))
                            break;
                    }
                    if (allowFlag == allowedExtCount) {
                        out.println("请上传以下类型的文件<p />");
                        for (allowFlag = 0; allowFlag < allowedExtCount; allowFlag++)
                            out.println("*." + allowedExt[allowFlag]
                                    + "&nbsp;&nbsp;&nbsp;");
                        out.println("<p><a href=\"main.jsp\">返回</p>");
                        return;
                    }
                    long now = System.currentTimeMillis() + random.nextInt(1000);
                    // 根据系统时间生成上传后保存的文件名
                    String prefix = String.valueOf(now);


                    // 保存的最终文件完整路径,保存在web根目录下的ImagesUploaded目录下
                    //这里保存在项目的imgs文件夹里 使用相对路径
                    String u_name = "J:\\trs\\out\\artifacts\\trs_war_exploded\\imgs\\"
                            + prefix + "." + t_ext;
                    //r_name 文件名
                    String r_name =  prefix + "." + t_ext;
                    try {
                        File file = new File(u_name);
//							if(!file.exists()){
//								System.out.print(file.mkdirs());
//								System.out.print(file.mkdir());
//							}
                        // 保存文件
                        fileItem.write(file);

                        //数据库存储
                        if(count ==0){
                            taskDao.addTaskPicture(task.getTaskId(), r_name);
                            count++;}

                        else{
                            taskDao.addTaskPicture(count, task.getTaskId(), r_name);
                            count ++;
                        }
                        if(count==3)
                        {
                            request.setAttribute("picCount", count);
                            request.getRequestDispatcher("upSuccess.jsp").forward(request, response);
                        }


                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}

