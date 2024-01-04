-- Biblioteksopgave - torsdag

-- Lav følgende SQL-forespørgsler i Query Tool

--   4.1 Find en låner ud fra et specifikt laaner_id.

select * from laaner 
where laaner_id = 2;

--   4.2 Find alle lånere, og vis deres data inklusive postnummer og by.
-- Fordi kolonnen hedder 'postnr' i begge tabeller kan vi bruge USING i stedet for ON column_name1 = column_name2

select * 
from laaner l
inner join postnummer p 
using(postnr);

--   4.3 Find alle bøger, og deres forfattere

select * from bog
inner join forfatter f
using(forfatter_id);

--   4.5 Find alle lånere og de bøger de har lånt. Medtag også bogtitler og evt. forfatter

select *
from laaner l
inner join udlaan
using(laaner_id)
inner join bog
using(bog_id)
inner join forfatter
using(forfatter_id);

--   4.6 Vis alle de udlån, som har at gøre med en bestemt bog. F.eks. "Den lange rejse".
-- Ved at bruge LIKE kan vi finde en titel, selvom vi ikke helt kan huske hvad bogen hedder

select * from laaner l 
inner join udlaan u 
on l.laaner_id = u.laaner_id
inner join bog
on bog.bog_id = u.bog_id
inner join forfatter f
on bog.forfatter_id = f.forfatter_id
where bog.titel like '%rejse';


-- Lav følgende DML sætninger i Query Tool:

--   Indsæt en ny låner (insert)

insert into laaner(navn, adresse, postnr) 
values ('Jønke', 'Rabalderstræde 12', 7500);

--   Opret et nyt udlån af en bog (insert)

insert into udlaan (laaner_id, bog_id, dato) 
values (3, 3, '2022-03-24');

--   Fjern et udlån (delete)

delete from udlaan
where laaner_id = 1 and bog_id = 3 and dato = '2022-03-08';

--   Rediger en bogtitel (update)

update bog
set titel = 'Sofies meget store verden'
where bog_id = 1;

-- Kæmpe join

select l.laaner_id, l.navn as laaner_navn, adresse, p.postnr, bog.bog_id, u.dato, 
titel, udgivelsesaar, f.forfatter_id, f.navn as forfatter_navn 
from laaner l
inner join postnummer p
on l.postnr = p.postnr
inner join udlaan u 
on l.laaner_id = u.laaner_id
inner join bog
on bog.bog_id = u.bog_id
inner join forfatter f
on bog.forfatter_id = f.forfatter_id
where bog.titel like 'Vinter%';
