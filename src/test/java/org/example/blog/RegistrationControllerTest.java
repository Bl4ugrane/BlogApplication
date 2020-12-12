package org.example.blog;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;




@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
public class RegistrationControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void registrationPageTest() throws Exception {
        this.mockMvc.perform(get("/registration"))
                .andDo(print())
                        .andExpect(status().isOk())
                .andExpect(content()
                        .string(containsString("Пожалуйста, введите данные")))
                .andExpect(content()
                        .string(containsString("Зарегистрировать")));

    }
}
