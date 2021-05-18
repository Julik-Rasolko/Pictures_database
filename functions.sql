set search_path = pictures;

-- returns a list of pictures by the artist
create or replace function pictures_by_artist(artist_surname text)
  returns text as $$
      select
        string_agg(picture_nm, ', ')
      from picture inner join people
        on picture.artist_id = people.human_id
           and surname = artist_surname;
    $$ language sql;

select * from pictures_by_artist('Turner') as Turner_pictures;

-- adds a new exhibition, adding a new museum if needed
create or replace function new_museum_id(museum_name text)
  returns int as $$
    insert into museum values(
        (select max(museum_id) + 1 from museum),museum_name);
    select max(museum_id) from museum;
    $$ language sql;

create or replace procedure
    add_new_exhibition(name text, museum_name text,
                       begin_date date, end_date date)
      language sql as $$
        insert into exhibition values(
          (select max(exhibition_id) + 1 from exhibition),
          name,
          (case
              when (select museum_nm from museum
                    where museum_nm = museum_name) is not null
                then (select museum_id from museum
                      where museum_nm = museum_name)
              else new_museum_id(museum_name)
          end),
          begin_date, end_date);
    $$;

call add_new_exhibition('Salvador Dali & Pablo Picasso',
  'Garden named after Bauman',
    '2018-10-05', '2021-07-25')
