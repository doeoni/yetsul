package com.yetsul.recipient;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yetsul.model.Login;
import com.yetsul.model.Recipient;

@Mapper
public interface RecipientDAO {
	Recipient getRecipientBasic(String userId);
	Recipient getUserAddress(Login vo);
	Recipient getRecipient(String recipientId);
	List<Recipient> getRecipientAll(String userId);
	
	void insert(Recipient vo);
	void update(Recipient vo);
	void updateStatus(Recipient vo);
	void delete(Recipient vo);
}
