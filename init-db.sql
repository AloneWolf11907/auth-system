-- Create database (run this first as postgres superuser)
CREATE DATABASE auth_db;

-- Connect to auth_db and run the following:

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on email for faster lookups
CREATE INDEX idx_users_email ON users(email);

-- Insert a test user (password: "Test123!")
INSERT INTO users (name, email, password_hash) 
VALUES (
    'Test User', 
    'test@example.com', 
    '$2b$10$YourHashedPasswordHere'
) ON CONFLICT (email) DO NOTHING;