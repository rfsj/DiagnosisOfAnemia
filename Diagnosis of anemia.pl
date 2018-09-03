true(sim).
true(homem).

sintoma :-
    write('O paciente sente algum dos seguintes sintomas?'), nl,
    write('Sintomas: Fraqueza, Tonturas, Desmaios, Taquicardia, Palidez, Palpitações,Icterícia.'), nl,
    write('Responda: sim ou não'), nl,
    %Lendo resposta
    read(INPUT),
    %Definindo a variavel sintoma
    true(INPUT).
		
masculino :-
    write('Qual o sexo do paciente?'), nl,
    write('Responda: homem ou mulher'), nl,
    %Lendo resposta
    read(MASC),
    %Verificando se é homem, caso não seja, é mulher
	true(MASC).

hemoglobinabaixahomem :-
    %Verificando se o percentual está abaixo do aceitável para homens.
    write('Qual a quantidade de hemoglobina do paciente (em g/L)?'),nl,
    read(HEMOH), HEMOH < 140.
    
hemoglobinabaixamulher :-
    %Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de hemoglobina do paciente (em g/L)?'),nl,
    read(HEMOM), HEMOM < 120.

hematocritosbaixohomem :-
	%Verificando se o percentual está abaixo do aceitável para homens.
    write('Qual o percentual do nível de hematócritos do paciente?'),nl,
    read(HETOH), HETOH < 42.
	
hematocritosbaixomulher :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual o percentual do nível de hematócritos do paciente?'),nl,
    read(HETOM), HETOM < 35.
	
hemaciasbaixahomem :-
	%Verificando se o percentual está abaixo do aceitável para homens.
    write('Qual a quantidade de hemacias do paciente (10^6/mm³)?'),nl,
    read(HEMAH), HEMAH < 4.3.
	
hemaciasbaixamulher :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de hemacias do paciente?'),nl,
    read(HEMAM), HEMAM < 3.5.

ferritinabaixa :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de ferritina do paciente (em mcg/dl)?'),nl,
    read(FERRI), FERRI < 10.
b9baixa :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de b9 do paciente (em ng/mL)?'),nl,
    read(B9), B9 < 2.7.
b6baixa :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de b6 do paciente (em ng/mL)?'),nl,
    read(B6), B6 < 8.7.
b12baixa :-
	%Verificando se o percentual está abaixo do aceitável para mulheres.
    write('Qual a quantidade de b12 do paciente (em pg/mL)?'),nl,
    read(B12), B12 < 200.

eletroforese :-
    %O diagnóstico é feito pela eletroforese de hemoglobina que detecta a presença da hemoglobina mutante (Hemoglobina S). 
	write('O exame de eletroforese de hemoglobina detectou a presença da hemoglobina mutante (Hemoglobina S)?'),nl,
	write('Responda: sim ou nao'),
	%Lendo resposta
    read(HEMOS),
    %definindo a variavel
    true(HEMOS).
	
testefragilidadecromossomica :-
	write('O teste de fragilidade cromossômica detectou alguma alteração? Responda: sim ou nao'),nl,
	write('Responda: sim ou nao'),
	%Lendo resposta
    read(CROMO),
    %definindo a variavel
    true(CROMO).
%Verificando se a anemia é congenita.
historicocongenito :-

    write('O paciente apresenta evidências de icterícia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evidências de cálculos biliares?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evidências de esfenomegalia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evidências de hepatomegalia?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evidências de malformações ósseas?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente apresenta evidências de retardo mental?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA).

%Verificando se existe um determinante hemolítico congênito
determinantecongenito :-
    write('Existem resultados laboratoriais que apontam microcitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam eliptocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam esferocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('Existem resultados laboratoriais que apontam anisopoikilocitose?'),nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA);

    write('O paciente tem anemia relacionada à comida?'), nl,
    write('Responda: sim ou nao'),
    read(RESPOSTA),
    true(RESPOSTA).	

%Verificando se o paciente tem de anemia.
anemia :-
	masculino -> anemiahomem; 
	anemiamulher.

anemiahomem :-
    (sintoma,(
    hemoglobinabaixahomem;
    hematocritosbaixohomem;hemaciasbaixahomem)) ->
    write('O resultado do teste de anemia para o paciente foi positivo. Seguindo com a verificação de subtipo...'),nl, testesubtipo;
    write('O resultado do teste de anemia para o paciente foi negativo.'), false.	
anemiamulher :-
    (sintoma,(hemoglobinabaixamulher;
    hematocritosbaixomulher;hemaciasbaixamulher)) ->
    write('O resultado do teste de anemia para o paciente foi positivo. Seguindo com a verificação de subtipo...'),nl, testesubtipo;
    write('O resultado do teste de anemia para o paciente foi negativo.'), false.

%Verificando subtipo.
testesubtipo :-
	
    ferritinabaixa -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Ferropriva(Adquirida por deficiência de ferro).');
	
	b9baixa -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Megaloblástica(Adquirida por deficiência de vitamina B9).');
	
	b6baixa -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Sideroblástica(Adquirida por deficiência de vitamina B6).');
	
	b12baixa -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Perniciosa(Adquirida por deficiência de vitamina B12).');
	
	(historicocongenito, determinantecongenito) -> testesubtipocongenita;
	
	write('Resultado: Desconhecido.'),nl,
    write('Diagnóstico: Não foi possível identificar o motivo da anemia.').

testesubtipocongenita :-	
	eletroforese -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Falseforme(Congênita).');
	
	testefragilidadecromossomica -> write('Resultado: positivo.'),nl,
    write('Diagnóstico: Anemia Falconi(Congênita).');
	
	write('Resultado: positivo.'),nl,
    write('Diagnóstico: anemia Aplástica(Congênita).').
	
/*
testeinterface:- 
	new (Dialogo, dialog('Exame médico')),
	new (Etiqueta, label("Teste de Anemia ")),
	new (Texto1, text_item('Anemia é a deficiência no tamanho ou número de hemácias ou na quantidade de hemoglobina que elas contêm. O que limita a troca de oxigênio e dióxido de carbono entre o sangue e as células dos tecidos')),
	new (Texto2, text_item('O paciente senet algum desses sintomas?')),
	new (Texto3, text_item('Sintomas: Fraqueza, Tonturas, Desmaios, Taquicardia, Palidez, Palpitações,Icterícia.')),
	new(Botao1, button('Sair', message(Interface, destroy))),
	new(Botao2, button('Continuar', and(message(@prolog, anemia, Resposta?selection, Interface)))),
	
	
	
	send (Dialogo, append, Etiqueta),
	send (Dialogo, append, Texto1),
	send (Dialogo, append, Texto2),
	send (Dialogo, append, Texto3)
	send (Dialogo, append, Boton1),
	send (Dialogo, append, Boton2),
	send (Dialogo, open).
*/	
