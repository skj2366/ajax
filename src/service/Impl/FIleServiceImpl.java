package service.Impl;

import java.io.File;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;

import service.FileService;
import utils.UploadFIle;

public class FIleServiceImpl implements FileService {

	@Override
	public Map<String, String> parseText(HttpServletRequest request) throws ServletException {
		Map<String,Object> pMap = UploadFIle.parseRequest(request);
		Iterator<String> it = pMap.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			Object obj = pMap.get(key);
			if(obj instanceof FileItem) {
				try {
					File tFile = UploadFIle.writeFile((FileItem)obj);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		return null;
	}

}
