SELECT 
    BARBEARIA.nome_fantasia, 
    BARBEARIA.end_cidade, 
    TELEFONE_BARBEARIA.numero_telefone AS whatsapp_principal
FROM gestao_barbearia.BARBEARIA
INNER JOIN gestao_barbearia.TELEFONE_BARBEARIA 
    ON BARBEARIA.id_barbearia = TELEFONE_BARBEARIA.id_barbearia
WHERE BARBEARIA.end_cidade = 'Rio de Janeiro' AND TELEFONE_BARBEARIA.principal = TRUE
ORDER BY BARBEARIA.nome_fantasia ASC;


SELECT 
    CLIENTE.nome_completo, 
    CLIENTE.email, 
    PLANO_GLOBAL.tipo_recorrencia, 
    PLANO_GLOBAL.categoria_permitida
FROM gestao_barbearia.CLIENTE
INNER JOIN gestao_barbearia.PLANO_GLOBAL 
    ON CLIENTE.id_usuario = PLANO_GLOBAL.id_usuario
WHERE PLANO_GLOBAL.ativo = TRUE
ORDER BY PLANO_GLOBAL.tipo_recorrencia DESC, CLIENTE.nome_completo ASC;

SELECT 
    AGENDAMENTO.cod_agendamento,
    CLIENTE.nome_completo AS nome_cliente,
    SERVICO.descricao AS servico_realizado,
    AGENDAMENTO.valor_pago,
    AGENDAMENTO.data_hora
FROM gestao_barbearia.AGENDAMENTO
INNER JOIN gestao_barbearia.CLIENTE 
    ON AGENDAMENTO.id_usuario = CLIENTE.id_usuario
INNER JOIN gestao_barbearia.SERVICO 
    ON AGENDAMENTO.cod_servico = SERVICO.cod_servico
WHERE AGENDAMENTO.status = 'Concluido' AND AGENDAMENTO.met_pagamento = 'Pix' AND AGENDAMENTO.valor_pago >= 50.00
ORDER BY AGENDAMENTO.valor_pago DESC;

SELECT 
    BARBEIRO.nome AS nome_barbeiro, 
    BARBEIRO.data_contratacao, 
    BARBEARIA.nome_fantasia AS unidade_alocada
FROM gestao_barbearia.BARBEIRO
INNER JOIN gestao_barbearia.BARBEARIA 
    ON BARBEIRO.id_barbearia = BARBEARIA.id_barbearia
WHERE BARBEIRO.data_contratacao >= '2024-01-01'
ORDER BY BARBEIRO.data_contratacao DESC;

SELECT 
    CLIENTE.nome_completo, 
    CLUBE_FIDELIDADE.cortes_restantes, 
    CLUBE_FIDELIDADE.validade,
    BARBEARIA.nome_fantasia AS barbearia_vinculada
FROM gestao_barbearia.CLUBE_FIDELIDADE
INNER JOIN gestao_barbearia.CLIENTE 
    ON CLUBE_FIDELIDADE.id_usuario = CLIENTE.id_usuario
INNER JOIN gestao_barbearia.BARBEARIA 
    ON CLUBE_FIDELIDADE.id_barbearia = BARBEARIA.id_barbearia
WHERE CLUBE_FIDELIDADE.cortes_restantes <= 2 AND CLUBE_FIDELIDADE.cortes_restantes > 0
ORDER BY CLUBE_FIDELIDADE.cortes_restantes ASC, CLUBE_FIDELIDADE.validade ASC;

SELECT 
    BARBEIRO.nome AS profissional,
    CLIENTE.nome_completo AS cliente,
    AGENDAMENTO.data_hora AS horario_agendado,
    AGENDAMENTO.status
FROM gestao_barbearia.AGENDAMENTO
INNER JOIN gestao_barbearia.BARBEIRO 
    ON AGENDAMENTO.cpf_barbeiro = BARBEIRO.cpf_barbeiro
INNER JOIN gestao_barbearia.CLIENTE 
    ON AGENDAMENTO.id_usuario = CLIENTE.id_usuario
WHERE AGENDAMENTO.status = 'Agendado' OR AGENDAMENTO.status = 'Confirmado'
ORDER BY AGENDAMENTO.data_hora ASC;

SELECT 
    FILA_ESPERA.cod_fila,
    CLIENTE.nome_completo,
    BARBEARIA.nome_fantasia AS barbearia_desejada,
    FILA_ESPERA.data_desejada
FROM gestao_barbearia.FILA_ESPERA
INNER JOIN gestao_barbearia.CLIENTE 
    ON FILA_ESPERA.id_usuario = CLIENTE.id_usuario
INNER JOIN gestao_barbearia.BARBEARIA 
    ON FILA_ESPERA.id_barbearia = BARBEARIA.id_barbearia
WHERE FILA_ESPERA.notificado = FALSE
ORDER BY FILA_ESPERA.data_desejada ASC;

SELECT 
    CLIENTE.nome_completo, 
    CLIENTE.idade, 
    CLIENTE.ponto_nivel, 
    CLIENTE.saldo_cashback
FROM gestao_barbearia.CLIENTE
WHERE CLIENTE.idade < 35 AND CLIENTE.ponto_nivel > 100
ORDER BY CLIENTE.ponto_nivel DESC, CLIENTE.saldo_cashback DESC;

SELECT 
    BARBEARIA.nome_fantasia, 
    BARBEARIA.end_cidade, 
    BARBEARIA.email, 
    BARBEARIA.saldo_devedor_plataforma
FROM gestao_barbearia.BARBEARIA
WHERE BARBEARIA.saldo_devedor_plataforma > 0.00
ORDER BY BARBEARIA.saldo_devedor_plataforma DESC;

SELECT 
    SERVICO.cod_servico, 
    SERVICO.descricao, 
    SERVICO.fator_peso
FROM gestao_barbearia.SERVICO
WHERE SERVICO.fator_peso >= 1.5
ORDER BY SERVICO.fator_peso DESC, SERVICO.descricao ASC;