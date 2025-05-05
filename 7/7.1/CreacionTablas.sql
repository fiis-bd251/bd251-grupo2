
-- DROPs
DROP TABLE IF EXISTS Personas CASCADE;
DROP TABLE IF EXISTS TelefonosPersona CASCADE;
DROP TABLE IF EXISTS CorreosPersona CASCADE;
DROP TABLE IF EXISTS Ubigeos CASCADE;
DROP TABLE IF EXISTS Empresas CASCADE;
DROP TABLE IF EXISTS TelefonosEmpresa CASCADE;
DROP TABLE IF EXISTS TiposUnidad CASCADE;
DROP TABLE IF EXISTS Vehiculos CASCADE;
DROP TABLE IF EXISTS EmpresasTransporte CASCADE;
DROP TABLE IF EXISTS Transportistas CASCADE;
DROP TABLE IF EXISTS GuiasRemision CASCADE;
DROP TABLE IF EXISTS ProgramacionesDespacho CASCADE;
DROP TABLE IF EXISTS RegistrosEntrega CASCADE;
DROP TABLE IF EXISTS OrdenesCarga CASCADE;
DROP TABLE IF EXISTS PedidosDespacho CASCADE;
DROP TABLE IF EXISTS TiposIncidencia CASCADE;
DROP TABLE IF EXISTS DetallesEntrega CASCADE;

DROP TABLE IF EXISTS Empleados CASCADE;
DROP TABLE IF EXISTS PedidosCliente CASCADE;
DROP TABLE IF EXISTS LotesProducto CASCADE;

DROP TABLE IF EXISTS Productos CASCADE;
DROP TABLE IF EXISTS OrdenesProduccion CASCADE;
DROP TABLE IF EXISTS Insumos CASCADE;

DROP TABLE IF EXISTS Formulaciones CASCADE;
DROP TABLE IF EXISTS DetallesFormulacion CASCADE;
DROP TABLE IF EXISTS Ubicaciones CASCADE;
DROP TABLE IF EXISTS Recepciones CASCADE;
DROP TABLE IF EXISTS LotesInsumo CASCADE;

DROP TABLE IF EXISTS Abastecimientos CASCADE;
DROP TABLE IF EXISTS InventariosAbastecimiento CASCADE;
DROP TABLE IF EXISTS DetallesSolicitud CASCADE;
DROP TABLE IF EXISTS SolicitudesAbastecimiento CASCADE;

DROP TABLE IF EXISTS SolicitudesProduccion CASCADE;
DROP TABLE IF EXISTS OrdenesMantenimiento CASCADE;
DROP TABLE IF EXISTS SolicitudesMantenimiento CASCADE;
DROP TABLE IF EXISTS EjemplaresMaquina CASCADE;
DROP TABLE IF EXISTS TiposMaquina CASCADE;

DROP TABLE IF EXISTS Envasados CASCADE;
DROP TABLE IF EXISTS Secados CASCADE;
DROP TABLE IF EXISTS Moldeados CASCADE;
DROP TABLE IF EXISTS TiposBoquilla CASCADE;
DROP TABLE IF EXISTS Mezclados CASCADE;
DROP TABLE IF EXISTS ProcesosRecurrente CASCADE;
DROP TABLE IF EXISTS DosificadosXLotesinsumo CASCADE;
DROP TABLE IF EXISTS Dosificados CASCADE;

DROP TABLE IF exists Proveedores CASCADE;
DROP TABLE IF exists PropuestasCompra CASCADE;
DROP TABLE IF exists SeguimientosCompra CASCADE;
DROP TABLE IF exists OrdenesCompra CASCADE;
DROP TABLE IF exists Compras CASCADE;
DROP TABLE IF exists NotificacionesReclamo CASCADE;
DROP TABLE IF exists Reclamos CASCADE;
DROP TABLE IF exists InsumosxProveedores CASCADE;

DROP TABLE IF EXISTS InspeccionesLoteInsumo CASCADE;
DROP TABLE IF EXISTS InspeccionesProceso CASCADE;
DROP TABLE IF EXISTS InspeccionesEnvasado CASCADE;
DROP TABLE IF EXISTS InspeccionesPicking CASCADE;
DROP TABLE IF EXISTS InspeccionesGenerales CASCADE;
DROP TABLE IF EXISTS Pickings CASCADE;
DROP TABLE IF EXISTS PedidosCliente CASCADE;

DROP TABLE IF EXISTS Recepciones CASCADE;
DROP TABLE IF EXISTS StockS CASCADE;
DROP TABLE IF EXISTS DetallesPedido CASCADE;
DROP TABLE IF EXISTS PedidosCliente CASCADE;
DROP TABLE IF EXISTS DetallesMovimiento CASCADE;
DROP TABLE IF EXISTS Movimientos CASCADE;
DROP TABLE IF EXISTS Productos CASCADE;

-- ENUMs
DO $$ BEGIN
    DROP TYPE IF EXISTS estado_vehiculo_enum;
