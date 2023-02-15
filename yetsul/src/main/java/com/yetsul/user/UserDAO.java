package com.yetsul.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.Login;
import com.yetsul.model.Page;
import com.yetsul.model.User;

@Mapper
public interface UserDAO {
	void join(User vo);
	void pwChange(User vo);
	void userEditByUser(User vo);
	void userEditByAdmin(User vo);
	void updateGrade(User vo);

	User getUser(User vo);
	Login getLoginUser(User vo);
	List<User> getUserAll(Page vo);
	
	int getTotalRecode(Page vo);
}
