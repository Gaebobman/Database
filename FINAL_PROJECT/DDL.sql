create table theme
	(ID		varchar(4),
	 theme		varchar(40),
	 primary key (ID)
	);

create table related_theme
	(main_theme_ID	varchar(4),
	 rel_theme_ID    varchar(4),
     primary key (main_theme_ID),
     foreign key (main_theme_ID) references theme (ID),
     foreign key (rel_theme_ID) references theme (ID)
        on delete set null
	);

create table publisher
    (ID     varchar(8),
     name   varchar(40),
     address    varchar(100),
     tel      varchar(11),
     primary key(ID)
    );

create table book
    (ISBN   varchar(13),
     publisher_ID   varchar(12),
     theme_ID   varchar(4),
     title  varchar(100),
     pages  numeric(4),
     price  numeric(7),
     author_number  numeric(1),
     publication_date   date,
     primary key (ISBN),
     foreign key (publisher_ID) references publisher(ID)
        on delete set null,
     foreign key (theme_ID) references theme(ID)
        on delete set null
    );

create table author
    (ID     varchar(6),
     name   varchar(100),
     primary key(ID)
    );

create table customer
    (ID     varchar(8),
     name   varchar(30),
     point  numeric(3) check(point >= 0),
     address    varchar(100),
     tel    varchar(11),
     primary key(ID)
    );
create table purchase_record
    (customer_ID    varchar(12),
     book_ISBN      varchar(13),
     primary key (customer_ID, book_ISBN),
     foreign key (customer_ID) references customer(ID)
        on delete set null,
     foreign key (book_ISBN) references book(ISBN)
        on delete set null
    );

create table book_review
    (book_ISBN  varchar(13),
     customer_ID  varchar(12),
     review     varchar(200),
     rate       numeric(1) check(rate >=0 and rate <=5),
     primary key(book_ISBN, customer_ID),
     foreign key(book_ISBN) references book(ISBN)
        on delete set null,
     foreign key(customer_ID) references customer(ID)
        on delete set null
    );
create table writes(
    author_ID    varchar(6),
    book_ISBN  varchar(13),
    primary key(author_ID, book_ISBN),
    foreign key(author_ID) references author(ID)
        on delete set null,
    foreign key(book_ISBN) references book(ISBN)
        on delete set null
);

