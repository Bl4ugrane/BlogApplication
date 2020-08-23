package org.example.blog;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

@SpringBootTest
@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@WithUserDetails("blaugrane")
public class PostControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void mainPageTest() throws Exception {
        this.mockMvc.perform(get("/posts"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id='navbar']").string("blaugrane"));

    }

    @Test
    public void postListTest() throws Exception {
        this.mockMvc.perform(get("/posts"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@class='col-md-8']/div").nodeCount(4));

    }

    @Test
    public void postSearchTest() throws Exception {
        this.mockMvc.perform(get("/posts").param("title","Getting Started"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@class='col-md-8']/div").nodeCount(1));

    }
}
