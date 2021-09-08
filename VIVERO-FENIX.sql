--CREO LA BASE DE DATOS
create database vivero_fenix

--USO LA BASE DE DATOS
use vivero_fenix

--CREO LAS TABLAS NECESARIAS
create table calles(
 id_calle int identity,
 nombre varchar(30),
 constraint pk_calles primary key(id_calle)
)

create table barrios(
 id_barrio int identity,
 nombre varchar(30),
 constraint pk_barrios primary key(id_barrio)
)

create table localidades(
 id_localidad int identity,
 nombre varchar(100),
 constraint pk_localidades primary key(id_localidad)
)

create table provincias(
 id_provincia int identity,
 nombre varchar(100),
 constraint pk_provincias primary key(id_provincia)
)

create table tipos_plantas(
 id_tipo_planta int identity,
 nombre varchar(100),
 constraint pk_id_tipo_planta primary key(id_tipo_planta)
)

create table condiciones_iva(
 id_condicion_iva int identity,
 descripcion varchar(100),
 constraint pk_id_condicion_iva primary key(id_condicion_iva)
)

create table formas_pago(
 id_forma_pago int identity,
 descripcion varchar(100),
 constraint pk_id_forma_pago primary key(id_forma_pago)
)

create table plantas(
 id_planta int identity,
 descripcion varchar(100),
 id_tipo_planta int,
 precio money,
 stock int,
 constraint pk_id_planta primary key(id_planta),
 constraint fk_id_tipo_planta foreign key(id_tipo_planta) references tipos_plantas(id_tipo_planta)
)

create table clientes(
 id_cliente int identity,
 apellido varchar(100),
 nombre varchar(100),
 id_calle int,
 altura int,
 id_barrio int,
 id_localidad int,
 id_provincia int,
 telefono numeric,
 id_condicion_iva int,
 cuit numeric,
 deudor varchar(100),
 email varchar(100),
 constraint pk_id_cliente primary key(id_cliente),
 constraint fk_cal_cli foreign key(id_calle) references calles(id_calle),
 constraint fk_bar_cli foreign key(id_barrio) references barrios(id_barrio),
 constraint fk_loc_cli foreign key(id_localidad) references localidades(id_localidad),
 constraint fk_prov_cli foreign key(id_provincia) references provincias(id_provincia),
 constraint fk_con_cli foreign key(id_condicion_iva) references condiciones_iva(id_condicion_iva)
)

create table facturas(
 id_factura int identity,
 fecha datetime,
 id_forma_pago int,
 id_cliente int,
 constraint pk_fac primary key(id_factura),
 constraint fk_for_fac foreign key(id_forma_pago) references formas_pago(id_forma_pago),
 constraint fk_cl_fac foreign key(id_cliente) references clientes(id_cliente)
)

create table detalles_facturas(
 id_detalle_factura int identity,
 id_planta int,
 cantidad int,
 id_factura int,
 constraint pk_det primary key(id_detalle_factura),
 constraint fk_pla_det foreign key(id_planta) references plantas(id_planta),
 constraint fk_fac_det foreign key(id_factura) references facturas(id_factura)
)

--ALTAS DE LOS REGISTROS

--CALLES
insert into calles values('Berlin'),
						 ('Bermejo'), 
						 ('Bermudas'),
						 ('Cayuqueo'),
						 ('Ceballos'),
						 ('Cechi'),
						 ('cedro'),
						 ('Ceibo'),
						 ('Fiambala'),
						 ('Figoli Adolfo')

--BARRIOS
insert into barrios values ('Centro'),
						   ('Alto Alberdi'),
						   ('Observatorio'),
						   ('Jardin'),
						   ('General Paz'),
						   ('Pueyrredon'),
						   ('Paruqe Horizone'),
						   ('San Martin'),
						   ('San Vicente'),
						   ('Junio')

