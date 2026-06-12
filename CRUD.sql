INSERT INTO gestao_barbearia.CLIENTE 
    (id_usuario, cpf, nome_completo, data_nascimento, idade, email, ponto_nivel, saldo_cashback, saldo_creditos) 
VALUES
    (1, '111.111.111-01', 'Lucas Santos Oliveira', '1995-02-15', 31, 'lucas.oliveira@email.com', 450, 25.50, 100.00),
    (2, '111.111.111-02', 'Mateus Costa Souza', '1988-11-22', 38, 'mateus.souza@email.com', 320, 15.00, 50.00),
    (3, '111.111.111-03', 'Gabriel Almeida Rocha', '1990-05-10', 36, 'gabriel.rocha@email.com', 510, 40.00, 150.00),

SELECT id_usuario, nome_completo, cpf, ponto_nivel, saldo_cashback
FROM gestao_barbearia.cliente
WHERE saldo_cashback != 0

SELECT id_barbearia, nome_fantasia, email, saldo_devedor_plataforma
FROM gestao_barbearia.barbearia
WHERE saldo_devedor_plataforma > 0


UPDATE gestao_barbearia.cliente
SET ponto_nivel = ponto_nivel + 50
WHERE ponto_nivel = 0

UPDATE gestao_barbearia.cliente
SET saldo_creditos = saldo_creditos - 23
WHERE saldo_creditos > 100


DELETE FROM gestao_barbearia.servico
WHERE descricao = 'Consultoria de Visagismo'

DELETE FROM gestao_barbearia.servico
WHERE descricao = 'Penteado Clássico'