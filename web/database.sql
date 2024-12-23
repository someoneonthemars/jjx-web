CREATE TABLE users_table (
    id VARCHAR(255) PRIMARY KEY DEFAULT (UUID()),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    emailVerified TIMESTAMP(3),
    image VARCHAR(255),
    admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE accounts_table (
    userId VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    provider VARCHAR(255) NOT NULL,
    providerAccountId VARCHAR(255) NOT NULL,
    refresh_token VARCHAR(255),
    access_token TEXT,
    expires_at INT,
    token_type VARCHAR(255),
    scope VARCHAR(255),
    id_token VARCHAR(2048),
    session_state VARCHAR(255),
    PRIMARY KEY (provider, providerAccountId),
    FOREIGN KEY (userId) REFERENCES users_table (id) ON DELETE CASCADE
);

CREATE TABLE sessions_table (
    sessionToken VARCHAR(255) PRIMARY KEY,
    userId VARCHAR(255) NOT NULL,
    expires TIMESTAMP NOT NULL,
    FOREIGN KEY (userId) REFERENCES users_table (id) ON DELETE CASCADE
);

CREATE TABLE verificationTokens_table (
    identifier VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    expires TIMESTAMP NOT NULL,
    PRIMARY KEY (identifier, token)
);

CREATE TABLE authenticators_table (
    credentialID VARCHAR(255) NOT NULL UNIQUE,
    userId VARCHAR(255) NOT NULL,
    providerAccountId VARCHAR(255) NOT NULL,
    credentialPublicKey VARCHAR(255) NOT NULL,
    counter INT NOT NULL,
    credentialDeviceType VARCHAR(255) NOT NULL,
    credentialBackedUp BOOLEAN NOT NULL,
    transports VARCHAR(255),
    PRIMARY KEY (userId, credentialID),
    FOREIGN KEY (userId) REFERENCES users_table (id) ON DELETE CASCADE
);

CREATE TABLE reviews_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    review TEXT NOT NULL,
    rating INT NOT NULL,
    testimonial BOOLEAN DEFAULT FALSE,
    userId VARCHAR(255) NOT NULL DEFAULT '',
    FOREIGN KEY (userId) REFERENCES users_table (id) ON DELETE CASCADE
);

CREATE TABLE descriptions_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    createdAt DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updatedAt DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)
);
