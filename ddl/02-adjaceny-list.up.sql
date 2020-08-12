CREATE TABLE `department_adjacency_list` (
  `department_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  FOREIGN KEY (`parent_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT
);
