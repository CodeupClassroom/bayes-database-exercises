
Relationships
-------------
1:1 relationship (same table)
1:Many (Many:1)
Many:Many

Users table (one)
id, username, password, last_login
1, bobby, P@SSW)RD
2, janejaneway, 23ofkj3filjf3

Emails table (many - your foreign key goes on the many table)
id, email, type, user_id
1, bob@bob.com, work, 1
2, bob@aol.com, personal, 1
3, bob@yahoo.com, spam, 1


Articles
id, title, body, author_id
1, hello world, a story of programming, 1
2, goodbye world, a story of unplugging from modernity, 1
3, coming back to the world, a story of renwal, 1
4, secret of life, get off your butt, 2


Authors
id, name
1, janejaneway
2, bob
3, pat


Many to Many (is like two 1:manys together)
Books
id, ISBN, title
1, 123abc, weapons of math destruction, 
2, 234def, cilantro diaries
3, 345efg, eat pray code

joiner table (junction table)
authors_books
id, author_id, book_id, royalty%
1, 1, 3, 33
2, 2, 3, 33
3, 3, 3, 33
4, 1, 1, 100

when considering the relationship between tables, ask the following
can one owner have many cars?
can one car have many owners?
if the answer is yes to both, then it's a many-to-many w/ a joiner table

can a blog post have many users? no
can an user have many blog posts? yes 
then we have a 1:many where one user has many blog posts

can one author write many books? yes
can one book be written by many authors? yes
then it's a many-to-many!

can one blog post have many comments? yes
can one comment have or belong to many blog posts? no
then it's a 1:many, 1 post has many comments


