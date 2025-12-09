# auth-system
# Authentication System -

A complete, secure authentication system with user registration, login, and protected routes. Built with React, Node.js/Express, and PostgreSQL.

## 🎯 Features

- **User Registration** with validation
- **User Login** with JWT authentication
- **Password Hashing** using bcrypt
- **Protected Routes** with token verification
- **Session Management** with JWT tokens
- **Input Validation** and sanitization
- **Security Headers** with Helmet.js
- **CORS Configuration**
- **PostgreSQL Database** with connection pooling
- **Responsive UI** with Tailwind CSS

## 🏗️ Architecture

### Frontend (React + Vite)
- **Framework**: React 18 with Vite for fast development
- **Routing**: React Router v6 for navigation
- **Styling**: Tailwind CSS for responsive design
- **HTTP Client**: Axios for API communication
- **State Management**: React hooks (useState, useEffect)

### Backend (Node.js + Express)
- **Framework**: Express.js
- **Authentication**: JWT (JSON Web Tokens)
- **Password Security**: bcrypt hashing (10 salt rounds)
- **Validation**: express-validator
- **Security**: Helmet.js, CORS
- **Database Client**: node-postgres (pg)

### Database (PostgreSQL)
- **Users Table**: id, name, email, password_hash, timestamps
- **Indexes**: Email index for faster lookups
- **Connection Pooling**: Efficient database connections

### Authentication Flow
```
1. User Registration:
   User → Frontend → API validates input → Hash password → Store in DB → Return success

2. User Login:
   User → Frontend → API validates credentials → Compare hashed password → 
   Generate JWT → Return token + user data

3. Protected Route Access:
   User → Frontend (with token) → API validates JWT → Allow/Deny access

4. Session Management:
   JWT stored in localStorage → Included in Authorization header → 
   Verified on each protected request
```

## 📋 Prerequisites

- **Node.js** 18+ and npm
- **PostgreSQL** 14+
- **Git** (for cloning)

## 🚀 Setup Instructions

### 1. Clone or Extract the Repository
```bash
# If using Git
git clone <repository-url>
cd auth-system

# If using zip file, extract and navigate to directory
```

### 2. Database Setup
```bash
# Install PostgreSQL (if not already installed)
# macOS:
brew install postgresql
brew services start postgresql

# Ubuntu/Debian:
sudo apt-get install postgresql postgresql-contrib
sudo service postgresql start

# Windows: Download from https://www.postgresql.org/download/windows/

# Create database and user
psql postgres
CREATE DATABASE auth_db;
CREATE USER auth_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE auth_db TO auth_user;
\q

# Initialize database schema
psql -U auth_user -d auth_db -f backend/init-db.sql
```

### 3. Backend Setup
```bash
cd backend

# Install dependencies
npm install

# Create .env file
cp .env.example .env

# Edit .env with your settings:
# PORT=5000
# DATABASE_URL=postgresql://auth_user:your_password@localhost:5432/auth_db
# JWT_SECRET=your-super-secret-jwt-key-change-this
# NODE_ENV=development

# Start backend server
npm run dev
```

Backend will start on `http://localhost:5000`

### 4. Frontend Setup
```bash
# Open new terminal
cd frontend

# Install dependencies
npm install

# Start frontend development server
npm run dev
```

Frontend will start on `http://localhost:5173`

## 🧪 Testing the Application

### 1. Open browser to `http://localhost:5173`

### 2. Test Registration
- Click "Register"
- Fill in:
  - Name: "Test User"
  - Email: "test@example.com"
  - Password: "Test123!" (min 8 chars, must include uppercase, lowercase, number)
  - Confirm Password: "Test123!"
- Click "Register"
- Should redirect to login page

### 3. Test Login
- Email: "test@example.com"
- Password: "Test123!"
- Click "Login"
- Should redirect to dashboard

### 4. Test Protected Route
- Dashboard should display user information
- Try accessing `/dashboard` without token (logout first) - should redirect to login

### 5. Test Logout
- Click "Logout" button
- Should clear token and redirect to login

## 📁 Project Structure
