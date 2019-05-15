package days15.guestbook.service;

public class MessageNotFoundException extends ServiceException {

	public MessageNotFoundException(String message) {
		super(message);
	}

}