--LOCALIDADES
insert into localidades values ('Cordoba'),
							   ('Carlos Paz'),
							   ('Adelia MARIA'),
							   ('Alta Gracia'),
							   ('Agua de Oro'),
							   ('Agua de Tala'),
							   ('Agua Pintada'),
							   ('Arias'),
							   ('Bajo Grande'),
							   ('Casa Vejas')

--PROVINCIAS
INSERT INTO PROVINCIAS VALUES('BUENOS AIRES'),
							 ('CATAMARCA'),
							 ('CHACO'),
							 ('CHUBUT'),
							 ('CORDOBA'),
							 ('CORRIENTES'), 
							 ('ENTRE RIOS'), 
							 ('FORMOSA'),
							 ('JUJUY'),
							 ('LA PAMPA'), 
							 ('LA RIOJA'),
							 ('MENDOZA'),
							 ('MISIONES'), 
							 ('NEUQUEN'), 
							 ('RIO NEGRO'), 
							 ('SALTA'), 
							 ('SAN JUAN'), 
							 ('SAN LUIS'), 
							 ('SANTA CRUZ'), 
							 ('SANTA FE'), 
							 ('SANTIAGO DEL ESTERO'), 
							 ('TIERRA DEL FUEGO'), 
							 ('TUCUMAN') 

--CONDICIONES_IVA
INSERT INTO CONDICIONES_IVA VALUES('RESPONSABLE INSCRIPTO'), 
								  ('RESPONSABLE NO INSCRIPTO'), 
								  ('MONOTRIBUTISTA'), 
								  ('CONSUMIDOR FINAL'), 
								  ('EXCENTO') 

--FORMAS_PAGO
INSERT INTO FORMAS_PAGO VALUES('EFECTIVO'), 
				              ('CON CHEQUE'), 
				              ('TARJETA CREDITO'), 
				              ('TARJETA DEBITO'), 
				              ('CUENTA CORRIENTE')
							  
--TIPOS_PLANTAS
INSERT INTO TIPOS_PLANTAS VALUES('COMUNES'), 
                                ('ESPECIALES'), 
                                ('EXOTICAS'), 
                                ('ARBUSTOS'), 
                                ('FLORES'), 
                                ('ARBOLES') 


--PLANTAS
INSERT INTO PLANTAS VALUES ('TULIPAN', 3,$ 53.60,45), 
                           ('PINO', 6,$ 99.00,5), 
                           ('ROSA CHINA', 5,$ 84.00,30), 
                           ('MARGARITA', 5,$ 31.20,150), 
                           ('CLAVEL', 5,$ 22.00,120), 
                           ('ROSA', 5,$ 84.50,25), 
                           ('PALMERA', 3,$ 100.60,10), 
                           ('PENSAMIENTO', 5,$ 18.80,60), 
                           ('CLAVELINA', 1,$ 15.50,54), 
                           ('ALEGR?A', 1,$ 26.75,21), 
                           ('SIEMPREVERDE', 6,$ 56.75,21), 
                           ('JACARAND?', 6,$ 76.75,21),
                           ('ESPINILLO', 6,$ 107.75,21),
                           ('SAUSE', 6,$ 106.00,21), 
                           ('LAPACHO', 6,$ 98.00,21)  


--CLIENTES
INSERT INTO CLIENTES VALUES ('ALONSO','CLAUDIO',  10, 155, 4,1, 1,3514940502,1, 125412554, 'S',NULL),
                            ('ALVAREZ','MARCELO', 5, 12,  10,3, 1,354654258,2, 251255441, 'N','calvarez@yahoo.com.ar'),
                            ('ALVAREZ','CRISTINA',9, 126, 1,1, 1,3514632514,3, 258422554, 'N',NULL),
                            ('ALVAREZ','CLAUDIO', 1, 58, 5,3, 2,NULL,4, 254871120, 'N',NULL), 
                            ('CAMPOS','RAUL',     2, 45, 8,1, 2,3514587452,5, 254871128, 'S','cduran@gmail.com'), 
                            ('DURAN','CARLA',     3, 1125,6,1, 1,3514587458,1, 127637988, 'N',NULL), 
                            ('PEREZ','MARIA',     6, 879, 10,1, 9,351564377,4, 554676587, 'N',NULL), 
                            ('ZAMORA','CARLOS LUIS',3, 945,7,1, 7,3544412552,4, 900872123, 'S',NULL), 
                            ('PEREZ','ANA',       6, 180, 10,1, 4,NULL,4, 921134381, 'S','soyo95@hotmail.com'), 
                            ('PEREA','LUIS M.',  7, 983,  8,1, 3,NULL,1, 293435633, 'N',NULL)

