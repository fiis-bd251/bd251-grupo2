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

DROP TABLE IF EXISTS Compras CASCADE;
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

-- ENUMs
DO $$ BEGIN
    DROP TYPE IF EXISTS estado_vehiculo_enum;
END $$;
CREATE TYPE estado_vehiculo_enum AS ENUM ('A', 'I');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_cobertura_enum;
END $$;
CREATE TYPE tipo_cobertura_enum AS ENUM ('R', 'I', 'N');

DO $$ BEGIN
    DROP TYPE IF EXISTS tipo_servicio_enum;
END $$;
CREATE TYPE tipo_servicio_enum AS ENUM ('P', 'T');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_traslado_enum;
END $$;
CREATE TYPE motivo_traslado_enum AS ENUM ('V', 'D');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_entrega_enum;
END $$;
CREATE TYPE estado_entrega_enum AS ENUM ('P', 'C', 'R');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_orden_carga_enum;
END $$;
CREATE TYPE estado_orden_carga_enum AS ENUM ('SP', 'PL', 'TR', 'IN', 'FN');

DO $$ BEGIN
    DROP TYPE IF EXISTS motivo_despacho_enum;
END $$;
CREATE TYPE motivo_despacho_enum AS ENUM ('E', 'R');

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
CREATE TYPE tipo_insumo_enum AS ENUM ('Materia Prima','Aditivos','Material Empaque');

DO $$ BEGIN
    DROP TYPE IF EXISTS estado_laboral_enum;
END $$;
CREATE TYPE estado_laboral_enum AS ENUM ('Activo', 'Retirado');



CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    codigo CHAR(5) UNIQUE NOT NULL,
    estado_laboral estado_laboral_enum NOT NULL
);

CREATE TABLE Compras (
   id_compra SERIAL PRIMARY KEY
);

CREATE TABLE Productos (
   id_producto SERIAL PRIMARY KEY
);

CREATE TABLE PedidosCliente (
    ID_PEDIDO_CLIENTE SERIAL PRIMARY KEY
);

CREATE TABLE LotesProducto (
    ID_LOTE_PRODUCTO SERIAL PRIMARY KEY
);

CREATE TABLE OrdenesProduccion (
   id_orden_produccion SERIAL PRIMARY KEY
);


--Tablas de AAlmacen de Insu,os 
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
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);


CREATE TABLE LotesInsumo (
    id_lote_insumo SERIAL PRIMARY KEY,
    codigo_lote VARCHAR(50) unique NOT null,
    cantidad_recibida INT NOT null,
    cantidad_disponible INT NOT null,
    Fecha_vencimiento DATE NOT null,
    id_insumo INT not NULL,
    id_recepcion INT not NULL,
    id_ubicacion INT not NULL,
    FOREIGN KEY (id_insumo) REFERENCES Insumos(id_insumo),
    FOREIGN KEY (id_recepcion) references Recepciones(id_recepcion),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion)
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

CREATE TABLE SolicitudesAbastecimiento (
    id_solicitud_abastecimiento SERIAL PRIMARY KEY,
    codigo_solicitud_abastecimiento VARCHAR(50) unique NOT null,
    Fecha_solicitud_abastecimiento timestamp not null,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
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

CREATE TABLE PedidosDespacho (
    ID_PROG_DESP INT NOT NULL,
    ID_PEDIDO_CLIENTE INT NOT NULL,
    MOTIVO_DESPACHO motivo_despacho_enum NOT NULL,

    PRIMARY KEY (ID_PROG_DESP, ID_PEDIDO_CLIENTE),

    FOREIGN KEY (ID_PROG_DESP) REFERENCES ProgramacionesDespacho(ID_PROG_DESP),
    FOREIGN KEY (ID_PEDIDO_CLIENTE) REFERENCES PedidosCliente(ID_PEDIDO_CLIENTE)
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
