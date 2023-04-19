


--- advanced mysql 1 step 1

select 
	titleauthor.title_id as 'Title ID',
	titleauthor.au_id as 'Author ID',
	titles.advance * titleauthor.royaltyper / 100 as 'Advance of each title and author',
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'Royalty of each sale'
from titleauthor
inner join titles on titleauthor.title_id = titles.title_id
inner join sales on titles.title_id = sales.title_id;


--- For me
'''SELECT 
    titleauthor.title_id AS 'Title ID', 
    titleauthor.au_id AS 'Author ID', 
    titles.advance * titleauthor.royaltyper / 100 AS 'Advance', 
    titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Royalty of each sale'
FROM 
    titles 
    INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id 
    INNER JOIN sales ON titles.title_id = sales.title_id AND titleauthor.au_id = sales.au_id 
ORDER BY 
    titleauthor.title_id, 
    titleauthor.au_id;'''
    

--- advanced mysql 1 step 2

select 
	titleauthor.title_id as 'Title ID',
	titleauthor.au_id as 'Author ID',
	titles.advance * titleauthor.royaltyper / 100 as 'Advance of each title and author',
	sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as 'Aggregated royalties of each title for each author'
from titleauthor
inner join titles on titleauthor.title_id = titles.title_id
inner join sales on titles.title_id = sales.title_id
group by titleauthor.au_id, titleauthor.title_id
order by titleauthor.title_id desc;


--- advanced mysql 1 step 3

select 
	titleauthor.title_id as 'Title ID',
	titleauthor.au_id as 'Author ID',
	cast(sum(titles.advance * titleauthor.royaltyper / 100) + sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)as float) as 'Profits of each author by aggregating the advance and total royalties of each title'
from titleauthor
inner join titles on titleauthor.title_id = titles.title_id
inner join sales on titles.title_id = sales.title_id
group by titleauthor.au_id, titleauthor.title_id
order by "Profits of each author by aggregating the advance and total royalties of each title" desc
limit 15;

--- sql advanced 2

SELECT 
    titleauthor.title_id AS 'Title ID', 
    titleauthor.au_id AS 'Author ID', 
    SUM(titles.advance * titleauthor.royaltyper / 100) AS 'Total Advance', 
    SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Aggregated royalties of each title for each author'
FROM 
    titles 
    INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id 
    INNER JOIN sales ON titles.title_id = sales.title_id AND titleauthor.title_id = sales.title_id 
GROUP BY 
    titleauthor.title_id, 
    titleauthor.au_id;


--- sql advanced 3


SELECT 
    titleauthor.au_id AS 'Author ID', 
    SUM(subquery.total_profit) AS 'Profits of each author by aggregating the advance and total royalties of each title'
FROM 
    titleauthor 
    INNER JOIN (
        SELECT 
            titles.title_id, 
            titleauthor.au_id, 
            titles.advance * titleauthor.royaltyper / 100 + titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'total_profit'
        FROM 
            titles 
            INNER JOIN titleauthor ON titles.title_id = titleauthor.title_id 
            INNER JOIN sales ON titles.title_id = sales.title_id AND titleauthor.title_id = sales.title_id 
    ) AS subquery ON titleauthor.title_id = subquery.title_id AND titleauthor.au_id = subquery.au_id 
GROUP BY 
    titleauthor.au_id 
ORDER BY 
    SUM(subquery.total_profit) DESC 
LIMIT 
    3;
