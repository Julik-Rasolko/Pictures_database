set search_path = pictures;

-- artists and owners separated
create or replace view artists as
  select distinct
    name
    , surname
  from people
  where human_id in (select distinct artist_id from picture);

select * from artists;
---
create or replace view owners as
  select distinct
    name
    , surname
  from people
  where human_id in (select distinct owner_id from picture);

select * from owners;

-- which time period of the movement is represented in the base
create or replace view movement_years_represented as
    select
      movement_nm
      , min(paint_year) as from
      , max(paint_year) as to
    from movement
      inner join movement_x_picture mxp
        on movement.movement_id = mxp.movement_id
      inner join picture p
        on mxp.picture_id = p.picture_id
    group by movement_nm
    order by movement_nm;

select * from movement_years_represented;

-- exhibitions, that are still running
create or replace view current_exhibitions as
  select
      exhibition_nm
      , museum_nm
      , city
      , begin_dt
      , end_dt
    from exhibition left join museum
      on exhibition.museum_id = museum.museum_id
    where end_dt > current_date;

select * from current_exhibitions;

-- if you want to guess the city of the museum by yourself
create or replace view guess_city_game as
  select
    museum_nm
    ,  overlay(city placing '*' from 2 for 100) as blured_city
  from museum;

select * from guess_city_game;

-- pictures with similar movements
create or replace view similar_movement_pictures as
    select
      pic_1.picture_nm as picture
      , string_agg(pic_2.picture_nm, ', ') as similar_movement
    from (select * from picture
            inner join movement_x_picture mxp
              on picture.picture_id = mxp.picture_id) pic_1
      left join (select * from picture
                    inner join movement_x_picture m
                      on picture.picture_id = m.picture_id) pic_2
        on pic_1.movement_id = pic_2.movement_id
           and pic_1.picture_nm > pic_2.picture_nm
    group by pic_1.picture_nm
    having string_agg(pic_2.picture_nm, ', ') is not null
    order by pic_1.picture_nm;

select * from similar_movement_pictures;
