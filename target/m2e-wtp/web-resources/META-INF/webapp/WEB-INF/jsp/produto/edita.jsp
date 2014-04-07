<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Produto</title>
</head>
<body>
	<form action="<c:url value="/produtos"/>" method="POST">
		<fieldset>
			<legend>Editar Produto</legend>
			<label for="nome">Nome:</label> 
			<input id="nome" type="text"name="produto.nome" value="${produto.nome}"/>
			 <label for="descricao">Descrição:</label>
			<input id="descricao" name="produto.descricao" value="${produto.descricao }"/>
			<label for="preco">Preço:</label> 
			<input id="preco" type="text"name="produto.preco" value="${produto.preco}"/>
			<button type="submit">Enviar</button>
		</fieldset>
	</form>
	<form action="<c:url value="/produtos/${produto.id }/imagem"/>"
		method="POST" enctype="multipart/form-data">
		<fieldset>
			<legend>Upload de Imagem</legend>
			<input type="file" name="imagem" />
			<button type="submit">Enviar</button>
		</fieldset>
	</form>
</body>
</html>