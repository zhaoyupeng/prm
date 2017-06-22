import com.yonyou.dto.User_Role;
import com.yonyou.service.User_RoleService;
import org.junit.Test;

/**
 * 权限系统测试
 * Created by shidl on 2017/6/7.
 */
public class RBAC_User_RoleTest extends  BaseTest{

    @Test
    public void save_user_role()throws  Exception{
        User_RoleService user_roleService = (User_RoleService) this.wac.getBean("user_RoleService");
        User_Role user_role = new User_Role();
        user_role.setUser_id("bf6a44e8-443b-11e7-a3d0-28d24480b297");
        user_role.setRole_id("b50a617c-4b87-11e7-874a-28d24480b297");
        user_roleService.save_user_role(user_role);
    }
}
