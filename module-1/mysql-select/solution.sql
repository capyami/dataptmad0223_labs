-- MYSQL select 1

SELECT 
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	titles.title AS TITLE,
	publishers.pub_name AS PUBLISHER
FROM
	authors
	inner join titleauthor on authors.au_id = titleauthor.au_id
	inner join titles on titleauthor.title_id = titles.title_id
	inner join publishers on titles.pub_id = publishers.pub_id;



-- MYSQL select 2

SELECT 
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	publishers.pub_name AS PUBLISHER,
	count(titles.title) AS 'TITLE COUNT'
FROM
	authors
	inner join titleauthor on authors.au_id = titleauthor.au_id
	inner join titles on titleauthor.title_id = titles.title_id
	inner join publishers on titles.pub_id = publishers.pub_id
GROUP BY 
    titleauthor.au_id;
	



    --- mysql select 3

SELECT 
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	count(titles.title_id) as TOTAL
FROM
	authors
	inner join titleauthor on authors.au_id = titleauthor.au_id
	inner join titles on titleauthor.title_id = titles.title_id
	inner join publishers on titles.pub_id = publishers.pub_id
group by
	authors.au_id
order BY 
	TOTAL DESC
limit
	3;



    --- MYSQL SELECT 4

sELECT 
	authors.au_id AS AUTHOR_ID,
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	iFNULL(count(titles.title_id), 0) as TOTAL
FROM
	authors
	LEFT join titleauthor on authors.au_id = titleauthor.au_id
	LEFT join titles on titleauthor.title_id = titles.title_id
	LEFT join publishers on titles.pub_id = publishers.pub_id
group by
	authors.au_id
order BY 
	TOTAL DESC;