END $$;
CREATE TYPE estado_vehiculo_enum AS ENUM ('Activo', 'Inactivo');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_cobertura_enum;
END $$;
CREATE TYPE tipo_cobertura_enum AS ENUM ('Regional', 'Interprovincial', 'Nacional');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_servicio_enum;
END $$;
CREATE TYPE tipo_servicio_enum AS ENUM ('Propio', 'Tercerizado');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_traslado_enum;
END $$;
CREATE TYPE motivo_traslado_enum AS ENUM ('Venta', 'Devolucion');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_entrega_enum;
END $$;
CREATE TYPE estado_entrega_enum AS ENUM ('Pendiente', 'Conforme', 'Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_orden_carga_enum;
END $$;
CREATE TYPE estado_orden_carga_enum AS ENUM ('En espera', 'Picking listo', 'En transito', 'Incidencia', 'Finalizado');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_despacho_enum;
END $$;
CREATE TYPE motivo_despacho_enum AS ENUM ('Entrega', 'Reposicion');

DO $$ BEGIN
    DROP TYPE IF EXISTS unidad_medida_enum ;
END $$;
CREATE TYPE unidad_medida_enum AS ENUM ('Kg','Ton', 'Cajas', 'Unidad');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_recepcion_enum;
END $$;
CREATE TYPE estado_recepcion_enum AS ENUM ('En entrega','Proceso de Calidad', 'A recepcionar');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_abastecimiento_enum;
END $$;
CREATE TYPE estado_abastecimiento_enum AS ENUM ('atender','Atendido');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_insumo_enum;
END $$;
CREATE TYPE tipo_insumo_enum AS ENUM ('Materia Prima','Aditivo','Material Empaque');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_laboral_enum;
END $$;
CREATE TYPE estado_laboral_enum AS ENUM ('Activo', 'Retirado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_ejemplar_enum CASCADE;
END $$;
CREATE TYPE estado_ejemplar_enum AS ENUM ('Operativo', 'En mantenimiento', 'Fuera de servicio');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_mantenimiento_enum CASCADE;
END $$;
CREATE TYPE tipo_mantenimiento_enum AS ENUM ('Preventivo', 'Correctivo');

DO $$ BEGIN
    DROP TYPE IF EXISTS etapa_enum CASCADE;
END $$;
CREATE TYPE etapa_enum AS ENUM ('Dosificado', 'Mezclado', 'Moldeado', 'Secado', 'Envasado','Almacen');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_orden_enum CASCADE;
END $$;
CREATE TYPE estado_orden_enum AS ENUM ('En proceso', 'Completado', 'Con retraso');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_lote_producto_enum CASCADE;
END $$;
CREATE TYPE estado_lote_producto_enum AS ENUM ('En proceso', 'Completado', 'En inspeccion', 'Retirado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_calidad_lote_producto_enum;
END $$;
CREATE TYPE estado_calidad_lote_producto_enum AS ENUM ('Pendiente', 'Aprobado', 'Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_solicitud_enum CASCADE;
END $$;CREATE TYPE estado_solicitud_enum AS ENUM ('Atendida', 'Con retraso', 'Pendiente');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_envase_enum CASCADE;
END $$;
CREATE TYPE tipo_envase_enum AS ENUM ('Bolsa de plastico', 'Caja de carton');



DO $$ BEGIN
    DROP TYPE IF EXISTS estado_propuesta_compra_enum;
END $$;
CREATE TYPE estado_propuesta_compra_enum AS ENUM ('Pendiente', 'Aprobado', 'Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_orden_compra_enum;
END $$;
CREATE TYPE estado_orden_compra_enum AS ENUM ('Sin Enviar', 'Pendiente', 'Pagado', 'Cancelado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_compra_enum;
END $$;
CREATE TYPE estado_compra_enum AS ENUM ('Sin Revision', 'En Proceso', 'Aceptado', 'Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_seguimiento_compra_enum;
END $$;
CREATE TYPE estado_seguimiento_compra_enum AS ENUM ('Pendiente', 'A Tiempo', 'Con Retraso', 'Cancelado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_notificacion_reclamo_enum;
END $$;
CREATE TYPE estado_notificacion_reclamo_enum AS ENUM ('Pendiente', 'Atendido');

DO $$ BEGIN
    DROP TYPE IF EXISTS objetivo_reclamo_enum;
END $$;
CREATE TYPE objetivo_reclamo_enum AS ENUM ('Reposicion', 'Devolucion');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_lote_insumo_enum;
END $$;
CREATE TYPE estado_lote_insumo_enum AS ENUM ('Pendiente','Aprobado', 'Rechazado');


DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_inspeccion_enum;
END $$;
CREATE TYPE tipo_inspeccion_enum AS ENUM ('Lote de Insumo', 'Proceso', 'Envasado', 'Picking');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_revision_enum;
END $$;
CREATE TYPE estado_revision_enum AS ENUM ('Pendiente', 'Revisado');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_fallo_enum;
END $$;
CREATE TYPE tipo_fallo_enum AS ENUM ('Humano', 'Maquina');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_defecto_empaque_enum;
END $$;
CREATE TYPE tipo_defecto_empaque_enum AS ENUM ('Etiqueta mal colocada', 'Empaque abierto', 'Empaque manchado', 'Rotura del empaque');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_defecto_picking_enum;
END $$;
CREATE TYPE motivo_defecto_picking_enum AS ENUM ('Caja rota', 'Sellado deficiente', 'Codigo ilegible', 'Exceso de humedad', 'Golpe visible');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_rechazo_insumo_enum;
END $$;
CREATE TYPE motivo_rechazo_insumo_enum AS ENUM ('Saco roto', 'Humedad visible', 'Fecha vencida', 'Color o textura anormal', 'Contaminacion');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_picking_enum;
END $$;
CREATE TYPE estado_picking_enum AS ENUM ('Aprobado', 'Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_pedido_cliente_enum;
END $$;
CREATE TYPE estado_pedido_cliente_enum AS ENUM ('Completado','En proceso','Rechazado');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_proceso_enum;
END $$;
CREATE TYPE tipo_proceso_enum AS ENUM ('Mezclado', 'Moldeado', 'Secado');

CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    peso_producto DECIMAL(10,2),
    unidadMedida VARCHAR(20),
    fechaVencimiento DATE,
    presentacion VARCHAR(50),
    precio_unitario DECIMAL(10,2),
    descripcion TEXT
);

CREATE TABLE Personas (
    ID_PERSONA SERIAL PRIMARY KEY,
    DNI CHAR(8) NOT NULL UNIQUE,
    NOMBRE VARCHAR(50) NOT NULL,
    AP_PATERNO VARCHAR(50) NOT NULL,
    AP_MATERNO VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(100),
    FECHA_NAC DATE
);

CREATE TABLE TelefonosPersona (
    ID_PERSONA INT NOT NULL,
    TELEFONO VARCHAR(9) NOT NULL,
    PRIMARY KEY (ID_PERSONA, TELEFONO),
    FOREIGN KEY (ID_PERSONA) REFERENCES Personas(ID_PERSONA)
);

CREATE TABLE CorreosPersona (
    ID_PERSONA INT NOT NULL,
    CORREO VARCHAR(60) NOT NULL,
    PRIMARY KEY (ID_PERSONA, CORREO),
    FOREIGN KEY (ID_PERSONA) REFERENCES Personas(ID_PERSONA)
);

CREATE TABLE Ubigeos (
    ID_UBIGEO CHAR(6) PRIMARY KEY,
    DEPARTAMENTO VARCHAR(50) NOT NULL,
    PROVINCIA VARCHAR(50) NOT NULL,
    DISTRITO VARCHAR(50) NOT NULL
);

CREATE TABLE Empresas (
    ID_EMPRESA SERIAL PRIMARY KEY,
    CODIGO_RUC VARCHAR(11) NOT NULL UNIQUE,
    RAZON_SOCIAL VARCHAR(80) NOT NULL,
    NOMBRE_COMERCIAL VARCHAR(80),
    DIRECCION VARCHAR(150),
    UBIGEO_DIRECCION CHAR(6),
    FOREIGN KEY (UBIGEO_DIRECCION) REFERENCES Ubigeos(ID_UBIGEO)
);

CREATE TABLE TelefonosEmpresa (
    ID_EMPRESA INT NOT NULL,
    TELEFONO VARCHAR(9) NOT NULL,
    PRIMARY KEY (ID_EMPRESA, TELEFONO),
    FOREIGN KEY (ID_EMPRESA) REFERENCES Empresas(ID_EMPRESA)
);

CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    codigo CHAR(5) UNIQUE NOT NULL,
    estado_laboral estado_laboral_enum NOT NULL
);

CREATE TABLE Productos (
   id_producto SERIAL PRIMARY KEY
);

--Tablas de Almacen de Insumos 
CREATE TABLE Insumos (
    id_insumo SERIAL PRIMARY KEY,
    codigo_insumo VARCHAR(20) unique not NULL, 
    nombre_insumo VARCHAR(30)  not NULL,
    unidad_medida unidad_medida_enum not NULL,
    tipo_insumo tipo_insumo_enum not null
);

CREATE TABLE Formulaciones (
    id_formulacion SERIAL PRIMARY key,
    id_producto INT not NULL,
    Codigo_formulacion VARCHAR(29) UNIQUE not NULL, 
    Nombre_formulacion VARCHAR(100) not null,
    fecha_creacion DATE not null,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE DetallesFormulacion (
    id_formulacion INT NOT NULL,
    id_insumo INT NOT NULL,
    cantidad_asignada INT NOT NULL,
    PRIMARY KEY (id_formulacion, id_insumo),
    FOREIGN KEY (id_formulacion) REFERENCES Formulaciones(id_formulacion),
    FOREIGN KEY (id_insumo) REFERENCES Insumos(id_insumo)
);

create table Proveedores (
	id_proveedor SERIAL primary key,
	cod_proveedor VARCHAR(5) unique not null,
	tipo_insumo tipo_insumo_enum not null
);

CREATE TABLE SolicitudesAbastecimiento (
    id_solicitud_abastecimiento SERIAL PRIMARY KEY,
    codigo_solicitud_abastecimiento VARCHAR(50) unique NOT null,
    Fecha_solicitud_abastecimiento timestamp not null,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

create table PropuestasCompra (
	id_propuesta_compra SERIAL primary key,
	cod_propuesta_compra VARCHAR(8) unique not null,
	id_empleado INT not null,
	id_proveedor INT not null,
	id_solicitud_abastecimiento INT not null,
	fecha_acuerdo_entrega TIMESTAMP not null,
	fecha_propuesta_compra TIMESTAMP not null,
	estado estado_propuesta_compra_enum not null,
	descuento_compra NUMERIC(4,2) CHECK (descuento_compra >= 0),
	monto_total_compra NUMERIC(7,2) NOT NULL CHECK (monto_total_compra >= 0),
	
	foreign key (id_empleado) references Empleados(id_empleado),
	foreign key (id_proveedor) references Proveedores(id_proveedor),
	foreign key (id_solicitud_abastecimiento) references SolicitudesAbastecimiento(id_solicitud_abastecimiento)
);

create table OrdenesCompra (
	id_orden_compra SERIAL primary key,
	cod_orden_compra VARCHAR(8) unique not null,
	id_propuesta_compra INT not null,
	id_empleado INT not null,
	estado estado_orden_compra_enum not null,
	
	foreign key (id_empleado) references Empleados(id_empleado),
	foreign key (id_propuesta_compra) references PropuestasCompra(id_propuesta_compra)
);

create table Compras (
	id_compra SERIAL primary key,
	cod_compra VARCHAR(8) unique not null,
	id_orden_compra INT not null,
	estado estado_compra_enum null,
	
	foreign key (id_orden_compra) references OrdenesCompra(id_orden_compra)
);

create table SeguimientosCompra (
	id_seguimiento_compra SERIAL primary key,
	cod_seguimiento_compra VARCHAR(8) unique not null,
	id_compra INT not null,
	fecha_ingreso_compra TIMESTAMP null,
	estado estado_seguimiento_compra_enum not null,
	
	foreign key (id_compra) references Compras(id_compra)
);

CREATE TABLE Ubicaciones (
    id_ubicacion SERIAL PRIMARY KEY,
    zoma VARCHAR(50) NOT NULL ,
    Estanteria VARCHAR(50) NOT NULL,
    Nivel VARCHAR(50) NOT NULL
);

CREATE TABLE Recepciones (
    id_recepcion SERIAL PRIMARY KEY,
    codigo_recepcion VARCHAR(20) unique not NULL, 
    fecha_llegada TIMESTAMP not NULL,
    estado estado_recepcion_enum NOT null,
    id_compra INT NOT NULL,
    id_empleado INT NOT NULL,
    foreign key (id_compra) references Compras(id_compra),
    foreign key (id_empleado) references Empleados(id_empleado)
);

CREATE TABLE LotesInsumo (
    id_lote_insumo SERIAL PRIMARY KEY,
    codigo_lote VARCHAR(50) UNIQUE NOT NULL,
    cantidad_recibida INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado_lote_insumo estado_lote_insumo_enum NOT NULL,
    id_insumo INT NOT NULL,
    id_compra INT NOT NULL,
    id_recepcion INT NOT NULL,
    id_ubicacion INT NOT NULL,
    foreign key (id_insumo) references Insumos(id_insumo),
    foreign key (id_recepcion) references Recepciones(id_recepcion),
    foreign key (id_ubicacion) references Ubicaciones(id_ubicacion),
    foreign key (id_compra) references Compras(id_compra)
);

CREATE TABLE InspeccionesGenerales (
    id_inspeccion SERIAL PRIMARY KEY,
    cod_inspeccion CHAR(8) UNIQUE NOT NULL,
    tipo_inspeccion tipo_inspeccion_enum NOT NULL,
    fecha_hora_inspeccion TIMESTAMP,
    estado_revision estado_revision_enum NOT NULL,
    comentario VARCHAR(300),
    evidencia VARCHAR(250),
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE InspeccionesLoteInsumo (
    id_inspeccion INT PRIMARY KEY,
    id_lote_insumo INT NOT NULL,
    motivo_rechazo motivo_rechazo_insumo_enum,
    foreign key (id_inspeccion) references InspeccionesGenerales(id_inspeccion),
    foreign key (id_lote_insumo) references LotesInsumo(id_lote_insumo)
);

create table NotificacionesReclamo (
	id_notificacion_reclamo SERIAL primary key,
	cod_notificacion_reclamo VARCHAR(8) unique not null,
	id_inspeccion_lote_insumo INT not null,
	id_lote_insumo INT not null,
	id_empleado INT not null,
	estado estado_notificacion_reclamo_enum not null,
	
	foreign key (id_empleado) references Empleados(id_empleado),
	foreign key (id_inspeccion_lote_insumo) references InspeccionesLoteInsumo(id_inspeccion),
	foreign key (id_lote_insumo) references LotesInsumo(id_lote_insumo)
);

create table Reclamos (
	id_reclamo SERIAL primary key,
	cod_reclamo VARCHAR(8) unique not null,
	objetivo objetivo_reclamo_enum not null,
	id_lote_insumo INT null,
	monto_devuelto numeric(6,2) null CHECK (monto_devuelto >= 0),
	fecha_atencion_reclamo TIMESTAMP not null,
	
	foreign key (id_lote_insumo) references LotesInsumo(id_lote_insumo)
);

create table InsumosXProveedores (
	precio_referencial NUMERIC(4,2) not null CHECK (precio_referencial >= 0),
	id_proveedor INT not null,
	id_insumo INT not null,
	
	primary key (id_proveedor, id_insumo),
	foreign key (id_proveedor) references Proveedores(id_proveedor),
	foreign key (id_insumo) references Insumos(id_insumo)
);

CREATE TABLE SolicitudesProduccion (
    id_solicitud_produccion SERIAL PRIMARY KEY,
    cod_solicitud_produccion VARCHAR(10) UNIQUE NOT NULL,
    cantidad_requerida INT NOT NULL,
    fecha_requerida DATE NOT NULL,
    fecha_solicitud DATE NOT NULL,
    hora_solicitud TIME NOT NULL,
    estado estado_solicitud_enum NOT NULL,
    id_producto INT ,
    foreign key (id_producto) references Productos(id_producto)
);


CREATE TABLE OrdenesProduccion (
    id_orden_produccion SERIAL PRIMARY KEY,
    cod_orden_produccion VARCHAR(10) UNIQUE NOT NULL,
    fecha_emision DATE NOT NULL,
    hora_emision TIME NOT NULL,
    fecha_fin_estimada DATE NOT NULL,
    fecha_finalizacion DATE,
    estado estado_orden_enum NOT NULL,
    id_solicitud_produccion INT ,
    id_empleado INT NOT NULL,
    foreign key (id_solicitud_produccion) references SolicitudesProduccion(id_solicitud_produccion),
    foreign key (id_empleado) references Empleados(id_empleado)
);

CREATE TABLE Abastecimientos (
    id_abastecimiento SERIAL PRIMARY key,
    codigo_abastecimiento VARCHAR(50) unique NOT null,
    fecha_abastecimiento TIMESTAMP not null,
    estado estado_abastecimiento_enum  NOT null,
    id_empleado INT NOT NULL,
    id_orden_produccion INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_orden_produccion) REFERENCES OrdenesProduccion(id_orden_produccion)
);


CREATE TABLE InventariosAbastecimiento (
    id_abastecimiento INT not null,
    id_lote_insumo INT not null,
    cantidad_asignada INT not null,
    PRIMARY KEY (id_abastecimiento, id_lote_insumo),
    FOREIGN KEY (id_abastecimiento) REFERENCES Abastecimientos(id_abastecimiento),
    FOREIGN KEY (id_lote_insumo) REFERENCES LotesInsumo(id_lote_insumo)    
);

CREATE TABLE DetallesSolicitud (
    id_solicitud_abastecimiento INT not NULL,
    id_insumo INT not NULL,
    cantidad_requeridos INT not null,
    PRIMARY KEY (id_solicitud_abastecimiento, id_insumo),
    FOREIGN KEY (id_insumo) REFERENCES Insumos(id_insumo),
    FOREIGN KEY (id_solicitud_abastecimiento) REFERENCES SolicitudesAbastecimiento(id_solicitud_abastecimiento)
);

-- Tablas generales

CREATE TABLE TiposUnidad (
    CODIGO CHAR(4) PRIMARY KEY,
    DESCRIPCION VARCHAR(20) NOT NULL
);

CREATE TABLE TiposIncidencia (
    CODIGO CHAR(2) PRIMARY KEY,
    DESCRIPCION VARCHAR(50) NOT NULL
);

CREATE TABLE Vehiculos (
    ID_VEHICULO SERIAL PRIMARY KEY,
    NUM_PLACA CHAR(10) NOT NULL UNIQUE,
    TIPO_UNIDAD CHAR(4) NOT NULL,
    ESTADO estado_vehiculo_enum NOT NULL,
    CAPAC_PESO NUMERIC(3) CHECK (CAPAC_PESO > 0),
    CAPAC_EMP NUMERIC(3) CHECK (CAPAC_EMP > 0),
    FOREIGN KEY (TIPO_UNIDAD) REFERENCES TiposUnidad(CODIGO)
);


CREATE TABLE EmpresasTransporte (
    ID_EMPRESA INT PRIMARY KEY,
    TIPO_COBERTURA tipo_cobertura_enum NOT NULL,
    DESCRIPCION VARCHAR(50),
    FOREIGN KEY (ID_EMPRESA) REFERENCES Empresas(ID_EMPRESA)
);


CREATE TABLE Transportistas (
    ID_TRANSPORTISTA SERIAL PRIMARY KEY,
    ID_EMPRESA INT NOT NULL,
    NUM_LICENCIA CHAR(9) NOT NULL UNIQUE,
    TIPO_SERVICIO tipo_servicio_enum NOT NULL,
    FOREIGN KEY (ID_EMPRESA) REFERENCES Empresas(ID_EMPRESA),
    FOREIGN KEY (ID_TRANSPORTISTA) REFERENCES Personas(ID_PERSONA)
);

CREATE TABLE ProgramacionesDespacho (
    ID_PROG_DESP SERIAL PRIMARY KEY,
    ID_TRANSPORTISTA INT NOT NULL,
    ID_VEHICULO INT NOT NULL,
    ID_EMPLEADO INT NOT NULL,
    CODIGO CHAR(10) NOT NULL UNIQUE,
    FECHA_PROG_SALIDA DATE NOT NULL,
    HORA_PROG_SALIDA TIME NOT NULL,
    FECHA_PROGRAMACION DATE NOT NULL,
    FOREIGN KEY (ID_TRANSPORTISTA) REFERENCES Transportistas(ID_TRANSPORTISTA),
    FOREIGN KEY (ID_VEHICULO) REFERENCES Vehiculos(ID_VEHICULO),
    FOREIGN KEY (ID_EMPLEADO) REFERENCES Empleados(ID_EMPLEADO)
);


CREATE TABLE OrdenesCarga (
    ID_ORDEN_CARGA SERIAL PRIMARY KEY,
    ID_PROG_DESP INT NOT NULL,
    CODIGO VARCHAR(10) NOT NULL UNIQUE,
    FECHA_SALIDA DATE NOT NULL,
    HORA_SALIDA TIME NOT NULL,
    ESTADO estado_orden_carga_enum NOT NULL,

    FOREIGN KEY (ID_PROG_DESP) REFERENCES ProgramacionesDespacho(ID_PROG_DESP)
);


CREATE TABLE PedidosCliente (
    id_pedido_cliente SERIAL PRIMARY KEY,
    estado_pedido_cliente estado_pedido_cliente_enum
);

CREATE TABLE PedidosDespacho (
    ID_PROG_DESP INT NOT NULL,
    ID_PEDIDO_CLIENTE INT NOT NULL,
    MOTIVO_DESPACHO motivo_despacho_enum NOT NULL,

    PRIMARY KEY (ID_PROG_DESP, ID_PEDIDO_CLIENTE),

    FOREIGN KEY (ID_PROG_DESP) REFERENCES ProgramacionesDespacho(ID_PROG_DESP),
    FOREIGN KEY (ID_PEDIDO_CLIENTE) REFERENCES PedidosCliente(id_pedido_cliente)
);

CREATE TABLE RegistrosEntrega (
    ID_REG_ENT SERIAL PRIMARY KEY,
    ID_ORDEN_CARGA INT NOT NULL,
    ID_PEDIDO_CLIENTE INT NOT NULL,
    ESTADO_ENTREGA estado_entrega_enum NOT NULL,
    FECHA_ENTREGA DATE,
    HORA_ENTREGA TIME,

    FOREIGN KEY (ID_ORDEN_CARGA) REFERENCES OrdenesCarga(ID_ORDEN_CARGA),
    FOREIGN KEY (ID_PEDIDO_CLIENTE) REFERENCES PedidosCliente(ID_PEDIDO_CLIENTE)
);

CREATE TABLE GuiasRemision (
    ID_GUIA_REM SERIAL PRIMARY KEY,
    ID_REG_ENT INT NOT NULL,
    NUM_GUIA CHAR(13) NOT NULL UNIQUE,
    MOTIVO_TRASLADO motivo_traslado_enum NOT NULL,
    FECHA_EMISION DATE NOT NULL,
    ORIGEN_DIRECCION VARCHAR(150) NOT NULL,
    UBIGEO_ORIGEN CHAR(6) NOT NULL,
    DESTINO_DIRECCION VARCHAR(150) NOT NULL,
    UBIGEO_DESTINO CHAR(6) NOT NULL,
    FOREIGN KEY (ID_REG_ENT) REFERENCES RegistrosEntrega(ID_REG_ENT),
    FOREIGN KEY (UBIGEO_ORIGEN) REFERENCES Ubigeos(ID_UBIGEO),
    FOREIGN KEY (UBIGEO_DESTINO) REFERENCES Ubigeos(ID_UBIGEO)
);

CREATE TABLE LotesProducto (
    id_lote_producto SERIAL PRIMARY KEY,
    cod_lote_producto VARCHAR(10) UNIQUE NOT NULL,
    cantidad_producida INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    hora_creacion TIME NOT NULL,
    estado_lote_producto estado_lote_producto_enum NOT NULL,
    estado_calidad estado_calidad_lote_producto_enum NOT NULL,
    fecha_vencimiento DATE,
    etapa_produccion etapa_enum NOT NULL,
    id_orden_produccion INT NOT NULL,
    FOREIGN KEY (id_orden_produccion) REFERENCES OrdenesProduccion(id_orden_produccion)
);

-- Tablas Modulo Proceso Produccion
CREATE TABLE Dosificados (
    id_dosificado SERIAL PRIMARY KEY,
    cod_dosificado VARCHAR(8) UNIQUE NOT NULL,
    numero_batch NUMERIC(2) CHECK (numero_batch > 0),
    fecha_proceso TIMESTAMP NOT NULL,
    tiempo_proceso NUMERIC(3) CHECK (tiempo_proceso > 0),
    estado estado_lote_producto_enum NOT NULL,
    id_lote_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto),
	FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE DosificadosXLotesInsumo (
    id_dosificado INT NOT NULL,
	id_lote_insumo INT NOT NULL,
    cantidad_dosificada NUMERIC(4,1) CHECK (cantidad_dosificada > 0),
    
    PRIMARY KEY (id_dosificado, id_lote_insumo),
    
    FOREIGN KEY (id_dosificado) REFERENCES Dosificados(id_dosificado),
    FOREIGN KEY (id_lote_insumo) REFERENCES LotesInsumo(id_lote_insumo)
);

CREATE TABLE ProcesosRecurrente (
    id_proceso_recurrente SERIAL PRIMARY KEY,
    numero_batch NUMERIC(2) CHECK (numero_batch > 0),
    fecha_proceso TIMESTAMP NOT NULL,
    tiempo_proceso NUMERIC(3) CHECK (tiempo_proceso > 0),
    peso_inicial NUMERIC(5,1) CHECK (peso_inicial > 0),
    merma NUMERIC(5,1) CHECK (merma >= 0),
    estado estado_lote_producto_enum NOT NULL,
    id_lote_producto INT NOT NULL,
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto)
);


CREATE TABLE TiposMaquina (
    id_tipo_maquina SERIAL PRIMARY KEY,
    cod_tipo_maquina VARCHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    etapa_produccion etapa_enum NOT NULL
);

CREATE TABLE EjemplaresMaquina (
    id_ejemplar_maquina SERIAL PRIMARY KEY,
    cod_ejemplar_maquina VARCHAR(10) UNIQUE NOT NULL,
    fecha_instalacion DATE,
    estado estado_ejemplar_enum NOT NULL,
    fecha_ultimo_mantenimiento DATE,
    plan_mantenimiento INT NOT NULL,
    id_tipo_maquina INT NOT NULL ,
 	FOREIGN KEY (id_tipo_maquina) REFERENCES TiposMaquina(id_tipo_maquina)
);

CREATE TABLE Mezclados (
    id_proceso_recurrente INT PRIMARY key, 
    cod_mezclado VARCHAR(8) UNIQUE NOT NULL,
    porcentaje_humedad NUMERIC(2,2) CHECK (porcentaje_humedad > 0),
    cantidad_agua NUMERIC(3) CHECK (cantidad_agua > 0),
    id_empleado INT NOT NULL,
    id_ejemplar_maquina INT NOT NULL,
    id_formulacion INT NOT NULL,
    FOREIGN KEY (id_proceso_recurrente) REFERENCES ProcesosRecurrente(id_proceso_recurrente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_ejemplar_maquina) REFERENCES EjemplaresMaquina(id_ejemplar_maquina),
    FOREIGN KEY (id_formulacion) references Formulaciones(id_formulacion)
);

CREATE TABLE TiposBoquilla (
	cod_tipo_boquilla VARCHAR(5) PRIMARY KEY,
	descripcion VARCHAR(15) NOT NULL
);

CREATE TABLE Moldeados (
    id_proceso_recurrente INT PRIMARY KEY, 
    cod_moldeado VARCHAR(8) UNIQUE NOT NULL,
    tipo_boquilla VARCHAR(5) NOT NULL,
    presion NUMERIC(6,2) CHECK (presion > 0),
    velocidad_corte NUMERIC(6,2) CHECK (velocidad_corte > 0),
    tamano_corte NUMERIC(6,2) CHECK (tamano_corte > 0),
    id_empleado INT NOT NULL,
    id_ejemplar_maquina INT NOT NULL,
    FOREIGN KEY (id_proceso_recurrente) REFERENCES ProcesosRecurrente(id_proceso_recurrente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_ejemplar_maquina) REFERENCES EjemplaresMaquina(id_ejemplar_maquina),
    FOREIGN KEY (tipo_boquilla) REFERENCES TiposBoquilla(cod_tipo_boquilla)
);

CREATE TABLE Secados (
   	id_proceso_recurrente INT PRIMARY KEY, 
    cod_secado VARCHAR(8) UNIQUE NOT NULL,
    numero_bandejas NUMERIC(2) CHECK (numero_bandejas > 0),
    temperatura_inicial NUMERIC(7,3) CHECK (temperatura_inicial > 0),
    temperatura_final NUMERIC(7,3) CHECK (temperatura_final > 0),
    porcentaje_humedad numeric(5,2) CHECK (porcentaje_humedad > 0),
    id_empleado INT NOT NULL,
    id_ejemplar_maquina INT NOT NULL,
    FOREIGN KEY (id_proceso_recurrente) REFERENCES ProcesosRecurrente(id_proceso_recurrente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_ejemplar_maquina) REFERENCES EjemplaresMaquina(id_ejemplar_maquina)
);

CREATE TABLE Envasados (
    id_envasado SERIAL PRIMARY KEY,
    cod_envasado VARCHAR(8) UNIQUE NOT NULL,
    fecha_proceso TIMESTAMP NOT NULL,
    numero_batch NUMERIC(2) CHECK (numero_batch > 0),
    tipo_envase tipo_envase_enum NOT NULL,
    tiempo_proceso NUMERIC(3) CHECK (tiempo_proceso > 0),
    peso NUMERIC(4) CHECK (peso > 0),
    estado estado_lote_producto_enum NOT NULL,
    id_lote_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto),
	FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE InspeccionesProceso (
    id_inspeccion INT PRIMARY KEY,
    id_proceso_recurrente INT NOT NULL,
    tipo_proceso tipo_proceso_enum NOT NULL, -- Mezclado, Moldeado o Secado
    tipo_fallo tipo_fallo_enum,             
    detalle_fallo_proceso VARCHAR(100),
    cantidad_perdida NUMERIC(6,2) DEFAULT 0.00,

    FOREIGN KEY (id_inspeccion) REFERENCES InspeccionesGenerales(id_inspeccion),
    FOREIGN KEY (id_proceso_recurrente) REFERENCES ProcesosRecurrente(id_proceso_recurrente)
);

CREATE TABLE InspeccionesEnvasado (
    id_inspeccion INT PRIMARY KEY,
    id_envasado INT NOT NULL,
    tipo_defecto_empaque tipo_defecto_empaque_enum,
    cantidad_envases_defectuosos NUMERIC(4,0) CHECK (cantidad_envases_defectuosos >= 0),
    FOREIGN KEY (id_inspeccion) REFERENCES InspeccionesGenerales(id_inspeccion),
    FOREIGN KEY (id_envasado) REFERENCES Envasados(id_envasado)
);

CREATE TABLE DetallesEntrega (
    ID_REG_ENT INT NOT NULL,
    ID_LOTE_PRODUCTO INT NOT NULL,
    CANT_ENTREGADA NUMERIC(3) CHECK (CANT_ENTREGADA >= 0),
    CANT_OBSERVADA NUMERIC(3) CHECK (CANT_OBSERVADA >= 0),
    TIPO_INCIDENCIA CHAR(2),

    PRIMARY KEY (ID_REG_ENT, ID_LOTE_PRODUCTO),

    FOREIGN KEY (ID_REG_ENT) REFERENCES RegistrosEntrega(ID_REG_ENT),
    FOREIGN KEY (ID_LOTE_PRODUCTO) REFERENCES LotesProducto(ID_LOTE_PRODUCTO),
    FOREIGN KEY (TIPO_INCIDENCIA) REFERENCES TiposIncidencia(CODIGO)
    
);

CREATE TABLE SolicitudesMantenimiento(
    id_solicitud_mantenimiento SERIAL PRIMARY KEY,
    cod_solicitud_mantenimiento VARCHAR(10) UNIQUE NOT NULL,
    fecha_solicitud DATE,
    hora_solicitud TIME,
    fecha_requerida DATE,
    tipo_mantenimiento tipo_mantenimiento_enum NOT NULL,
    estado estado_solicitud_enum NOT NULL,
    id_ejemplar_maquina INT NOT NULL ,
    id_inspeccion_proceso INT NOT NULL,
	FOREIGN KEY (id_ejemplar_maquina) REFERENCES EjemplaresMaquina(id_ejemplar_maquina),
	FOREIGN KEY (id_inspeccion_proceso) REFERENCES InspeccionesProceso(id_inspeccion)
);

CREATE TABLE OrdenesMantenimiento (
    id_orden_mantenimiento SERIAL PRIMARY KEY,
    cod_orden_mantenimiento VARCHAR(10) UNIQUE NOT NULL,
    fecha_emision DATE,
    hora_emision TIME,
    fecha_fin_estimada DATE,
    fecha_finalizacion DATE,
    estado estado_orden_enum NOT NULL,
    id_empleado INT NOT NULL,
    id_solicitud_mantenimiento INT,
    FOREIGN KEY (id_solicitud_mantenimiento) REFERENCES SolicitudesMantenimiento(id_solicitud_mantenimiento),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);


CREATE TABLE Pickings (
    id_picking SERIAL PRIMARY KEY,
    estado_picking estado_picking_enum,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE InspeccionesPicking (
    id_inspeccion INT PRIMARY KEY,
    id_picking INT NOT NULL,
    cantidad_defectuosa NUMERIC(5,0) CHECK (cantidad_defectuosa >= 0),
    motivo_defecto motivo_defecto_picking_enum,
    FOREIGN KEY (id_inspeccion) REFERENCES InspeccionesGenerales(id_inspeccion),
    FOREIGN KEY (id_picking) REFERENCES Pickings(id_picking)
);
-- Movimientos
CREATE TABLE Movimientos (
    id_movimiento SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- DetallesMovimiento
CREATE TABLE DetallesMovimiento (
    id_detalle_movimiento SERIAL PRIMARY KEY,
    cantidad_movida DECIMAL(10,2),
    ubicacion_inicial VARCHAR(100),
    ubicacion_final VARCHAR(100),
    nombre_producto VARCHAR(100),
    id_lote_producto INT NOT NULL,
    id_movimiento INT NOT NULL,
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto),
    FOREIGN KEY (id_movimiento) REFERENCES Movimientos(id_movimiento)
);

-- DetallesPedido
CREATE TABLE DetallesPedido (
    id_detalle_pedido SERIAL PRIMARY KEY,
    cantidad_solicitada DECIMAL(10,2) NOT NULL,
    nombre_producto VARCHAR(100),
    detalle_pedido TEXT,
    id_producto INT NOT NULL,
    id_pedido_cliente INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_pedido_cliente) REFERENCES PedidosCliente(id_pedido_cliente)
);

-- Stocks
CREATE TABLE Stocks (
    id_stock SERIAL PRIMARY KEY,
    stock_minimo DECIMAL(10,2),
    cantidad_disponible DECIMAL(10,2),
    id_producto INT NOT NULL,
    id_lote_producto INT NOT NULL,
    id_ubicacion INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion)
);

-- Recepciones
CREATE TABLE RecepcionesAlmacen (
    id_recepcion SERIAL PRIMARY KEY,
    fecha_recepcion DATE NOT NULL,
    hora_recepcion TIME,
    cantidad DECIMAL(10,2),
    id_lote_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_lote_producto) REFERENCES LotesProducto(id_lote_producto),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);
