package org.example.blog;



import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;



@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@TestPropertySource("/application-test.properties")
@Sql(value = {"/create-user-before.sql"}, executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
public class LoginTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void homePageTest() throws Exception {
        this.mockMvc.perform(get("/"))
                .andDo(print()).
                        andExpect(status().isOk())
                .andExpect(content().
                        string(containsString("Добро пожаловать!")))
                .andExpect(content().
                        string(containsString("Войти")));

    }

    @Test
    public void accessTest() throws Exception {
        this.mockMvc.perform(get("/posts"))
                .andDo(print()).
                        andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("http://localhost/login"));
    }

    @Test
    public void loginTest() throws Exception {
        this.mockMvc.perform(formLogin().user("admin").password("admin"))
                .andDo(print())
                        .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/"));
    }

    @Test
    public void loginTestWithInvalidCredentials() throws Exception {
        this.mockMvc.perform(post("/login").param("user","user"))
                     .andDo(print())
                .andExpect(status().isForbidden());
    }

}
