<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="../bootstrap-3.1.1-dist/css/bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="../bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

<title>Cadastro de Produto</title>
</head>
<div id="erros">
	<ul>
		<c:forEach items="${errors}" var="error">
			<li>${error.category }- ${error.message }</li>
		</c:forEach>
	</ul>
</div>
<body>
	<ul>
		<li><a class="btn btn-link" href="<c:url value="/produtos/novo"/>">Novo Produto</a></li>
		<li><a class="btn btn-link" href="<c:url value="/produtos"/>">Lista Produtos</a></li>
		<li>Busca Produto:
			 <form action="<c:url value="/produto/busca"/>">
				<input name="nome" /> <button type="submit" class="btn btn-default" > Buscar</button>
			</form></li>
	</ul>
	<form id="produtosForm"  action='<c:url value="/produtos"/>'method="post">
		<fieldset>
			<legend>Adicionar Produto</legend>
			<label>Nome:</label> <input class="input-lg" id="nome" type="text"
				name="produto.nome" /> ˜ <label for="descricao">Descrição:</label>
			<textarea id="descricao" name="produto.descricao"></textarea>
			<label for="preco">Preço:</label> <input id="preco" type="text"
				name="produto.preco" />
			<button type="submit" class="btn btn-default">Enviar</button>
		</fieldset>
	</form>
</body>
</html>