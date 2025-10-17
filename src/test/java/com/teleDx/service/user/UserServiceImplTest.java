package com.teleDx.service.user;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.teleDx.dao.user.UserDAOImpl;
import com.teleDx.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceImplTest {

    @Mock
    private UserDAOImpl userDAO;

    private UserServiceImpl userService;
    private User testUser;
    private final String testPassword = "password123";
    private final String testHashedPassword = "$2a$12$somehashedpassword";

    @BeforeEach
    void setUp() {
        userService = new UserServiceImpl(userDAO);
        testUser = new User();
        testUser.setId("U001");
        testUser.setUsername("testuser");
        testUser.setPassword(testPassword);
    }

    @Test
    void save_ValidUser_ReturnsUserWithHashedPassword() {
        // Arrange
        when(userDAO.save(any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            user.setPassword(testHashedPassword);
            return user;
        });

        // Act
        User savedUser = userService.save(testUser);

        // Assert
        assertNotNull(savedUser);
        assertNotEquals(testPassword, savedUser.getPassword());
        assertTrue(savedUser.getPassword().startsWith("$2a$")); // BCrypt hash starts with $2a$
        verify(userDAO, times(1)).save(any(User.class));
    }

    @Test
    void findById_ExistingId_ReturnsUser() {
        // Arrange
        when(userDAO.findById("U001")).thenReturn(Optional.of(testUser));

        // Act
        Optional<User> foundUser = userService.findById("U001");

        // Assert
        assertTrue(foundUser.isPresent());
        assertEquals(testUser.getId(), foundUser.get().getId());
        verify(userDAO, times(1)).findById("U001");
    }

    @Test
    void findAll_ReturnsAllUsers() {
        // Arrange
        List<User> users = Arrays.asList(testUser, new User());
        when(userDAO.findAll()).thenReturn(users);

        // Act
        List<User> result = userService.findAll();

        // Assert
        assertEquals(2, result.size());
        verify(userDAO, times(1)).findAll();
    }

    @Test
    void deleteById_ExistingId_ReturnsTrue() {
        // Arrange
        when(userDAO.deletById("U001")).thenReturn(true);

        // Act
        boolean result = userService.deleteById("U001");

        // Assert
        assertTrue(result);
        verify(userDAO, times(1)).deletById("U001");
    }

    @Test
    void authenticate_ValidCredentials_ReturnsTrue() {
        // Arrange
        User userWithHashedPassword = new User();
        userWithHashedPassword.setPassword(BCrypt.withDefaults().hashToString(12, testPassword.toCharArray()));
        when(userDAO.findByUsername("testuser")).thenReturn(Optional.of(userWithHashedPassword));

        // Act
        boolean result = userService.authenticate("testuser", testPassword);

        // Assert
        assertTrue(result);
        verify(userDAO, times(1)).findByUsername("testuser");
    }

    @Test
    void authenticate_InvalidPassword_ReturnsFalse() {
        // Arrange
        User userWithHashedPassword = new User();
        userWithHashedPassword.setPassword(BCrypt.withDefaults().hashToString(12, "correctPassword".toCharArray()));
        when(userDAO.findByUsername("testuser")).thenReturn(Optional.of(userWithHashedPassword));

        // Act
        boolean result = userService.authenticate("testuser", "wrongPassword");

        // Assert
        assertFalse(result);
    }

    @Test
    void authenticate_NonExistingUser_ReturnsFalse() {
        // Arrange
        when(userDAO.findByUsername("nonexistent")).thenReturn(Optional.empty());

        // Act
        boolean result = userService.authenticate("nonexistent", "anypassword");

        // Assert
        assertFalse(result);
    }

    @Test
    void findByUsername_ExistingUser_ReturnsUser() {
        // Arrange
        when(userDAO.findByUsername("testuser")).thenReturn(Optional.of(testUser));

        // Act
        Optional<User> foundUser = userService.findByUsername("testuser");

        // Assert
        assertTrue(foundUser.isPresent());
        assertEquals(testUser.getUsername(), foundUser.get().getUsername());
        verify(userDAO, times(1)).findByUsername("testuser");
    }
}
