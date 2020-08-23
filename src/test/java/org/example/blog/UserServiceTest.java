package org.example.blog;


import org.example.blog.model.Role;
import org.example.blog.model.User;
import org.example.blog.repository.UserRepository;
import org.example.blog.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import java.util.Collections;
import static org.hamcrest.CoreMatchers.is;


@SpringBootTest
@RunWith(SpringRunner.class)
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

   @Test
    public void addUser() {
       User user = new User();

       boolean isCreateUser = userService.addUser(user);
       Assert.assertTrue(isCreateUser);
       Assert.assertTrue(is(user.getRoles()).matches(Collections.singleton(Role.USER)));
       Assert.assertTrue(is(user.isActive()).matches(true));
       Mockito.verify(userRepository, Mockito.times(1)).save(user);
   }

    @Test
    public void addUserFail() {
        User user = new User();

        user.setUsername("test");
        Mockito.doReturn(new User())
                .when(userRepository)
                .findByUsername("test");

        boolean isCreateUser = userService.addUser(user);
        Assert.assertFalse(isCreateUser);
        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
    }
}
