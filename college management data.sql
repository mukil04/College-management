INSERT INTO student (stu_id, stu_name, stu_dob, stu_blood, stu_gender, stu_type, dep_id, tea_id, stu_ph_no, stu_address, stu_email)
VALUES
(1, 'John Doe', '2000-01-15', 'O+', 'Male', 'Full-time', 101, 201, 1234567890, '123 Main St', 'john.doe@example.com'),
(2, 'Jane Smith', '2001-02-20', 'A-', 'Female', 'Part-time', 102, 202, 9876543210, '456 Oak Ave', 'jane.smith@example.com'),
(3, 'Alice Johnson', '2000-03-25', 'B+', 'Female', 'Full-time', 101, 203, 5551234567, '789 Pine Blvd', 'alice.j@example.com'),
(4, 'Bob Brown', '2002-04-30', 'AB-', 'Male', 'Part-time', 103, 201, 6669871234, '101 Maple Dr', 'bob.brown@example.com'),
(5, 'Charlie Green', '1999-05-10', 'O-', 'Male', 'Full-time', 104, 204, 7778889999, '202 Elm St', 'charlie.green@example.com'),
(6, 'Diana Prince', '2003-06-15', 'B-', 'Female', 'Part-time', 105, 205, 8887776666, '303 Cedar Ave', 'diana.prince@example.com'),
(7, 'Ethan Hunt', '2001-07-20', 'AB+', 'Male', 'Full-time', 106, 206, 9996665555, '404 Birch Blvd', 'ethan.hunt@example.com'),
(8, 'Fiona Shaw', '2000-08-25', 'A+', 'Female', 'Part-time', 107, 207, 4445556666, '505 Spruce Dr', 'fiona.shaw@example.com');


INSERT INTO department (dep_id, dep_name, dep_block_name,  stu_id) VALUES
(1, 'Computer Science', 'Block A',  1),
(2, 'Mathematics', 'Block B',  2),
(3, 'Physics', 'Block C',  3),
(4, 'Chemistry', 'Block D',  4),
(5, 'Biology', 'Block A',  1),
(6, 'Engineering', 'Block B',  2),
(7, 'Economics', 'Block C',  3),
(8, 'Literature', 'Block D',  4);


INSERT INTO hod (hod_id, hod_name, dep_id, hod_qul, hod_ph_no, hod_email) VALUES
(1, 'Alice Brown', 1, 'PhD', "9876543210", 'alice@cs.com'),
(2, 'Bob Smith', 2, 'PhD', "9876543211", 'bob@math.com'),
(3, 'Carol Johnson', 3, 'MSc', "9876543212", 'carol@physics.com'),
(4, 'David Clark', 4, 'PhD', "9876543213", 'david@chemistry.com'),
(5, 'Eve Lewis', 5, 'PhD', "9876543214", 'eve@bio.com'),
(6, 'Frank Walker', 6, 'MTech', "9876543215", 'frank@eng.com'),
(7, 'Grace Hall', 7, 'PhD', "9876543216", 'grace@eco.com'),
(8, 'Henry Scott', 8, 'PhD', "9876543217", 'henry@lit.com');


INSERT INTO teacher (tea_id, dep_id, tea_name, tea_ph_no, tea_qul) VALUES
(1, 1, 'John White', '9876543210', 'MSc'),
(2, 2, 'Emma Green', '9876543211', 'PhD'),
(3, 3, 'Liam Brown', '9876543212', 'MSc'),
(4, 4, 'Olivia Black', '9876543213', 'PhD'),
(5, 5, 'Noah Gray', '9876543214', 'MSc'),
(6, 6, 'Sophia Blue', '9876543215', 'MTech'),
(7, 7, 'James Silver', '9876543216', 'PhD'),
(8, 8, 'Ava Gold', '9876543217', 'MSc');


INSERT INTO addtence (stu_id, stu_addtence, add_per, add_otty) VALUES
(1, 'Present', '90%', 'On Time'),
(2, 'Absent', '80%', 'Late'),
(3, 'Present', '95%', 'On Time'),
(4, 'Absent', '75%', 'Late'),
(5, 'Present', '85%', 'On Time'),
(6, 'Present', '88%', 'On Time'),
(7, 'Absent', '70%', 'Late'),
(8, 'Present', '92%', 'On Time');


INSERT INTO fees_details (stu_id, tution_fees, bus_fees, sem_fees, dep_id, due_fees, paid_fees, pending_fees) VALUES
(1, 50000.00, 5000.00, 10000.00, 1, 'No', 65000, 0),
(2, 48000.00, 4500.00, 9000.00, 2, 'Yes', 45000, 16500),
(3, 52000.00, 4000.00, 11000.00, 3, 'No', 67000, 0),
(4, 50000.00, 5000.00, 9500.00, 4, 'Yes', 60000, 14500),
(5, 53000.00, 6000.00, 12000.00, 5, 'No', 71000, 0),
(6, 47000.00, 4000.00, 10500.00, 6, 'Yes', 50000, 11500),
(7, 49000.00, 4500.00, 10000.00, 7, 'No', 63500, 0),
(8, 51000.00, 5000.00, 11500.00, 8, 'Yes', 55000, 12500);