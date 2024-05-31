-- Create the database
CREATE DATABASE maaltijd_planner;

-- Connect to the new database
\c maaltijd_planner

-- Create the recipes table
CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    is_vegan BOOLEAN DEFAULT FALSE,
    contains_fish BOOLEAN DEFAULT FALSE,
    contains_dairy BOOLEAN DEFAULT FALSE,
    contains_gluten BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
