CREATE TABLE Clients
(
  DNI_Client INT NOT NULL,
  Nom_client CHAR(50) NOT NULL,
  Ntelf_Clie VARCHAR(20) NOT NULL,
  Tipus_client CHAR(15) NOT NULL,
  Cognom_Cli CHAR(50) NOT NULL,
  PRIMARY KEY (DNI_Client)
);

CREATE TABLE Productes
(
  Id_Producte INT NOT NULL,
  Nom_Producte VARCHAR(50) NOT NULL,
  PRIMARY KEY (Id_Producte)
);

CREATE TABLE Caixers
(
  Id_caixer INT NOT NULL,
  DNI_Caixer VARCHAR(50) NOT NULL,
  Nom_caixer CHAR(50) NOT NULL,
  Cognom_Caixer CHAR(50) NOT NULL,
  Ntelf_Caixer VARCHAR(15) NOT NULL,
  PRIMARY KEY (Id_caixer)
);

CREATE TABLE Compres
(
  Id_Compra INT NOT NULL,
  Data_compra INT NOT NULL,
  DNI_Client INT NOT NULL,
  Id_caixer INT NOT NULL,
  PRIMARY KEY (Id_Compra),
  FOREIGN KEY (DNI_Client) REFERENCES Clients(DNI_Client)
                on delete restrict on update cascade,
  FOREIGN KEY (Id_caixer) REFERENCES Caixers(Id_caixer)
                on delete restrict on update cascade
);

CREATE TABLE Linies_Compra
(
  Id_Linia INT NOT NULL,
  Unitats_Compra INT NOT NULL,
  Total_Linia INT NOT NULL,
  Id_Producte INT NOT NULL,
  Id_Compra INT NOT NULL,
  PRIMARY KEY (Id_Linia, Id_Compra),
  FOREIGN KEY (Id_Producte) REFERENCES Productes(Id_Producte)
                on delete restrict on update cascade,
  FOREIGN KEY (Id_Compra) REFERENCES Compres(Id_Compra)
                on delete restrict on update cascade
);

