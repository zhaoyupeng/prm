import com.yonyou.dto.Role;
import com.yonyou.service.RoleService;
import org.junit.Test;

/**
 * 权限系统测试
 * Created by shidl on 2017/6/7.
 */
public class RBAC_RoleTest extends BaseTest {

    @Test
    public void save_role()throws  Exception{
        RoleService roleService = (RoleService) this.wac.getBean("roleService");
        Role role = new Role();
        role.setRole_code("admin");
        role.setRole_name("admin");
        roleService.save_role(role);
    }

    @Test
    public void remove_role () throws  Exception{
        RoleService roleService = (RoleService) this.wac.getBean("roleService");
        roleService.remove_role("537df13b-4b87-11e7-874a-28d24480b297");
    }
}
