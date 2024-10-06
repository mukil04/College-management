SELECT 
    student.stu_id, 
    student.stu_name, 
    student.stu_dob, 
    student.stu_blood, 
    student.stu_gender, 
    student.stu_type, 
    department.dep_name, 
    hod.hod_name 
FROM 
    student 
JOIN 
    department ON student.dep_id = department.dep_id 
JOIN 
    hod ON department.dep_id = hod.dep_id;
    

SELECT 
    student.stu_id,
    student.stu_name,
    addtence.add_per
FROM 
    student
JOIN 
    addtence ON student.stu_id = addtence.stu_id;
    

SELECT 
    student.stu_id,
    student.stu_name,
    fees_details.pending_fees
FROM 
    student
JOIN 
    fees_details ON student.stu_id = fees_details.stu_id
WHERE 
    fees_details.pending_fees > 0;
    
SELECT 
    department.dep_name,
    COUNT(student.stu_id) AS student_count
FROM 
    department
JOIN 
    student ON department.dep_id = student.dep_id
GROUP BY 
    department.dep_name;
    
    
SELECT 
    student.stu_id,
    student.stu_name,
    fees_details.paid_fees
FROM 
    student
JOIN 
    fees_details ON student.stu_id = fees_details.stu_id
WHERE 
    fees_details.pending_fees = 0;
    
    
SELECT 
    student.stu_id,
    student.stu_name,
    student.stu_type,
    department.dep_name
FROM 
    student
JOIN 
    department ON student.dep_id = department.dep_id
WHERE 
    student.stu_type = 'Full-time';  -- Change 'Full-time' to 'Part-time' to filter part-time students
    

SELECT 
    student.stu_id, 
    student.stu_name, 
    addtence.add_per, 
    RANK() OVER (ORDER BY CAST(SUBSTRING(addtence.add_per, 1, LENGTH(addtence.add_per) - 1) AS UNSIGNED) DESC) AS rank_by_attendance
FROM 
    student 
JOIN 
    addtence ON student.stu_id = addtence.stu_id;
    
    
SELECT 
    stu_id,
    stu_name,
    paid_fees,
    SUM(paid_fees) OVER (ORDER BY stu_id) AS running_total_paid
FROM 
    student
JOIN 
    fees_details ON student.stu_id = fees_details.stu_id;
    
    
SELECT 
    department.dep_name,
    student.stu_name,
    fees_details.paid_fees,
    AVG(fees_details.paid_fees) OVER (PARTITION BY department.dep_name) AS avg_paid_fees
FROM 
    student
JOIN 
    department ON student.dep_id = department.dep_id
JOIN 
    fees_details ON student.stu_id = fees_details.stu_id;
    

CREATE VIEW student_department_view AS
SELECT 
    student.stu_id,
    student.stu_name,
    student.stu_dob,
    student.stu_blood,
    student.stu_gender,
    department.dep_name,
    hod.hod_name
FROM 
    student
JOIN 
    department ON student.dep_id = department.dep_id
JOIN 
    hod ON department.dep_id = hod.dep_id;
    
    
DELIMITER $$
CREATE PROCEDURE GetStudentsByDepartment(IN dept_name VARCHAR(30))
BEGIN
    SELECT 
        student.stu_id,
        student.stu_name,
        student.stu_gender,
        department.dep_name
    FROM 
        student
    JOIN 
        department ON student.dep_id = department.dep_id
    WHERE 
        department.dep_name = dept_name;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE UpdateFees(
    INOUT stuID INT, 
    IN additionalFeesPaid DECIMAL(10,2)
)
BEGIN
    DECLARE currentPendingFees DECIMAL(10,2);
    
    -- Get current pending fees for the student
    SELECT pending_fees INTO currentPendingFees 
    FROM fees_details 
    WHERE stu_id = stuID;
    
    -- If pending fees exist, update them
    IF currentPendingFees > 0 THEN
        UPDATE fees_details
        SET 
            paid_fees = paid_fees + additionalFeesPaid,
            pending_fees = pending_fees - additionalFeesPaid
        WHERE 
            stu_id = stuID;
        
        -- Return the updated paid_fees as output
        SELECT paid_fees INTO stuID 
        FROM fees_details 
        WHERE stu_id = stuID;
    ELSE
        -- If no pending fees, return a message via stuID
        SET stuID = -1; -- This could be used as a special value (e.g., -1 means no pending fees)
    END IF;
END$$
DELIMITER ;


SELECT 
    department.dep_name,
    SUM(fees_details.paid_fees) AS total_paid,
    SUM(fees_details.pending_fees) AS total_pending
FROM 
    department
JOIN 
    student ON department.dep_id = student.dep_id
JOIN 
    fees_details ON student.stu_id = fees_details.stu_id
GROUP BY 
    department.dep_name;
