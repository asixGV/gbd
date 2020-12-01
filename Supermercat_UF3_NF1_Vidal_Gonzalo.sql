CREATE DATABASE supermercat112; 

CREATE TABLE Clients(
    DNI_Client CHAR(9) NOT NULL,
    Nom_Client VARCHAR(20) DEFAULT NULL,
    Cognom_Cli VARCHAR(20) DEFAULT NULL,
    Ntelf_Cli CHAR(8) DEFAULT NULL,
    Tipus_Client VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY(DNI_Client)

	
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE Caixer(
    Id_Caixer int(10) NOT NULL,
    DNI_Client CHAR(9) NOT NULL,
    Nom_caixer VARCHAR(20) NOT NULL,
    Cognom_Caixer VARCHAR(20) NOT NULL,
    PRIMARY KEY(Id_caixer),
    FOREIGN KEY (DNI_Client) REFERENCES Clients(DNI_Client)
            

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*El nom declarat de DNI_Caixer hauria de ser DNI_Client, ja que sino no pot ser clau forànea.

Els noms de les variables haurien de ser idCaixer no Id_caixer.
Les taules nom i cognom del caixer haurien d'estar junts.
*/



CREATE TABLE Compra(
    Id_Compra int(11) NOT NULL,
    DNI_Client CHAR(9) NOT NULL,
    Data_Compra DATETIME DEFAULT NULL,
    Id_Caixer int(10) NOT NULL,	
    PRIMARY KEY(Id_Compra),
    FOREIGN KEY (DNI_Client) REFERENCES Clients(DNI_Client),
    FOREIGN KEY (Id_Caixer) REFERENCES Caixer(Id_Caixer)
		    
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* El format de la data esta malament, ha de ser AAAA-MM-DD HH-MM-SS
*/


CREATE TABLE Linia_compra(
    Id_Compra int(11) NOT NULL,
    Id_Linia CHAR(9) NOT NULL,
    Id_Producte CHAR(9) NOT NULL,
    Unitats_Compra int(100),
    PRIMARY KEY(Id_Compra, Id_Linia),
    FOREIGN KEY (Id_Compra) REFERENCES Compra(Id_Compra)
            
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*SELECT Total_Linia es NULL, no pot existir una columna sense dades;

Les taules nom i cognom de clients haurien d'estar junts.

IDCompra no pot ser primària i forànea a la vegada.
*/


INSERT INTO `Clients` (`DNI_Client`, `Nom_Client`, `Cognom_Cli`, `Ntelf_Cli`, `Tipus_Client`) VALUES
('cl0000001', 'Pedro', 'Aguado', '35286724', 'Normal'),
('cl0000002', 'Maria', 'Marti', '83627391', 'Preferent'),
('cl0000003', 'Elena', 'Jose', '38518235', 'Normal'),
('cl0000004', 'Zoe', 'Mogux', '19462758', 'Normal');

INSERT INTO `Caixer` (`Id_caixer`, `DNI_Client`, `Nom_caixer`, `Cognom_Caixer`) VALUES
('001', 'cl0000001', 'Marcelo', 'Eaea'),
('002', 'cl0000002', 'Francesc', 'Dupi'),
('003', 'cl0000003', 'Laura', 'Gomp'),
('004', 'cl0000004', 'Mogadisho', 'Flow');

INSERT INTO `Compra` (`Id_Compra`, `DNI_Client`, `Data_Compra`, `Id_Caixer`) VALUES
('1', 'cl0000001', '2009-01-02 14:50', '001'),
('2', 'cl0000002', '2021-12-15 16:50', '003'),
('3', 'cl0000004', '2015-12-12 12:50', '004');

INSERT INTO `Linia_compra` (`Id_Compra`, `Id_Linia`, `Id_Producte`, `Unitats_Compra`) VALUES
('1', 'li0000001', 'pr0000001', '40'),
('2', 'li0000002', 'pr0000002', '100'),
('3', 'li0000003', 'pr0000004', '20');


