package com.yonyou.service.impl;

import com.yonyou.model.Document;
import com.yonyou.mapper.DocumentMapper;
import com.yonyou.service.IDocumentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@Service
public class DocumentServiceImpl extends ServiceImpl<DocumentMapper, Document> implements IDocumentService {
	
}
