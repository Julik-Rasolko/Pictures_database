set search_path = pictures;

-- CRUD(create, read, update, and delete)
-- insert, select, update, delete

-- not longer interested in Dali exhibition
delete
  from exhibition
  where exhibition_nm like '%Dali%';

-- remembered, that the exhibition with the painting, that has
-- something to do with Rainbow, was shortened
update exhibition
  set end_dt = '2019-08-30'
  where exhibition_id =
        (select distinct
            e.exhibition_id
        from exhibition e
            inner join exhibition_x_picture exp
                on e.exhibition_id = exp.exhibition_id
            inner join picture p
                on exp.picture_id = p.picture_id
            where picture_nm like '%Rainbow%');

-- a new exhibition in a museum in Florence
insert into exhibition values (4, 'Pietro Aretino and Renaissance art',
  (select museum_id
     from museum
     where city = 'Florence'), '2021-02-01', current_date + 3);

-- exhibitions, that are still running
select
  exhibition_nm
  , museum_nm
  , city
  , begin_dt
  , end_dt
from exhibition left join museum
  on exhibition.museum_id = museum.museum_id
where end_dt > current_date;

-----------------------------------------------------------------

-- top of the artist's numbers of pictures in the base
select
  name
  , surname
  , count(picture.picture_id)
from picture
  inner join people
    on picture.artist_id = people.human_id
group by human_id
order by count(picture.picture_id) desc;

-- frequent movements with their pictures-representatives
select
  movement_nm
  ,  string_agg(picture_nm, ', ') as pictures
from movement
  inner join movement_x_picture mxp
    on movement.movement_id = mxp.movement_id
  inner join picture
    on mxp.picture_id = picture.picture_id
group by movement_nm
having count(picture_nm) > 1;

-- the difference between artist's birth dates
select
  concat(name, surname) as full_name
  , birth_dt
  , (round((lead(birth_dt) over(order by birth_dt) - birth_dt)/365)) as diff_in_years
from people
where birth_dt is not null;

-- the same, but accumulative
with diff as (
    select concat(name, surname) as                                            full_name
         , birth_dt
         , (round((lead(birth_dt) over (order by birth_dt) - birth_dt) / 365)) diff_in_years
    from people
    where birth_dt is not null
)
select
  full_name
  , birth_dt
  , sum(diff_in_years) over(order by birth_dt) as acc_diff_year
from diff;

-- artists, who also owe paintings
select
  *
from ( (select name, surname
      from picture
        inner join people
          on picture.artist_id = people.human_id)
      intersect
        (select name, surname
      from picture
        inner join people
          on picture.owner_id = people.human_id) ) t;
