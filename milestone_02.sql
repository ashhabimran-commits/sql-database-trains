SELECT name, tot_cred FROM student
WHERE tot_cred < 60;

SELECT instructor.name AS instructor_name, student.name AS student_name FROM instructor
JOIN teaches ON instructor.id = teaches.id
JOIN takes ON teaches.course_id = takes.course_id AND teaches.sec_id = takes.sec_id AND teaches.semester = takes.semester AND teaches.year = takes.year
JOIN student ON takes.id = student.id
JOIN course ON takes.course_id = course.course_id
WHERE course.title = 'Robotics';

SELECT course.title AS course_title, time_slot.start_hour, time_slot.start_min FROM course
JOIN section ON course.course_id = section.course_id
JOIN time_slot ON section.time_slot_id = time_slot.time_slot_id
WHERE time_slot.start_hour > 12 OR (time_slot.start_hour = 12 AND time_slot.start_min > 0);

SELECT instructor.name AS instructor_name, course.title AS course_title, course.credits, course.dept_name, department.budget FROM instructor
JOIN teaches ON instructor.id = teaches.id
JOIN course ON teaches.course_id = course.course_id
JOIN department ON instructor.dept_name = department.dept_name
WHERE course.credits = 4 AND department.budget > 80000;

SELECT department.dept_name, SUM(student.tot_cred) AS total_credits, AVG(instructor.salary) AS average_salary
FROM department
JOIN student ON department.dept_name = student.dept_name
JOIN instructor ON department.dept_name = instructor.dept_name
GROUP BY department.dept_name
HAVING SUM(student.tot_cred) > 100 AND AVG(instructor.salary) < 80000
ORDER BY AVG(instructor.salary) ASC;

CREATE OR REPLACE VIEW current_timetable AS
SELECT classroom.room_no, classroom.building, course.title, time_slot.day, time_slot.start_hour, time_slot.start_min, time_slot.end_hour, time_slot.end_min FROM classroom
JOIN section ON classroom.building = section.building AND classroom.room_no = section.room_no
JOIN time_slot ON section.time_slot_id = time_slot.time_slot_id
JOIN course ON section.course_id = course.course_id;


CREATE TABLE IF NOT EXISTS promotions (
  id INT UNSIGNED,
  previous_salary INT UNSIGNED,
  new_salary INT UNSIGNED,
  promotion_date DATE,
  PRIMARY KEY (id, promotion_date),
  FOREIGN KEY (id) REFERENCES instructor(id)
);