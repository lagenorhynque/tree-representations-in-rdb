CREATE TABLE `department_nested_sets` (
  `department_id` int(10) unsigned NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  PRIMARY KEY (`department_id`),
  FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT
);
