-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2019-10-09 19:28:02 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012

USE OffTheLipDB
GO

CREATE TABLE cart (
    user_id       INTEGER NOT NULL,
    hardware_id   INTEGER NOT NULL,
    payment_id    INTEGER NOT NULL
)
go 

    

CREATE unique nonclustered index cart__idx ON cart ( payment_id ) 
go

CREATE TABLE competition (
    id            INTEGER IDENTITY(1,1) NOT NULL,
    name          VARCHAR(50),
    description   VARCHAR(100),
    location      VARCHAR(50)
)

go

ALTER TABLE Competition ADD constraint competición_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE documentary (
    id            INTEGER IDENTITY(1,1) NOT NULL,
    name          VARCHAR(50),
    description   VARCHAR(100),
    location      VARCHAR(50)
)

go

ALTER TABLE Documentary ADD constraint documentary_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE hardware (
    id            INTEGER IDENTITY(1,1) NOT NULL,
    name          VARCHAR(50),
    description   VARCHAR(100),
    releasedate   DATE,
    price         money
)

go

ALTER TABLE Hardware ADD constraint hardware_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE payment (
    id                 INTEGER IDENTITY(1,1) NOT NULL,
    amount             money,
    currency           VARCHAR(50),
    paymentmethod_id   INTEGER NOT NULL
)

go

ALTER TABLE Payment ADD constraint payment_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE paymentmethod (
    id     INTEGER IDENTITY(1,1) NOT NULL,
    type   VARCHAR(50)
)

go

ALTER TABLE PaymentMethod ADD constraint paymentmethod_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE relation_sc (
    competición_id   INTEGER NOT NULL,
    surfer_id        INTEGER NOT NULL
)

go

ALTER TABLE Relation_SC ADD constraint relation_sc_pk PRIMARY KEY CLUSTERED (Competición_ID, Surfer_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE relation_sd (
    documentary_id   INTEGER NOT NULL,
    surfer_id        INTEGER NOT NULL
)

go

ALTER TABLE Relation_SD ADD constraint relation_sd_pk PRIMARY KEY CLUSTERED (Documentary_ID, Surfer_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE relation_sh (
    surfer_id     INTEGER NOT NULL,
    hardware_id   INTEGER NOT NULL
)

go

ALTER TABLE Relation_SH ADD constraint relation_sh_pk PRIMARY KEY CLUSTERED (Surfer_ID, Hardware_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE surfer (
    id            INTEGER IDENTITY(1,1) NOT NULL,
    name          VARCHAR(50),
    nationality   VARCHAR(50),
    competitor    bit
)

go

ALTER TABLE Surfer ADD constraint surfer_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

CREATE TABLE "user" (
    id            INTEGER IDENTITY(1,1) NOT NULL,
    name          VARCHAR(50),
    password      VARCHAR(50),
    nationality   VARCHAR(50)
)

go

ALTER TABLE "User" ADD constraint user_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
go

ALTER TABLE Cart
    ADD CONSTRAINT cart_hardware_fk FOREIGN KEY ( hardware_id )
        REFERENCES hardware ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Cart
    ADD CONSTRAINT cart_payment_fk FOREIGN KEY ( payment_id )
        REFERENCES payment ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Cart ADD CONSTRAINT cart_user_fk FOREIGN KEY ( user_id )
    REFERENCES "User" (ID) 
    ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Payment
    ADD CONSTRAINT payment_paymentmethod_fk FOREIGN KEY ( paymentmethod_id )
        REFERENCES paymentmethod ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SC
    ADD CONSTRAINT relation_sc_competición_fk FOREIGN KEY ( competición_id )
        REFERENCES competition ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SC
    ADD CONSTRAINT relation_sc_surfer_fk FOREIGN KEY ( surfer_id )
        REFERENCES surfer ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SD
    ADD CONSTRAINT relation_sd_documentary_fk FOREIGN KEY ( documentary_id )
        REFERENCES documentary ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SD
    ADD CONSTRAINT relation_sd_surfer_fk FOREIGN KEY ( surfer_id )
        REFERENCES surfer ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SH
    ADD CONSTRAINT relation_sh_hardware_fk FOREIGN KEY ( hardware_id )
        REFERENCES hardware ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go

ALTER TABLE Relation_SH
    ADD CONSTRAINT relation_sh_surfer_fk FOREIGN KEY ( surfer_id )
        REFERENCES surfer ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
go



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             1
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
