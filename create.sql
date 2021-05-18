create schema pictures;

set search_path = pictures;

drop table if exists people cascade;
create table people(
    human_id serial PRIMARY KEY
    , name text
    , surname text
    , birth_dt date
);

drop table if exists museum cascade;
create table museum(
    museum_id serial PRIMARY KEY
    , museum_nm text
    , city text
);

drop table if exists picture cascade;
create table picture(
    picture_id serial PRIMARY KEY
    , picture_nm text
    , artist_id int references people(human_id)
    , owner_id int references people(human_id)
    , museum_id int references museum(museum_id)
    , paint_year int
);

drop table if exists movement cascade;
create table movement(
    movement_id serial PRIMARY KEY
    , movement_nm text
);

drop table if exists movement_x_picture cascade;
create table movement_x_picture(
    movement_id int references movement(movement_id)
    , picture_id int references picture(picture_id)
);

drop table if exists exhibition cascade;
create table exhibition(
    exhibition_id serial PRIMARY KEY
    , exhibition_nm text
    , museum_id int references museum(museum_id)
    , begin_dt date
    , end_dt date
);

drop table if exists exhibition_x_picture cascade;
create table exhibition_x_picture(
    exhibition_id int references exhibition(exhibition_id)
    , picture_id int references picture(picture_id)
);
