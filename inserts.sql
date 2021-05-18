set search_path = pictures;

insert into people values (1, 'Claude', 'Monet', '1840-11-14');
insert into people values (2, 'Tiziano', 'Vecelli');
insert into people values (3, 'Jean-Honore', 'Fragonard', '1732-04-05');
insert into people values (4, 'Georges', 'Seurat', '1859-12-02');
insert into people values (5, 'Pablo', 'Picasso', '1881-10-25');
insert into people values (6, 'William', 'Turner', '1775-04-23');
insert into people values (7, 'Henri', 'Matisse', '1869-12-31');
insert into people values (8, 'Gustav', 'Klimt', '1862-06-14');
insert into people values (9, 'David', 'Hockney', '1937-06-09');
insert into people values (10, 'Louisine', 'Havemeyer', '1855-06-28');
insert into people values (11, 'Richard', 'Seymour-Conway', '1800-02-22');
insert into people values (12, 'Helen', 'Bartlett');
insert into people values (13, 'Solomon', 'Guggenheim', '1861-02-02');

insert into museum values (1, 'Vetropolian museum of art', 'New York');
insert into museum values (2, 'Galleria degli Uffizi', 'Florence');
insert into museum values (3, 'Wallace Collection', 'London');
insert into museum values (4, 'Art Institute of Chicago', 'Chicago');
insert into museum values (5, 'Solomon R. Guggenheim Museum', 'New York');
insert into museum values (6, 'The National Gallery', 'London');
insert into museum values (7, 'Yale Center for British Art', 'New Haven');
insert into museum values (8, 'Musée National dArt Moderne', 'Paris');
insert into museum values (9, 'Osterreichische Galerie Belvedere', 'Viena');
insert into museum values (10, 'Museum of Art Lucerne', 'Lucerne');
insert into museum values (11, 'Centre Pompidou', 'Paris');

insert into picture values (1, 'Bridge over a Pond of Water Lilies', 1, 10, 1, '1899');
insert into picture values (2, 'Venus of Urbino', 2, null, 2, '1534');
insert into picture values (3, 'The Swing', 3, 11, 3, '1767');
insert into picture values (4, 'A Sunday Afternoon on the Island of La Grande Jatte', 4, 12, 4, '1886');
insert into picture values (5, 'The Accordionist', 5, 13, 5, '1911');
insert into picture values (6, 'Rain, Steam and Speed', 6, null, 6, '1844');
insert into picture values (7, 'Upper Fall of the Reichenbach: Rainbow', 6, null, 7, '1810');
insert into picture values (8, 'Perseus and Andromeda', 2, null, 2, '1534');
insert into picture values (9, 'La Blouse roumaine', 7, null, 8, '1940');
insert into picture values (10, 'The Kiss', 8, null, 9, '1908');
insert into picture values (11, 'Nichols Canyon', 9, 9, null, '1980');

insert into movement values (1, 'Impressionism');
insert into movement values (2, 'Renaissance');
insert into movement values (3, 'Rococo');
insert into movement values (4, 'Pointillism');
insert into movement values (5, 'Neo-impressionism');
insert into movement values (6, 'Cubism');
insert into movement values (7, 'Abstractionism');
insert into movement values (8, 'Romanticism');
insert into movement values (9, 'Modern');
insert into movement values (10, 'Pop art');

insert into movement_x_picture values (1, 1);
insert into movement_x_picture values (2, 2);
insert into movement_x_picture values (3, 3);
insert into movement_x_picture values (4, 4);
insert into movement_x_picture values (5, 4);
insert into movement_x_picture values (6, 5);
insert into movement_x_picture values (7, 5);
insert into movement_x_picture values (8, 6);
insert into movement_x_picture values (8, 7);
insert into movement_x_picture values (2, 8);
insert into movement_x_picture values (9, 9);
insert into movement_x_picture values (9, 10);
insert into movement_x_picture values (10, 11);

insert into exhibition values (1, 'Tititan: love, desire, death', 6, '2020-03-16', '2021-01-17');
insert into exhibition values (2, 'Lucerne through Turners eyes', 10, '2019-06-01', '2019-08-31');
insert into exhibition values (3, 'Matisse', 11, '2020-10-21', '2021-02-22');
insert into exhibition values(4, 'Salvador Dali & Pablo Picasso');

insert into exhibition_x_picture values (1, 2);
insert into exhibition_x_picture values (2, 6);
insert into exhibition_x_picture values (2, 7);
insert into exhibition_x_picture values (1, 8);
insert into exhibition_x_picture values (3, 9);
