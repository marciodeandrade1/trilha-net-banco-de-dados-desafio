-- DESAFIO
-- 1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano 
FROM dbo.Filmes

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao 
	FROM dbo.Filmes 
ORDER BY Ano

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
	FROM dbo.Filmes 
Where Nome = 'De Volta para o Futuro'

-- 4 - Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao 
	FROM dbo.Filmes 
Where Ano = 1997

-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao 
	FROM dbo.Filmes 
Where Ano > 2000

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao 
	FROM dbo.Filmes 
Where Duracao > 100 AND Duracao < 150

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) as Quantidade
FROM dbo.Filmes
GROUP BY Ano
ORDER BY Quantidade DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT * FROM dbo.Atores WHERE Genero = 'M'

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT * FROM dbo.Atores WHERE Genero = 'F' ORDER BY PrimeiroNome

-- 10 - Buscar o nome do filme e o gênero
SELECT Filmes.Nome AS NomeFilme, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id;


-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT Filmes.Nome AS NomeFilme, Generos.Genero
FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE Generos.Genero = 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
    Filmes.Nome AS NomeFilme, 
    Atores.PrimeiroNome, 
    Atores.UltimoNome, 
    ElencoFilme.Papel
FROM 
    Filmes
INNER JOIN 
    dbo.Atores ON dbo.Filmes.Id = Atores.Id
INNER JOIN 
    dbo.ElencoFilme ON Filmes.Id = ElencoFilme.IdAtor AND Filmes.Id = ElencoFilme.IdFilme;