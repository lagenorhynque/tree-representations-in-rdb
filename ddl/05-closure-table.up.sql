CREATE TABLE `department_closure_table` (
  `ancestor` int(10) unsigned NOT NULL,
  `descendant` int(10) unsigned NOT NULL,
  `path_length` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ancestor`, `descendant`),
  FOREIGN KEY (`ancestor`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  FOREIGN KEY (`descendant`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT
);
