INSERT INTO `candidate_tracker`.`roles` (`role`,`role_string`,`h_level`) VALUES ('root','Root',1),('admin','Admin',2),('ops','OPS',3),('recruiter','Recruiter',4),('interviewer','Interviewer',4);

INSERT into `candidate_tracker`.`skills`  (`skill_name`) VALUES ('Java'),('Cyber Security'),('Artificial Intelligence'),('SQL'),('DS'),('Algorithms');

INSERT  INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`) VALUES ('wissen@wissen.com','$2a$10$WB99cJN1ir.MgOOXgew6.eVrmvcxJnTDQMKRXteMJwoD22c6HeYR6','root','Wissen','Technology','123456789');
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('harsh.patel4@somaiya.edu','$2a$10$X7A6XWsoJx5cKNR.mTd/vuwbX3PWw8tKl8FaYqbBRt0l5FUbZvENq','admin','Harsh','Patel','1864513287',1);
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('shivani@gmail.com','$2a$10$rh5Tp067kFIf3DTDdNRo/uZqjRbQ.bAao/iJSZlk5mC6k3bf4g7Cy','admin','Shivani','Jaiswal','8745852147',1);
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('hitanshu@somaiya.edu','$2a$10$es0OyjA7a/dd3IJu5UgtsOIo0ydRpsffNY5udjQJcWEb.rYT95Pwq','ops','Hitanshu','Shah','8451284511',2);
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('murtaza@gmail.com','$2a$10$10rXQLRvVPp0a3xbzkXZgOBmKW2HBzzok/JYv78Mmna0jT6d0XyMi','ops','Murtaza','Patrawala','8541484511',2);
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('ojas@somaiya.edu','$2a$10$YuuxJUGrMMVn46tsKRH8YuCubD98ETKnuXE5tIFJeYphulfNn6rhi','recruiter','Ojas','Kapre','8451247511',4);
INSERT INTO `candidate_tracker`.`user` (`email`,`password`,`r_id`,`first_name`,`last_name`,`contact`,`manager_id`) VALUES ('tanay@somaiya.edu','$2a$10$1jHD2OsY3CSC7/TgCtjRyORsUnlPJOQ7x5p9WWq.2FihdnpQR8l/.','interviewer','Tanay','Raul','7141284511',5);

INSERT  INTO `candidate_tracker`.`candidate` (`email`,`recruiter_id`,`first_name`,`last_name`,`contact`,`address`,`preferred_loc`,`ectc`,`ctct`,`source`, `current_round`, `status`) 
VALUES ('candidate1@gamil.com',6,'Manish','Potey','9224659941','Alibaug','Mumbai',4, 3, 'College Placement', 1, 'hold');
INSERT  INTO `candidate_tracker`.`candidate` (`email`,`recruiter_id`,`first_name`,`last_name`,`contact`,`address`,`preferred_loc`,`ectc`,`ctct`,`source`, `current_round`, `status`) 
VALUES ('candidate2@gamil.com',6,'Hitansh','Shah','7506847230','Sion','Pune',5, 6, 'College Placement', 2, 'hold');
INSERT  INTO `candidate_tracker`.`candidate` (`email`,`recruiter_id`,`first_name`,`last_name`,`contact`,`address`,`preferred_loc`,`ectc`,`ctct`,`source`, `current_round`, `status`) 
VALUES ('candidate3@gamil.com',6,'Jash','Gopnai','8659321547','Borivali','Bangalore',8, 8, 'College Placement', 0, 'ready');
INSERT  INTO `candidate_tracker`.`candidate` (`email`,`recruiter_id`,`first_name`,`last_name`,`contact`,`address`,`preferred_loc`,`ectc`,`ctct`,`source`, `current_round`, `status`) 
VALUES ('candidate4@gamil.com',6,'Mikin','Padalia','9869710860','Rajkot','Surat',7, 6, 'College Placement', 1, 'hold');
INSERT  INTO `candidate_tracker`.`candidate` (`email`,`recruiter_id`,`first_name`,`last_name`,`contact`,`address`,`preferred_loc`,`ectc`,`ctct`,`source`, `current_round`, `status`) 
VALUES ('candidate5@gamil.com',4,'Jugal','Bharmani','7786381542','Andheri','Mumbai',6, 6, 'College Placement', 2, 'hold');

INSERT INTO `candidate_tracker`.`candidate_skills` (`candidate_id`, `skill_id`) VALUES (1, 1), (1, 2), (1, 3), (1, 4);

INSERT INTO `candidate_tracker`.`interview` (`candidate_id`, `interviewer_id`, `start_time`, `end_time`, `feedback`, `updated_by`, `round_no`) 
VALUES (1, 7, '2020-07-15 10:30:00', '2020-07-15 12:30:00', 'Good', 7, 1);

INSERT INTO `candidate_tracker`.`interview` (`candidate_id`, `interviewer_id`, `start_time`, `end_time`, `feedback`, `updated_by`, `round_no`) 
VALUES (1, 7, '2020-08-15 14:30:00', '2020-08-15 16:30:00', 'Amazing', 7, 1);

INSERT INTO `candidate_tracker`.`interview` (`candidate_id`, `interviewer_id`, `start_time`, `end_time`, `feedback`, `updated_by`, `round_no`) 
VALUES (1, 7, '2020-10-15 16:00:00', '2020-07-15 18:00:00', 'Great', 7, 1);

select * from candidate_tracker.roles;
select * from candidate_tracker.user;
select * from candidate_tracker.interviewuser_closure;

# retreiving all children of an admin (Harsh -> id = 1)
use candidate_Tracker;
select first_name, last_name, email from user inner join user_closure on user.id = user_closure.child_id where user_closure.parent_id = 5;
