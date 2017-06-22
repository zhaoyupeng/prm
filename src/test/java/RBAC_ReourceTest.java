import com.yonyou.dto.Resource;
import com.yonyou.service.ResourceService;
import org.junit.Test;

import java.util.List;

/**
 * 权限系统测试
 * Created by shidl on 2017/6/7.
 */
public class RBAC_ReourceTest extends BaseTest {

    @Test
    public void save_resource() throws Exception {
        ResourceService resourceService = (ResourceService) this.wac.getBean("resourceService");
        Resource resource = new Resource();
        resource.setResource_code("save_role_resource");
        resource.setResource_name("save_role_resource");
        resource.setResource_url("save_role_resource");
        Resource resource2 = new Resource();
        resource2.setResource_code("remove_role_resource");
        resource2.setResource_name("remove_role_resource");
        resource2.setResource_url("remove_role_resource");
        Resource resource3 = new Resource();
        resource3.setResource_code("update_role_resource");
        resource3.setResource_name("update_role_resource");
        resource3.setResource_url("update_role_resource");
        Resource resource4 = new Resource();
        resource4.setResource_code("get_role_resource");
        resource4.setResource_name("get_role_resource");
        resource4.setResource_url("get_role_resource");
        Resource resource5 = new Resource();
        resource5.setResource_code("list_role_resource");
        resource5.setResource_name("list_role_resource");
        resource5.setResource_url("list_role_resource");
        resourceService.save_resource(resource);
        resourceService.save_resource(resource2);
        resourceService.save_resource(resource3);
        resourceService.save_resource(resource4);
        resourceService.save_resource(resource5);
    }

    @Test
    public void update_resource()throws  Exception{
        ResourceService resourceService = (ResourceService) this.wac.getBean("resourceService");
        Resource resource = new Resource();
        resource.setResource_url("list_role");
        resource.setResource_code("list_role");
        resource.setResource_name("list_role");
        resource.setResource_id("6eae9e1a-4b83-11e7-874a-28d24480b297");
        resourceService.update_resource(resource);
    }

    @Test
    public void list_resourceByUser_ID()throws  Exception{
        ResourceService resourceService = (ResourceService) this.wac.getBean("resourceService");
        List<Resource> resources = resourceService.list_resourceByUser_ID("bf6a44e8-443b-11e7-a3d0-28d24480b297");
        System.out.print(resources);
    }
}