--FACTURAS
insert into facturas values ('02/04/2008',1,3), 
						    ('12/05/2008',1,4), 
						    ('12/08/2008',1,7), 
						    ('11/09/2008',3,11), 
						    ('06/09/2008',1,6), 
						    ('12/10/2008',2,5), 
						    ('08/11/2008',1,12), 
						    ('01/01/2009',1,8), 
						    ('11/02/2009',4,9),
						    ('11/02/2009',4,10)

select * from detalles_facturas

--DETALLES_FACTURAS
insert into DETALLES_FACTURAS values (2,2,21),
									 (3,5,24),
									 (3,4,25),
									 (5,1,27), 
									 (7,1,28), 
									 (2,1,22), 
									 (4,3,23), 
									 (6,2,26), 
									 (8,6,29), 
									 (6,3,30)

----------------------------------------------------- CONSULTAS --------------------------------------------------------

-- Listar todas las plantas que esten a la venta cuyo precio oscile entre 10 y 50. Tambien se quieren listar los articulos que fueron comprados por los clientes cuyos nombres comiencen con la letra "M" o con la letra "P".

select
'Plantas a la venta' Tipo,
p.descripcion 'Planta'
from plantas p
where p.precio between 10 and 50
	UNION
select
'Plantas Vendidas',
p.descripcion
from detalles_facturas d
	 join plantas p on d.id_planta = p.id_planta
	 join facturas f on d.id_factura = f.id_factura
	 join clientes c on f.id_cliente = c.id_cliente
where c.nombre like '[M,P]%'

--Realice un listado de las plantas cuyo precio es inferior al promedio de precios de todos los articulos.

select
id_planta 'Codigo',
descripcion 'Planta',
precio 'Precio'
from
plantas
where
precio <(select avg(precio)	
         from plantas)

--Realizar un reporte de los clientes que vinieron mas de 2 veces el año pasado.
select
id_cliente 'Codigo Cliente',
nombre 'Nombre',
apellido 'Apellido'
from
clientes c
where
2 < any (select count(f.id_factura)
		 from facturas f
		 where year(f.fecha)=year(getdate())-1
		 and c.id_cliente = f.id_cliente
		 group by id_cliente)

--Listar la cantidad total vendida, el importe total vendido,la fecha de la primer venta, la ultima venta y el importe promedio total vendido por cliente,
--siempre que la fecha no oscile entre el 13/2/2007 y el 13/7/2010.

select
sum(de.cantidad) 'Cantidad total vendida',
sum(de.cantidad*p.precio) 'Importe Total',
avg(de.cantidad*p.precio) 'Importe Promedio',
cast(min(f.fecha)as date) 'Primer Venta',
cast(max(f.fecha)as date) 'Ultima Venta',
c.apellido + ' ' + c.nombre 'Cliente'
from detalles_facturas de 
	 join facturas f on de.id_factura = f.id_factura
	 join plantas p on p.id_planta = de.id_planta
	 join clientes c on c.id_cliente = f.id_cliente
where fecha not between 13/02/2007 and 13/07/2010
group by c.apellido+' '+c.nombre

--Emitir un listado de las plantas que no fueron vendidos este año. En ese listado incluir solamente aquelos cuyo precio uniatrio de la planta oscile entre 20 y 25