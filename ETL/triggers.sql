drop trigger if exists delete_agregadas;
DELIMiTER $$
create trigger delete_agregadas after delete on datawarehouse.f_vendas for each row
begin
declare newhora smallint(2) default 0;
declare newdia smallint(2) default 0;
declare newmes smallint(2) default 0;
declare newano smallint(2) default 0;
declare newdiasemana smallint(2) default 0;
declare newtrimestre smallint(2) default 0;
declare newdata datetime;
declare newlucro_total decimal(14,6);
declare percentual_icms decimal (4,2);
declare newicms_venda decimal (13,6);
insert into staging.f_vendas_deletadas values (OLD.COO,old.CCF,old.id_loja,old.id_produto,old.id_data,old.id_icms, old.qtd_produto,old.custo_produto,old.valor_produto,old.total_venda,old.total_venda);
set newlucro_total = OLD.total_venda - OLD.total_custo;
set newicms_venda = OLD.total_venda * (select alq_percentual from d_icms where id_icms=OLD.id_icms);
select  hora, dia, mes, ano, diasemana, trimestre, data into  newhora, newdia, newmes, newano, newdiasemana, newtrimestre, newdata from datawarehouse.d_data where id_data = OLD.id_data;
insert into datawarehouse.venda_produto_hora values (OLD.id_loja,OLD.id_produto,newano,newtrimestre,newmes,newdata,newdia,newhora,old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newdiasemana,newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
insert into datawarehouse.venda_produto_dia values (OLD.id_loja,OLD.id_produto,newano,newtrimestre,newmes,newdata,newdiasemana, newdia,old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
insert into datawarehouse.venda_produto_diasemana values (OLD.id_loja,OLD.id_produto,newano,newtrimestre,newmes,newdiasemana, old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
insert into datawarehouse.venda_produto_mes values (OLD.id_loja,OLD.id_produto,newano,newtrimestre,newmes, old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
insert into datawarehouse.venda_produto_trimestre values (OLD.id_loja,OLD.id_produto,newano,newtrimestre, old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
insert into datawarehouse.venda_produto_ano values (OLD.id_loja,OLD.id_produto,newano, old.valor_produto,old.valor_produto,old.valor_produto,old.custo_produto,old.custo_produto,old.custo_produto,'teste','teste',10,OLD.id_icms, 0, OLD.qtd_produto*(-1),OLD.total_venda*(-1),OLD.total_custo*(-1),newlucro_total*(-1),newicms_venda*(-1)) on duplicate key update qtd_produto = OLD.qtd_produto*(-1), total_venda = OLD.total_venda*(-1),total_custo = OLD.total_custo*(-1),lucro_total = newlucro_total*(-1), icms_venda = newicms_venda*(-1);
end$$



drop trigger if exists insert_agregadas;
DELIMiTER $$
create trigger insert_agregadas after insert on datawarehouse.f_vendas for each row
begin
declare newhora smallint(2) default 0;
declare newdia smallint(2) default 0;
declare newmes smallint(2) default 0;
declare newano smallint(2) default 0;
declare newdiasemana smallint(2) default 0;
declare newtrimestre smallint(2) default 0;
declare newdata datetime;
declare newproduto_desc varchar(100);
declare newproduto_descvenda varchar(50);
declare newid_tipo_produto int(11);
declare newproduto_desativado boolean;
declare newlucro_total decimal(14,6);
declare percentual_icms decimal (4,2);
declare newicms_venda decimal (14,6);
SET SQL_SAFE_UPDATES=0;
delete from venda_produto_hora where qtd_produto < 0;
delete from venda_produto_dia where qtd_produto < 0;
delete from venda_produto_diasemana where qtd_produto < 0;
delete from venda_produto_mes where qtd_produto < 0;
delete from venda_produto_trimestre where qtd_produto < 0;
delete from venda_produto_ano where qtd_produto < 0;
SET SQL_SAFE_UPDATES=1;
set newlucro_total = NEW.total_venda - NEW.total_custo;
set newicms_venda = new.total_venda * (select alq_percentual from d_icms where id_icms=NEW.id_icms);
select produto_desc, produto_descvenda, id_tipo_produto, produto_desativado into  newproduto_desc, newproduto_descvenda, newid_tipo_produto, newproduto_desativado from d_produto where id_produto = NEW.id_produto;
select  hora, dia, mes, ano, diasemana, trimestre, data into  newhora, newdia, newmes, newano, newdiasemana, newtrimestre, newdata from datawarehouse.d_data where id_data = New.id_data;
insert into datawarehouse.venda_produto_hora values (NEW.id_loja,NEW.id_produto,newano,newtrimestre,newmes,newdata,newdia,newhora,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newdiasemana,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
insert into datawarehouse.venda_produto_dia values (NEW.id_loja,NEW.id_produto,newano,newtrimestre,newmes,newdata,newdiasemana,newdia,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
insert into datawarehouse.venda_produto_diasemana values (NEW.id_loja,NEW.id_produto,newano,newtrimestre,newmes,newdiasemana,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
insert into datawarehouse.venda_produto_mes values (NEW.id_loja,NEW.id_produto,newano,newtrimestre,newmes,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
insert into datawarehouse.venda_produto_trimestre values (NEW.id_loja,NEW.id_produto,newano,newtrimestre,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
insert into datawarehouse.venda_produto_ano values (NEW.id_loja,NEW.id_produto,newano,NEW.valor_produto,NEW.valor_produto,NEW.valor_produto,NEW.custo_produto,NEW.custo_produto,NEW.custo_produto,newproduto_desc,newproduto_descvenda,newid_tipo_produto,NEW.id_icms, newproduto_desativado, New.qtd_produto,NEW.total_venda,NEW.total_custo,newlucro_total,newicms_venda) on duplicate key update qtd_produto = New.qtd_produto, total_venda = NEW.total_venda,total_custo = NEW.total_custo,lucro_total = newlucro_total, icms_venda = newicms_venda;
end$$

drop trigger if exists update_agregada_hora;
DELIMiTER $$
create trigger update_agregada_hora before update on datawarehouse.venda_produto_hora for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$

drop trigger if exists update_agregada_dia;
DELIMiTER $$
create trigger update_agregada_dia before update on datawarehouse.venda_produto_dia for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$

drop trigger if exists update_agregada_diasemana;
DELIMiTER $$
create trigger update_agregada_diasemana before update on datawarehouse.venda_produto_diasemana for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$

drop trigger if exists update_agregada_mes;
DELIMiTER $$
create trigger update_agregada_mes before update on datawarehouse.venda_produto_mes for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$

drop trigger if exists update_agregada_trimestre;
DELIMiTER $$
create trigger update_agregada_trimestre before update on datawarehouse.venda_produto_trimestre for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$

drop trigger if exists update_agregada_ano;
DELIMiTER $$
create trigger update_agregada_ano before update on datawarehouse.venda_produto_ano for each row
begin
set NEW.total_venda = NEW.total_venda + old.total_venda;
set NEW.total_custo = NEW.total_custo + old.total_custo;
set NEW.lucro_total = OLD.lucro_total + NEW.lucro_total;
set NEW.icms_venda = old.icms_venda + NEW.icms_venda;
set NEW.qtd_produto = old.qtd_produto + NEW.qtd_produto;
set NEW.custo_produto_medio = ifnull(NEW.total_custo/NEW.qtd_produto,0);
set NEW.valor_produto_medio = ifnull(NEW.total_venda/NEW.qtd_produto,0);
if NEW.custo_produto_maximo < OLD.custo_produto_maximo then SET NEW.custo_produto_maximo = OLD.custo_produto_maximo;
end if;
if NEW.custo_produto_minimo > OLD.custo_produto_minimo then SET NEW.custo_produto_minimo = OLD.custo_produto_minimo;
end if;
if NEW.valor_produto_maximo < OLD.valor_produto_maximo then SET NEW.valor_produto_maximo = OLD.valor_produto_maximo;
end if;
if NEW.valor_produto_minimo > OLD.valor_produto_minimo then SET NEW.valor_produto_minimo = OLD.valor_produto_minimo;
end if;
end$$