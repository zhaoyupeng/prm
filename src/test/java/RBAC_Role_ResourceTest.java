import com.yonyou.dto.Resource;
import com.yonyou.dto.Role_Resource;
import com.yonyou.service.ResourceService;
import com.yonyou.service.Role_ResourceService;
import org.junit.Test;

import java.util.List;

/**
 * 权限系统测试
 * Created by shidl on 2017/6/7.
 */
public class RBAC_Role_ResourceTest extends  BaseTest{

    @Test
    public void save_role_resource()throws  Exception{
        Role_ResourceService role_resourceService = (Role_ResourceService) this.wac.getBean("role_ResourceService");
        ResourceService resourceService = (ResourceService) this.wac.getBean("resourceService");
        List<Resource> resources = resourceService.list_resource();
        for (Resource resource:resources){
            Role_Resource role_resource = new Role_Resource();
            role_resource.setRole_id("b50a617c-4b87-11e7-874a-28d24480b297");
            role_resource.setResource_id(resource.getResource_id());
            role_resourceService.save_role_resource(role_resource);
        }
    }
}
