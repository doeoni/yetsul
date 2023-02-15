package com.yetsul.recipient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yetsul.model.Login;
import com.yetsul.model.Recipient;
import com.yetsul.model.User;

@Service
public class RecipientServiceImpl implements RecipientService {
	@Autowired
	private RecipientDAO dao;

	@Override
	public Recipient getRecipientBasic(String userId) {
		return dao.getRecipientBasic(userId);
	}

	@Override
	public void insert(Object object) {
		Recipient recipient;
		String className=object.getClass().getName();
		if(className.substring(className.lastIndexOf(".")+1).equals("Recipient")) {
			recipient=(Recipient)object;
		}else {
			recipient=dao.getUserAddress((Login)object);
		}
		dao.insert(recipient);
	}

	@Override
	public Recipient getRecipient(String recipientId) {
		return dao.getRecipient(recipientId);
	}

	@Override
	public void update(Recipient vo) {
		if(vo.getRecipientStatus()!=null) {
			updateStatus(vo);
		}
		dao.update(vo);
	}

	@Override
	public void updateStatus(Recipient vo) {
		Recipient recipient=getRecipient(vo.getRecipientId());
		recipient.setUpdatedBy(vo.getUpdatedBy());
		recipient.setRecipientStatus(vo.getRecipientStatus());
		Recipient befoRecipient=getRecipientBasic(recipient.getUserId());
		befoRecipient.setRecipientStatus("N");
		befoRecipient.setUpdatedBy(vo.getUpdatedBy());
		dao.updateStatus(befoRecipient);
		dao.updateStatus(vo);
	}

	@Override
	public void delete(Recipient vo) {
		dao.delete(vo);
	}

	@Override
	public List<Recipient> getRecipientAll(User vo) {
		return dao.getRecipientAll(vo.getUserId());
	}

}
