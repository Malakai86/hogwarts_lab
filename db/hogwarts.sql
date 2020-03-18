DROP TABLE houses;
DROP TABLE students;

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  student_id INT REFERENCES students(id)
)

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  first_name varchar(255),
  last_name varchar(255),
  house VARCHAR(255),
  age INT
);
