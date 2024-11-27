-- Criação das tabelas

-- Explicação: Para criar cada tabela, usei os relacionamentos que existem no Json. Cada pedido na tabela 'guestCheck' está relacionado com sua respectiva linha de detalhe, na tabela 'detailLines'. Já os itens de menu específicos, estão sendo tratados na tabela 'menuItems', obtendo se maior flexibilidade.

-- A tabela guestChecks contém os valores dos pedidos

CREATE TABLE guestChecks (
    guestCheckId INTEGER PRIMARY KEY,
    chkNum INTEGER,
    opnBusDt DATE,
    clsdBusDt DATE,
    clsdFlag BOOLEAN,
    gstCnt INTEGER,
    subTtl FLOAT,
    chkTtl FLOAT,
    dscTtl FLOAT,
    empNum INTEGER
);

-- A tabela detailLines contém os detalhes do pedido

CREATE TABLE detailLines (
    guestCheckLineItemId INTEGER PRIMARY KEY,
    guestCheckId INTEGER,
    lineNum INTEGER,
    dspTtl FLOAT,
    dspQty INTEGER,
    chkEmpId INTEGER,
    seatNum INTEGER,
    FOREIGN KEY (guestCheckId) REFERENCES guestChecks (guestCheckId)
);

-- A tabela menuItem contém o item do menu e valores de taxa, caso necessário

CREATE TABLE menuItem (
    miNum INTEGER PRIMARY KEY,
    guestCheckLineItemId INTEGER,
    modFlag BOOLEAN,
    inclTax FLOAT,
    activeTaxes TEXT,
    prcLvl INTEGER,
    FOREIGN KEY (guestCheckLineItemId) REFERENCES detailLines (guestCheckLineItemId)
);

-- Inserção de dados nas tabelas

INSERT INTO guestChecks (
    guestCheckId, chkNum, opnBusDt, clsdBusDt, clsdFlag, gstCnt, subTtl, chkTtl, dscTtl, empNum
) VALUES (
    1122334455, 1234, '2024-01-01', '2024-01-01', TRUE, 1, 109.9, 109.9, -10.0, 55555
);

INSERT INTO detailLines (
    guestCheckLineItemId, guestCheckId, lineNum, dspTtl, dspQty, chkEmpId, seatNum
) VALUES (
    9988776655, 1122334455, 1, 119.9, 1, 10454318, 1
);

INSERT INTO menuItem (
    miNum, guestCheckLineItemId, modFlag, inclTax, activeTaxes, prcLvl
) VALUES (
    6042, 9988776655, FALSE, 20.809091, '28', 3
);