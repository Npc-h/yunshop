package cn.lanqiao.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;



import cn.lanqiao.model.TbProduct;
import cn.lanqiao.service.AdminProductService;
import cn.lanqiao.service.impl.AdminProductServiceImpl;


@WebServlet("/productperation.do")
public class AdminProductPerationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AdminProductPerationController() {
        super();
    }

    AdminProductService service = new AdminProductServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String type = request.getParameter("type");
		System.out.println(type);
		//删除
		if(("delete").equals(type)) {
			String pid = request.getParameter("pid");
			System.out.println(pid);
			service.deleteProduct(pid);
			//刷新
			response.sendRedirect(request.getContextPath()+"/adminproduct.do");	
		}
		
		//添加
		if(("insert").equals(type)) {
			//获取数据
			Map<String, String[]> product = request.getParameterMap();
			//封装数据
			TbProduct tbProduct = new TbProduct();
			try {
				BeanUtils.populate(tbProduct, product);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//手动设置表单中没有的数据
			//添加pid
			tbProduct.setPid(UUID.randomUUID().toString());
			//添加pflag
			tbProduct.setPflag(1000);
			//添加pdate
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String pdate = format.format(new Date());
			tbProduct.setPdate(pdate);
			//添加商品
			service.insertProduct(tbProduct);
			
			//上传图片
			try {

				// 1、创建磁盘文件项工厂
				// 作用：设置缓存文件的大小 设置临时文件存储的位置
				String path_temp = this.getServletContext().getRealPath("temp");
				// DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024, new
				// File(path_temp));
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(1024 * 1024);
				factory.setRepository(new File(path_temp));
				// 2、创建文件上传的核心类
				ServletFileUpload upload = new ServletFileUpload(factory);
				// 设置上传文件的名称的编码
				upload.setHeaderEncoding("UTF-8");

				// ServletFileUpload的API
				boolean multipartContent = upload.isMultipartContent(request);// 判断表单是否是文件上传的表单
				if (multipartContent) {
					// 是文件上传的表单
					// ***解析request获得文件项集合
					List<FileItem> parseRequest = upload.parseRequest(request);
					if (parseRequest != null) {
						for (FileItem item : parseRequest) {
							// 判断是不是一个普通表单项
							boolean formField = item.isFormField();
							if (formField) {
								// username=zhangsan
								String fieldName = item.getFieldName();
								String fieldValue = item.getString("UTF-8");// 对普通表单项的内容进行编码

								// 当表单是enctype="multipart/form-data"时 request.getParameter相关的方法
								// String parameter = request.getParameter("username");

							} else {
								// 文件上传项
								// 文件的名
								String fileName = item.getName();
								// 获得上传文件的内容
								InputStream in = item.getInputStream();
								// 存放上传文件的位置
								String path_store = this.getServletContext().getRealPath("images");
								System.out.println(path_store);
								OutputStream out = new FileOutputStream(path_store + "/" + fileName);
								IOUtils.copy(in, out);
								in.close();
								out.close();

								// 删除临时文件
								item.delete();

							}
						}
					}

				} else {
					// 不是文件上传表单
					// 使用原始的表单数据的获得方式 request.getParameter();
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		
			//刷新
			response.sendRedirect(request.getContextPath()+"/adminproduct.do");	
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
