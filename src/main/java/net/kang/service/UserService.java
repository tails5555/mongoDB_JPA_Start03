package net.kang.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.kang.domain.User;
import net.kang.repository.UserRepository;

@Service
public class UserService {
	@Autowired UserRepository userRepository;
	public User findByUser(String name) {
		Optional<User> user=userRepository.findByName(name);
		User realUser=user.orElse(new User());
		return realUser;
	}
}
