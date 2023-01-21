CREATE TABLE groups (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE group_members (
    group_id INT,
    user_id INT,
    joined_at TIMESTAMP NOT NULL,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

CREATE TABLE messages (
    message_id INT PRIMARY KEY,
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    message_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(group_id),
    FOREIGN KEY (user_id) REFERENCES group_members(user_id)
);