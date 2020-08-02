-- Tabela 'Tensao'

CREATE TABLE IF NOT EXISTS Tensao (
  Codigo_tensao INT(4) NOT NULL,
  Forca FLOAT NOT NULL,
  Area_secao_corpo FLOAT NOT NULL,
  tensao FLOAT NOT NULL,
  PRIMARY KEY (Codigo_tensao),
  UNIQUE INDEX idPressao_UNIQUE (Codigo_tensao)
);

-- Tabela 'Modulo_Elasticidade'

CREATE TABLE IF NOT EXISTS Modulo_Elasticidade (
  Codigo_Modulo_Elasticidade INT(4) NOT NULL,
  tensao FLOAT NOT NULL,
  modulo_young FLOAT NOT NULL,
  deformacao FLOAT NOT NULL,
  UNIQUE INDEX idModulo_Elasticidade_UNIQUE (Codigo_Modulo_Elasticidade),
  PRIMARY KEY (Codigo_Modulo_Elasticidade)
  );

-- Tabela 'Deformacao'

CREATE TABLE IF NOT EXISTS Deformacao (
  Codigo_deformacao INT(4) NOT NULL,
  deformacao FLOAT NOT NULL,
  comprimento_inicial FLOAT NOT NULL,
  compromento_final FLOAT NOT NULL,
  UNIQUE INDEX Codigo_Elastica_UNIQUE (Codigo_deformacao),
  PRIMARY KEY (Codigo_deformacao)
  );

-- Tabela 'Limite_Resistencia'

CREATE TABLE IF NOT EXISTS Limite_resistencia (
  Codigo_LR INT(4) NOT NULL,
  F_max FLOAT NOT NULL,
  So FLOAT NOT NULL,
  LR FLOAT NOT NULL,
  UNIQUE INDEX Codigo_LR_UNIQUE (Codigo_LR),
  PRIMARY KEY (Codigo_LR)
  );

-- Tabela 'Corpo_Prova'

CREATE TABLE IF NOT EXISTS Corpo_Prova (
  Codigo_CP INT(4) NOT NULL,
  Material VARCHAR(45) NOT NULL,
  Peso FLOAT NOT NULL,
  Densidade FLOAT NOT NULL,
  Altura FLOAT NOT NULL,
  Diâmtero FLOAT NOT NULL,
  Comprimento FLOAT NOT NULL,
  Ductil TINYINT NOT NULL,
  Fragil TINYINT NOT NULL,
  UNIQUE INDEX Codigo_Tipo_UNIQUE (Codigo_CP),
  PRIMARY KEY (Codigo_CP)
  );

-- Tabela 'Registro_Pesquisas'

CREATE TABLE IF NOT EXISTS Registro_Pesquisas (
  Codigo_Registro INT(4) NOT NULL,
  Limite_resistencia_Codigo_LR INT NOT NULL,
  Deformacao_Codigo_deformacao INT NOT NULL,
  Tensao_Codigo_tensao INT NOT NULL,
  Modulo_Elasticidade_Codigo_Modulo_Elasticidade INT(4) NOT NULL,
  Corpo_Prova_Codigo_CP INT(4) NOT NULL,
  INDEX fk_Registro_Pesquisas_Limite_resistencia_idx (Limite_resistencia_Codigo_LR),
  INDEX fk_Registro_Pesquisas_Deformacao1_idx (Deformacao_Codigo_deformacao),
  INDEX fk_Registro_Pesquisas_Tensao1_idx (Tensao_Codigo_tensao),
  INDEX fk_Registro_Pesquisas_Modulo_Elasticidade1_idx (Modulo_Elasticidade_Codigo_Modulo_Elasticidade),
  INDEX fk_Registro_Pesquisas_Corpo_Prova1_idx (Corpo_Prova_Codigo_CP),
  UNIQUE INDEX Codigo_Registro_UNIQUE (Codigo_Registro),
  PRIMARY KEY (Codigo_Registro),
  CONSTRAINT `fk_Registro_Pesquisas_Limite_resistencia`
    FOREIGN KEY (`Limite_resistencia_Codigo_LR`)
    REFERENCES `mydb`.`Limite_resistencia` (`Codigo_LR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Pesquisas_Deformacao1`
    FOREIGN KEY (`Deformacao_Codigo_deformacao`)
    REFERENCES `mydb`.`Deformacao` (`Codigo_deformacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Pesquisas_Tensao1`
    FOREIGN KEY (`Tensao_Codigo_tensao`)
    REFERENCES `mydb`.`Tensao` (`Codigo_tensao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Pesquisas_Modulo_Elasticidade1`
    FOREIGN KEY (`Modulo_Elasticidade_Codigo_Modulo_Elasticidade`)
    REFERENCES `mydb`.`Modulo_Elasticidade` (`Codigo_Modulo_Elasticidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Pesquisas_Corpo_Prova1`
    FOREIGN KEY (`Corpo_Prova_Codigo_CP`)
    REFERENCES `mydb`.`Corpo_Prova` (`Codigo_CP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;

-- Tabela 'Log_Acesso'

CREATE TABLE IF NOT EXISTS Log_Acesso (
  Codigo_Acesso INT(4) NOT NULL,
  Horario TIME NOT NULL,
  Data DATE NOT NULL,
  Usuario INT(11) NOT NULL,
  Registro_Pesquisas_Codigo_Registro INT(4) NOT NULL,
  PRIMARY KEY (Codigo_Acesso),
  UNIQUE INDEX Log_Acesso_UNIQUE (Codigo_Acesso),
  INDEX fk_Log_Acesso_Registro_Pesquisas1_idx (Registro_Pesquisas_Codigo_Registro),
  CONSTRAINT `fk_Log_Acesso_Registro_Pesquisas1`
    FOREIGN KEY (`Registro_Pesquisas_Codigo_Registro`)
    REFERENCES `mydb`.`Registro_Pesquisas` (`Codigo_Registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

