import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

/**
 * Created by shidl on 2017/6/9.
 */
public class MD5Test {

    @Test
    public void getPassWord(){
        SimpleHash md5 = new SimpleHash("md5", "1");
        String password = md5.toHex();
    }
}
