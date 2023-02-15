package com.yetsul.user;

import java.util.List;

import com.yetsul.model.Login;
import com.yetsul.model.Page;
import com.yetsul.model.User;

public interface UserService {
	void join(User vo);
	void pwChange(User vo);
	void userEdit(User vo);
	void updateGrade(User vo);

	User getUser(User vo);
	Login getLoginUser(User vo);
	List<User> getUserAll(Page vo);
	
	int getTotalRecode(Page vo);
}
