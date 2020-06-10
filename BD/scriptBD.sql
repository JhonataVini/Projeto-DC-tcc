use direcionacursos;

create table escolaridade(
id int NOT NULL AUTO_INCREMENT,
descricao varchar(100) not null,
PRIMARY KEY (id)
);

select * from aluno;
CREATE TABLE aluno (
	id int NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
	sexo char(1) NOT NULL,
	nascimento date NOT NULL,
	email varchar(100) NOT NULL,
    id_escolaridade int not null,
    senha varchar(40) not null,
	PRIMARY KEY (id),
    FOREIGN KEY(id_escolaridade) REFERENCES escolaridade(id)
);

select * from categoria;
create table categoria (
id int NOT NULL AUTO_INCREMENT,
desc_cat varchar(100) not null,
PRIMARY KEY (id)
);

select * from curso;
CREATE TABLE curso (
	id int NOT NULL AUTO_INCREMENT,
	nome_curso varchar(100) NOT NULL,
	duracao_curso time NOT NULL,
	idioma_curso varchar(30) NOT NULL,
	desc_curso varchar(1100),
    valor_curso float not null,
    id_categoria int not null,
	PRIMARY KEY (id),
    FOREIGN KEY(id_categoria) REFERENCES categoria(id)
);

create table favorito (
id_aluno int NOT NULL,
id_curso int NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id),
FOREIGN KEY(id_curso) REFERENCES curso(id)
);

select * from status;
create table status (
id int NOT NULL auto_increment,
status_desc varchar(50) NOT NULL,
PRIMARY KEY (id)
);

create table status_curso (
id_aluno int NOT NULL,
id_curso int NOT NULL,
id_status int NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id),
FOREIGN KEY(id_curso) REFERENCES curso(id),
FOREIGN KEY(id_status) REFERENCES status(id)
);

create table certificado_aluno (
id_certificado varchar(300) NOT NULL,
url_certificado varchar(600) NOT NULL,
id_aluno int not null,
id_curso int,
validade_certificado datetime,
PRIMARY KEY (id_certificado),
FOREIGN KEY(id_aluno) REFERENCES aluno(id),
FOREIGN KEY(id_curso) REFERENCES curso(id)
);

INSERT INTO escolaridade (descricao)
VALUES (
'Fundamental - Incompleto',
'Fundamental - Completo',
'Médio - Incompleto',
'Médio - Completo',
'Superior - Incompleto',
'Superior - Completo',
'Pós-graduação (Lato senso) - Incompleto',
'Pós-graduação (Lato senso) - Completo',
'Pós-graduação (Stricto sensu, nível mestrado) - Incompleto',
'Pós-graduação (Stricto sensu, nível mestrado) - Completo',
'Pós-graduação (Stricto sensu, nível doutor) - Incompleto',
'Pós-graduação (Stricto sensu, nível doutor) - Completo');

