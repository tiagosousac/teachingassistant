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
	
Scenario: adicionando notas de auto-avaliação com erro
	Given o estudante “Tiago” está cadastrado no sistema
	And suas notas de “auto-avaliação” nas metas “1, 2, 3” estão em branco.
	When eu peço ao sistema para que ele preencha as notas de “auto-avaliação” nas metas “1, 2” com “MA, MPA”	
	Then O sistema retorna uma mensagem que todos os campos precisam ser preenchidos e que gabi é besta.
	And o estudante “Tiago” tem suas notas de “auto-avaliação” nas metas “1, 2, 3” em branco

Scenario: sem alunos com auto-avaliação discrepantes
	Given eu estou logado como "Paulo Borba"
	And estou na página de "alunos"
	And vejo os alunos "Igor" com notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MA, MA, MPA, MA, MPA" e auto-avaliação "MA, MA, MA, MPA, MPA", "Tiago" co notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MA, MA, MA, MA, MPA" e auto-avaliação "MA, MA, MA, MA, MPA" e "Diego" com notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MPA, MPA, MPA, MA, MA" e auto-avaliação "MANA, MANA, MANA, MPA, MPA"
	When eu seleciono a pagina "alunos com auto-avaliação discrepantes"
	Then eu vejo a lista vazia

Scenario: alunos com auto-avaliação discrepantes
	Given eu estou logado como "Paulo Borba"
	And estou na página de "alunos"
	And vejo os alunos "Igor" com notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MANA, MANA, MPA, MA, MPA" e auto-avaliação "MA, MA, MA, MPA, MPA", "Tiago" co notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MA, MA, MA, MA, MPA" e auto-avaliação "MA, MA, MA, MA, MPA" e "Diego" com notas dadas pelo professor nas metas "1, 2, 3, 4 e 5", respectivamente, "MPA, MPA, MPA, MA, MA" e auto-avaliação "MANA, MANA, MANA, MPA, MPA"
	When eu seleciono a pagina "alunos com auto-avaliação discrepantes"
	Then [mudança pfv da erro eu imploro] eu vejo o aluno "Igor" na lista.

