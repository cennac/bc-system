/**
 * 
 */
package cn.bc.login;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.bc.Context;
import cn.bc.docs.domain.Attach;
import cn.bc.docs.service.AttachService;
import cn.bc.identity.web.SystemContext;
import cn.bc.web.util.WebUtils;

import com.opensymphony.xwork2.ActionSupport;

/**
 * jcrop 图片剪切处理
 * 
 * http://xiangxingchina.iteye.com/blog/926169
 * 
 * @author dragon
 * 
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class JcropAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private static Log logger = LogFactory.getLog(JcropAction.class);
	private Map<String, Object> session;
	private AttachService attachService;

	@Autowired
	public void setAttachService(AttachService attachService) {
		this.attachService = attachService;
	}

	public Long id;// 原图片对应的附件id
	public int x;
	public int y;
	public int w;
	public int h;

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	// 剪切图片
	public String save() throws Exception {
		SystemContext context = (SystemContext) this.session.get(Context.KEY);

		// 获取原图
		Attach srcAttach = this.attachService.load(id);
		String srcPath;
		if (srcAttach.isAppPath()) {
			srcPath = WebUtils.rootPath + "/" + getText("app.data.subPath")
					+ "/" + srcAttach.getPath();
		} else {
			srcPath = getText("app.data.realPath") + "/" + srcAttach.getPath();
		}

		// 读取图片文件
		FileInputStream is = new FileInputStream(srcPath);
		Iterator<ImageReader> it = ImageIO
				.getImageReadersByFormatName(srcAttach.getExtension());
		ImageReader reader = it.next();
		ImageInputStream iis = ImageIO.createImageInputStream(is);
		reader.setInput(iis, true);

		// 图片裁剪区域
		ImageReadParam param = reader.getDefaultReadParam();
		Rectangle rect = new Rectangle(x, y, w, h);
		param.setSourceRegion(rect);
		BufferedImage bi = reader.read(0, param);

		// 存放剪切图片的路径处理
		String realFileDir;// 所保存文件所在的目录的绝对路径名
		String relativeFilePath;// 所保存文件的相对路径名
		String realFilePath;// 所保存文件的绝对路径名
		Calendar now = Calendar.getInstance();
		String subFolder = new SimpleDateFormat("yyyyMM").format(now.getTime());
		String fileName = srcAttach.getPtype()
				+ ".crop_"
				+ new SimpleDateFormat("yyyyMMddHHmmssSSSS").format(now
						.getTime()) + "." + srcAttach.getExtension();// 不含路径的文件名
		relativeFilePath = subFolder + "/" + fileName;
		realFileDir = WebUtils.rootPath + "/" + getText("app.data.subPath")
				+ "/" + subFolder;
		realFilePath = realFileDir + "/" + fileName;
		File _fileDir = new File(realFileDir);
		if (!_fileDir.exists()) {
			if (logger.isDebugEnabled()) {
				logger.debug("mkdir=" + realFileDir);
			}
			_fileDir.mkdirs();
		}

		// 保存剪切好的新图片
		File newFile = new File(realFilePath);
		ImageIO.write(bi, srcAttach.getExtension(), newFile);

		// 记录一个附件记录
		Attach attach = new Attach();
		attach.setAuthor(context.getUser());
		attach.setAuthorName(context.getUser().getName());
		attach.setPtype(srcAttach.getPtype() + ".crop");
		attach.setPuid(srcAttach.getPuid());
		if (context.getBelong() != null) {
			attach.setDepartId(context.getBelong().getId());
			attach.setDepartName(context.getBelong().getName());
		}
		attach.setUnitId(context.getUnit().getId());
		attach.setUnitName(context.getUnit().getName());
		attach.setExtension(srcAttach.getExtension());
		attach.setFileDate(now);
		attach.setPath(relativeFilePath);
		attach.setSize(new FileInputStream(newFile).available());// 新图片的大小
		attach.setSubject(srcAttach.getSubject());
		attach.setAppPath(true);
		this.attachService.save(attach);

		// String downloadUrl =
		// ServletActionContext.getRequest().getContextPath()
		// + "/bc/attach/download?id=" + attach.getId();

		return SUCCESS;
	}
}