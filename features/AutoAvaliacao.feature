Feature: Auto-avaliação
	As a estudante
	I want to fazer a auto-avaliação dos meus conhecimentos
    So that eu compare minha avaliação com a do meu professor e veja se existe alguma discrepância entre minha avaliação e a dele.

Scenario: adicionando notas de auto-avaliação com sucesso
	Given que eu esteja logado como “Tiago” na tela de “auto-avaliação”
	And as minhas notas de auto-avaliação das “metas 1,2 e 3” não estão preenchidas
	When eu preencho as notas das “metas 1,2 e 3” com “MA”
	And eu submeto minhas notas
	Then eu estou na tela de “auto-avaliação”
	And eu vejo as notas “MA” nas metas “1,2 e 3”.

Scenario: adicionando notas de auto-avaliação com sucesso
	Given o estudante “Tiago” está cadastrado no sistema
	e suas notas de “auto-avaliação” nas metas “1, 2, 3” estão em branco.
	When eu peço ao sistema para que ele preencha as notas de “auto-avaliação” nas metas “1,2 e 3” com “MA, MPA, MPA”	
	Then as notas estão guardadas no sistema.
	And o estudante “Tiago” tem suas notas de “auto-avaliação” nas metas “1, 2, 3” guardadas como “MA, MPA, MPA”.
	
Scenario: adicionando notas de auto-avaliação com erro
	Given que eu esteja logado como “Tiago” na tela de “auto-avaliação”
	And as minhas notas de auto-avaliação das “metas 1, 2, 3” não estão preenchidas
	When eu preencho as notas das metas “1,2” com “MA”
	And eu submeto minhas notas
	Then eu estou na tela de “auto-avaliação”
	And eu vejo uma mensagem de erro sobre o cadastro das notas.
	
Scenario: adicionando notas de auto-avaliação com sucesso
	Given o estudante “Tiago” está cadastrado no sistema
	e suas notas de “auto-avaliação” nas metas “1, 2, 3” estão em branco.
	When eu peço ao sistema para que ele preencha as notas de “auto-avaliação” nas metas “1, 2” com “MA, MPA”	
	Then O sistema retorna “Todos os campos de auto-avaliação precisam ser preenchidos”.
	And o estudante “Tiago” tem suas notas de “auto-avaliação” nas metas “1, 2, 3” em branco.
