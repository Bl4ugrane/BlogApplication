package org.example.blog;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;



@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@TestPropertySource("/application-test.properties")
@WithUserDetails("admin")
public class UserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void usersPageTest() throws Exception {
        this.mockMvc.perform(get("/users"))
                .andDo(print())
                        .andExpect(authenticated())
                        .andExpect(content().string(containsString("Редактировать")))
                .andExpect(content().string(containsString("Логин")))
                        .andExpect(content().string(containsString("Эл. почта")))
                .andExpect(content().string(containsString("Роль")));
    }

    @Test
    public void roleTest() throws Exception {
        this.mockMvc.perform(get("/users"))
                .andDo(print())
                        .andExpect(authenticated())
                .andExpect(xpath("//table/tbody/tr[1]/td[1]").string("admin"))
                        .andExpect(content().string(containsString("ADMIN")));

    }

    @Test
    public void pageUserEditTest() throws Exception {
        this.mockMvc.perform(get("/users/edit/1"))
                .andDo(print())
                        .andExpect(authenticated())
                .andExpect(content().string(containsString("admin")))
                        .andExpect(content().string(containsString("admin@gmail.com")))
                .andExpect(content().string(containsString("Изменить")))
                        .andExpect(content().string(containsString("Удалить")));

    }


}
