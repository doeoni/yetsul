package com.yetsul.recipient;

import java.util.List;

import com.yetsul.model.Recipient;
import com.yetsul.model.User;

public interface RecipientService {
	Recipient getRecipientBasic(String userId);
	Recipient getRecipient(String recipientId);
	List<Recipient> getRecipientAll(User vo);

	void insert(Object object);
	void update(Recipient vo);
	void updateStatus(Recipient vo);
	void delete(Recipient vo);
}
