INSERT INTO `department` (`department_id`, `name`) VALUES
(1, '国会'),
(2, '内閣'),
(3, '最高裁判所'),
(4, '衆議院'),
(5, '参議院'),
(6, '総務省'),
(7, '法務省'),
(8, '外務省'),
(9, '財務省'),
(10, '高等裁判所'),
(11, '消防庁'),
(12, '国税庁'),
(13, '地方裁判所'),
(14, '家庭裁判所'),
(15, '簡易裁判所');

INSERT INTO `department_adjacency_list` (`department_id`, `parent_id`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 3),
(11, 6),
(12, 9),
(13, 10),
(14, 10),
(15, 13);

INSERT INTO `department_path_enumeration` (`department_id`, `path`) VALUES
(1, '1/'),
(2, '2/'),
(3, '3/'),
(4, '1/4/'),
(5, '1/5/'),
(6, '2/6/'),
(7, '2/7/'),
(8, '2/8/'),
(9, '2/9/'),
(10, '3/10/'),
(11, '2/6/11/'),
(12, '2/9/12/'),
(13, '3/10/13/'),
(14, '3/10/14/'),
(15, '3/10/13/15/');

INSERT INTO `department_nested_sets` (`department_id`, `left`, `right`, `depth`) VALUES
(1, 1, 6, 0),
(2, 7, 20, 0),
(3, 21, 30, 0),
(4, 2, 3, 1),
(5, 4, 5, 1),
(6, 8, 11, 1),
(7, 12, 13, 1),
(8, 14, 15, 1),
(9, 16, 19, 1),
(10, 22, 29, 1),
(11, 9, 10, 2),
(12, 17, 18, 2),
(13, 23, 26, 2),
(14, 27, 28, 2),
(15, 24, 25, 3);

INSERT INTO `department_closure_table` (`ancestor`, `descendant`, `path_length`) VALUES
(1, 1, 0),
(1, 4, 1),
(1, 5, 1),
(2, 2, 0),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 11, 2),
(2, 12, 2),
(3, 3, 0),
(3, 10, 1),
(3, 13, 2),
(3, 14, 2),
(3, 15, 3),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(6, 11, 1),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(9, 12, 1),
(10, 10, 0),
(10, 13, 1),
(10, 14, 1),
(10, 15, 2),
(11, 11, 0),
(12, 12, 0),
(13, 13, 0),
(13, 15, 1),
(14, 14, 0),
(15, 15, 0);
