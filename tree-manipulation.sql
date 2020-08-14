SELECT
  *
  FROM
	  department;

/* adjacency list model */

SELECT
  *
  FROM
	  department_adjacency_list;


WITH RECURSIVE department_tree AS (
  SELECT
	d.*,
	dal.parent_id,
	0 distance
	FROM
		department d
		JOIN department_adjacency_list dal USING (department_id)
   WHERE
		dal.parent_id IS NULL
   UNION ALL
  SELECT
	d.*,
	dal.parent_id,
	dt.distance + 1
	FROM
		department d
		JOIN department_adjacency_list dal USING (department_id)
		JOIN department_tree dt ON dal.parent_id = dt.department_id
)
SELECT
  *
  FROM
	  department_tree;


WITH RECURSIVE department_tree AS (
  SELECT
	d.*,
	dal.parent_id,
	0 distance
	FROM
		department d
		JOIN department_adjacency_list dal USING (department_id)
   WHERE
		d.department_id = 10
   UNION ALL
  SELECT
	d.*,
	dal.parent_id,
	dt.distance + 1
	FROM
		department d
		JOIN department_adjacency_list dal USING (department_id)
		JOIN department_tree dt ON dal.parent_id = dt.department_id
)
SELECT
  *
  FROM
	  department_tree;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_adjacency_list dal USING (department_id)
 WHERE
	dal.parent_id = 10;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_adjacency_list dal ON d.department_id = dal.parent_id
 WHERE
	dal.department_id = 10;

/* path enumeration model */

SELECT
  *
  FROM
	  department_path_enumeration;


SELECT
  d.*,
  dpe.path,
  CHAR_LENGTH(dpe.path) - CHAR_LENGTH(REPLACE(dpe.path, '/', '')) - 1 depth
  FROM
	  department d
	  JOIN department_path_enumeration dpe USING (department_id);


SELECT
  d.*,
  dpe.path,
  CHAR_LENGTH(dpe.path) - CHAR_LENGTH(REPLACE(dpe.path, '/', '')) - 1 depth
  FROM
	  department d
	  JOIN department_path_enumeration dpe USING (department_id)
 WHERE
	dpe.path LIKE CONCAT((
	  SELECT
		path FROM department_path_enumeration
	   WHERE
			department_id = 10), '%');


SELECT
  d.*
  FROM
	  department d
	  JOIN department_path_enumeration dpe USING (department_id)
 WHERE
	dpe.path REGEXP CONCAT((
	  SELECT
		path FROM department_path_enumeration
	   WHERE
			department_id = 10), '\\d+/$');


SELECT
  d.*
  FROM
	  department d
 WHERE
	d.department_id = (
	  SELECT
		CASE WHEN path = CONCAT(department_id, '/') THEN
				                                    NULL
		ELSE
		REGEXP_REPLACE(path, '^(?:\\d+/)*(\\d+)/\\d+/$', '\\1')
		END
		FROM
			department_path_enumeration
	   WHERE
			department_id = 10);

/* nested sets model */

SELECT
  *
  FROM
	  department_nested_sets;


SELECT
  d.*,
  dns.left,
  dns.right,
  dns.depth
  FROM
	  department d
	  JOIN department_nested_sets dns USING (department_id);


SELECT
  d.*,
  dns.left,
  dns.right,
  dns.depth
  FROM
	  department d
	  JOIN department_nested_sets dns USING (department_id)
	  JOIN department_nested_sets dns2 ON dns.left BETWEEN dns2.left
		  AND dns2.right
 WHERE
	dns2.department_id = 10;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_nested_sets dns USING (department_id)
	  JOIN department_nested_sets dns2 ON dns.left BETWEEN dns2.left
		  AND dns2.right
 WHERE
	dns2.department_id = 10
   AND dns.depth = (
	 SELECT
	   depth
	   FROM
		   department_nested_sets
	  WHERE
			department_id = 10) + 1;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_nested_sets dns USING (department_id)
	  JOIN department_nested_sets dns2 ON dns2.left BETWEEN dns.left
		  AND dns.right
 WHERE
	dns2.department_id = 10
   AND dns.depth + 1 = (
	 SELECT
	   depth
	   FROM
		   department_nested_sets
	  WHERE
			department_id = 10);

/* closure table model */

SELECT
  *
  FROM
	  department_closure_table;


SELECT
  d.*,
  COUNT(*) - 1 depth
  FROM
	  department d
	  JOIN department_closure_table dct ON d.department_id = dct.descendant
 GROUP BY
	dct.descendant;


SELECT
  d.*,
  dct.path_length distance,
  dct2.depth
  FROM
	  department d
	  JOIN department_closure_table dct ON d.department_id = dct.descendant
	  JOIN (
		SELECT
		  descendant,
		  COUNT(*) - 1 depth
		  FROM
			  department_closure_table
		 GROUP BY
			descendant) dct2 ON d.department_id = dct2.descendant
 WHERE
	dct.ancestor = 10;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_closure_table dct ON d.department_id = dct.descendant
 WHERE
	dct.ancestor = 10
   AND dct.path_length = 1;


SELECT
  d.*
  FROM
	  department d
	  JOIN department_closure_table dct ON d.department_id = dct.ancestor
 WHERE
	dct.descendant = 10
   AND dct.path_length = 1;
