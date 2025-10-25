-- ===========================================
-- PILLAI BOYS HOSTEL MANAGEMENT SYSTEM
-- PostgreSQL Database Schema
-- Inferred from HTML templates
-- ===========================================

-- ===========================================
-- USERS & AUTHENTICATION
-- ===========================================

-- Students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    admission_number VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    college VARCHAR(100), -- PCE, PICA, PIMSR, PCACS
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Hostel Incharge/Admin table
CREATE TABLE hostel_incharge (
    incharge_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    administrator_id VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================
-- ROOMS & FACILITIES
-- ===========================================

-- Room types enum
CREATE TYPE room_type AS ENUM ('normal', 'attached', 'attached_ac');

-- Rooms table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    floor_number INTEGER NOT NULL,
    room_type room_type NOT NULL,
    capacity INTEGER NOT NULL,
    occupied_count INTEGER DEFAULT 0,
    price_per_month DECIMAL(10,2) NOT NULL,
    has_ac BOOLEAN DEFAULT FALSE,
    has_attached_washroom BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE
);

-- Room facilities table
CREATE TABLE room_facilities (
    facility_id SERIAL PRIMARY KEY,
    room_id INTEGER REFERENCES rooms(room_id) ON DELETE CASCADE,
    facility_name VARCHAR(100) NOT NULL,
    quantity INTEGER DEFAULT 1
);

-- ===========================================
-- BOOKINGS & ALLOTMENTS
-- ===========================================

-- Booking status enum
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'rejected', 'cancelled');

-- Room bookings/applications table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id) ON DELETE CASCADE,
    room_id INTEGER REFERENCES rooms(room_id) ON DELETE SET NULL,
    booking_status booking_status DEFAULT 'pending',
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    check_in_date DATE,
    check_out_date DATE,
    duration_months INTEGER,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(50) DEFAULT 'unpaid'
);

-- ===========================================
-- GRIEVANCES & COMPLAINTS
-- ===========================================

-- Grievance status enum
CREATE TYPE grievance_status AS ENUM ('submitted', 'in_progress', 'resolved', 'closed', 'rejected');

-- Grievances table
CREATE TABLE grievances (
    grievance_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id) ON DELETE CASCADE,
    room_id INTEGER REFERENCES rooms(room_id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100), -- 'maintenance', 'cleanliness', 'security', 'facilities', etc.
    grievance_status grievance_status DEFAULT 'submitted',
    priority VARCHAR(20) DEFAULT 'medium', -- 'low', 'medium', 'high'
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP,
    response TEXT
);

-- ===========================================
-- NOTICES & ANNOUNCEMENTS
-- ===========================================

-- Notices table
CREATE TABLE notices (
    notice_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    posted_by INTEGER REFERENCES hostel_incharge(incharge_id),
    notice_type VARCHAR(50), -- 'general', 'urgent', 'maintenance', 'event', etc.
    is_active BOOLEAN DEFAULT TRUE,
    expiry_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
