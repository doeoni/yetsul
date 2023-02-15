package com.yetsul.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.Login;
import com.yetsul.model.Page;
import com.yetsul.model.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;

	@Override
	public void join(User vo) {
		dao.join(vo);
	}

	@Override
	public User getUser(User vo) {
		return dao.getUser(vo);
	}

	@Override
	public void pwChange(User vo) {
		dao.pwChange(vo);
	}

	@Override
	public List<User> getUserAll(Page vo) {
		return dao.getUserAll(vo);
	}

	@Override
	public void userEdit(User vo) {
		if(vo.getUpdatedBy() != null) {
			dao.userEditByAdmin(vo);
		} else {
			dao.userEditByUser(vo);
		}
	}

	@Override
	public void updateGrade(User vo) {
		dao.updateGrade(vo);
	}

	@Override
	public int getTotalRecode(Page vo) {
		return dao.getTotalRecode(vo);
	}

	@Override
	public Login getLoginUser(User vo) {
		return dao.getLoginUser(vo);
	}
}
