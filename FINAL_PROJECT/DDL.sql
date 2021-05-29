create table theme
	(ID		varchar(4),
	 theme		varchar(10),
	 primary key (theme)
	);

create table related_theme
	(main_theme_ID	varchar(4),
	 rel_theme_ID    varchar(4)
	 primary key (main_theme_ID),
     foreign key (rel_theme_ID) references instructor (ID)
        on delete set null
	);

create table publisher
    (ID     varchar(8),
     name   varchar(10),
     address    varchar(40),
     tel      varchar(11),
     primary key(ID)
    );

create table book
    (ISBN   varchar(13),
     author_ID     varchar(6),
     publisher_ID   varchar(12),
     title  varchar(30),
     pages  numeric(4),
     price  numeric(7),
     author_number  numeric(1),
     primary key (ISBN, author_ID),
     foreign key (publisher_ID) references publisher(ID)
        on delete set null,
     foreign key (author_ID) references author(ID)
        on delete set null
    );

create table author
    (ID     varchar(6),
     name   varchar(10)
     primary key(ID)
    );

create table purchase_record
    (customer_ID    varchar(12),
     book_ISBN      varchar(12),
     primary key (customer_ID, book_ISBN),
     foreign key (book_ISBN) references book(ISBN)
        on delete set null
    );

create table book_review
    (book_ISBN  varchar(13),
     customer_ID  varchar(12),
     review     varchar(100),
     rate       numeric(1),
     primary key(book_ISBN, customer_name),
     foreign key(book_ISBN) references book(ISBN),
     foreign key(customer_ID) references customer(ID)
        on delete set null
    );

create table customer
    (ID     varchar(8),
     name   varchar(10),
     point  numeric(3),
     address    varchar(40),
     tel    varchar(11)
     primary key(ID)
    );
