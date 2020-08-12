CREATE TABLE `department_path_enumeration` (
  `department_id` int(10) unsigned NOT NULL,
  `path` varchar(1000) NOT NULL,
  PRIMARY KEY (`department_id`),
  FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT
);
