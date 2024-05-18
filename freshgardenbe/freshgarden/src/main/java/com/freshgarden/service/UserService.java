package com.freshgarden.service;

import com.freshgarden.exception.UserException;
import com.freshgarden.model.User;

public interface UserService {

	public User findUserById(Long userId) throws UserException;
	
	public User findUserProfileByJwt(String jwt) throws UserException;
	
	
}