-- categoria 1 - Desenvolvimento	
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Curso Web Moderno Completo com JavaScript 2020 + Projetos', '85:58:38', 'Portugues', 'Seja muito bem vindo ao Curso Desenvolvimento Web Moderno com JavaScript! COMPLETO 2020 + Projetos! Esse que talvez seja o maior e mais completo curso de tecnologia do mercado. São quase 600 aulas divididas em 33 capítulos com mais de 85 horas. Além dos fundamentos e vários exercícios, são vários projetos com as principais tecnologias da atualidade com aplicação na vida real, te ensinando a ser um desenvolvedor Web desde o básico até ao nível profissional avançado. ', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('C# COMPLETO 2020 Programação Orientada a Objetos + Projetos', '34:41:14', 'Portugues', 'Neste curso você vai aprender tudo sobre Programação Orientada a Objetos utilizando C#. Vamos começar desde o básico, com exemplos bem simples e didáticos, e daí vamos gradualmente avançando, até mergulharmos em tópicos aprofundados tais como interfaces, polimorfismo, princípios SOLID, padrões de projeto, generics, expressões lambda, delegates, LINQ e muito mais.', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('O curso completo de Banco de Dados e SQL, sem mistérios!', '58:13:25', 'Portugues', 'A metodologia utilizada é gradativa e nós explicamos tudo do absoluto zero. Sim, você não precisa saber nada! Você deseja aprender banco de dados? Então você vai aprender banco de dados!', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Curso Completo de PHP 7', '33:22:59', 'Portugues', 'Este Curso de PHP 7 Completo vai proporcionar em um só lugar tudo o que precisa saber para criar seu próprio website. A equipe de instrutores da Hcode estará disponível para responder suas dúvida.', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Criação de Apps Android e iOS com Flutter - Crie 16 Apps', '46:25:10', 'Portugues', 'Seja bem-vindo(a) ao Curso Completo de Criação de Apps com Flutter, o curso de Flutter mais completo e avançado da Udemy! Caso você ainda não conheça, o Flutter é o novo Framework para desenvolvimento de apps Android e iOS criado pela Google!', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Construindo Aplicações Web Com o Novo Angular (4, 5 e 6)', '15:55:16', 'Portugues', 'Neste curso você vai aplicar os fundamentos da nova versão do Angular para construir uma aplicação de delivery de comida, que eu chamei de MEAT.', '20.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Jogos 3D com Unity + modo multiplayer', '65:00:13', 'Portugues', 'Atualmente quando ouvimos falar em desenvolvimento de jogos certamente você já ouviu falar em Unity 3D.E não é por acaso que ela é sempre citada quando se fala nesse assunto, segundo o site de notícias de tecnologia The Next Web, a engine domina 45% do mercado global de games.', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('The Data Science Course 2020: Complete Data Science Bootcamp', '28:52:43', 'Inglês', 'Data scientist is one of the best suited professions to thrive this century. It is digital, programming-oriented, and analytical. Therefore, it comes as no surprise that the demand for data scientists has been surging in the job marketplace.', '31.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('The Complete Node.js Developer Course (3rd Edition)', '35:01:08', 'Inglês', 'Have you tried to learn Node before? You start a new course, and the instructor has you installing a bunch of libraries before you even know what Node is or how it works. You eventually get stuck and reach out to the instructor, but you get no reply. You then close the course and never open it again.', '19.99', '1');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`) VALUES ('Artificial Intelligence A-Z™: Learn How To Build An AI', '16:26:23', 'Inglês', 'How to start building AI with no previous coding experience using Python. How to merge AI with OpenAI Gym to learn as effectively as possible. How to optimize your AI to reach its maximum potential in the real world', '19.99', '1');
-- categoria 1 - Negocios
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Gestão Ágil com Scrum COMPLETO + 3 Cursos EXTRAS', '06:50:03', 'Portugues', 'Indiscutivelmente o mais completo: gestão ágil de projetos com SCRUM (Scrum Agile), Liderança, Negociação, Produtividade e Mentoria em um só curso!', '23.99', '2', 'https://www.udemy.com/course/gestao-projetos-agile-scrum-completo/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Certificação Scrum Master: Curso Preparatório COMPLETO', '10:54:17', 'Portugues', 'Você sabia que o Scrum é o framework ágil mais famoso do mundo? Pois é! Ele ficou assim famoso por ser adaptativo, iterativo, flexível além de ser um método de rápida entrega de valor.', '22.99', '2', 'https://www.udemy.com/course/formacao-total-em-scrum/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Gestão Financeira Para Pequenas e Médias Empresas', '06:02:48', 'Portugues', 'Este curso foi desenhado levando em consideração as maiores dificuldades encontradas por mim em centenas de empresários dos mais diversos ramos que tive a oportunidade de conhecer pessoalmente ou através de pesquisas para projetos de consultorias.', '24.99', '2', 'https://www.udemy.com/course/gestao-financeira/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Ms Project 2019 - do Básico ao Avançado', '11:48:42', 'Portugues', 'Este curso ensina como planejar e controlar cronogramas, recursos e orçamentos de projetos utilizando o Microsoft Project, uma das ferramentas de gerenciamento de projetos mais populares do mercado corporativo, em sua versão mais atual.', '35.99', '2', 'https://www.udemy.com/course/dominandoproject/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Análise Técnica: Curso para Day Trade e Análise Gráfica', '05:33:37', 'Portugues', 'No Curso para DayTrade e Analise Técnica vamos lhe ensinar as fazer análise gráfica técnica utilizando uma ferramenta gratuita de análise gráfica.', '23.99', '2', 'https://www.udemy.com/course/curso-para-daytrade-e-analise-tecnica/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('SUBLIMAÇÃO PARA INICIANTES + COREL DRAW*', '12:58:18', 'Portugues', 'Curso definitivo para quem deseja COMEÇAR a trabalhar com sublimação. *Bonus: aulas de Corel Draw voltado para a sublimação!!! Aprenda dicas fundamentais de maquinas, papéis, tintas, artes, vendas... e tudo o que é mais importante para INICIAR a sublimar camisetas, chinelos, almofadas, canecas, etc.', '129.99', '2', 'https://www.udemy.com/course/sublimacao-para-iniciantes/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Curso Forex Completo Profissionalizante', '12:37:04', 'Portugues', 'Neste curso, mostrarei como você pode aproveitar os movimentos dos preços para obter lucros. Vamos falar em detalhes sobre Moedas, Gráficos, Gestão de Risco, Trading Plan, Estratégias Vencedoras e muito mais.', '19.99', '2', 'https://www.udemy.com/course/curso_forex_exodustrading/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Modelagem de Processos com Bizagi', '04:24:35', 'Portugues', 'Neste curso veremos os conceitos básicos de gestão por processos, entender como coletar informações de processo e aprender como modelar processos utilizando o software Bizagi seguindo a notação BPMN. As primeiras aulas são mais breves e se dedicam à apresentar a teoria de processos. O principal deste curso será a prática da modelagem com casos práticos e exercícios.', '19.99', '2', 'https://www.udemy.com/course/modelagem-de-processos/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('Python para Finanças: Investimentos & Análise de Dados', '07:05:18', 'Portugues', 'Temos o orgulho de apresentar o Python para Finanças: Investimentos & Análise de Dados - um dos cursos mais interessantes e completos que criamos até o momento. Demorou um pouco mais de quatro meses para criar esse curso, mas agora ele está pronto e esperando por você.', '19.99', '2', 'https://www.udemy.com/course/python-para-financas-investimentos-analise-de-dados/');
INSERT INTO `direcionacursos`.`curso` (`nome_curso`, `duracao_curso`, `idioma_curso`, `desc_curso`, `valor_curso`, `id_categoria`, `link_curso`) VALUES ('CRM . Gestão do Relacionamento com o Cliente', '08:59:55', 'Portugues', 'Neste curso você vai aprender a estruturar e implantar um programa de CRM (Customer Relationship Management) na sua empresa de forma profissional e definitiva.', '27.99', '2', 'https://www.udemy.com/course/crm-gestao-do-relacionamento-com-o-cliente/');


