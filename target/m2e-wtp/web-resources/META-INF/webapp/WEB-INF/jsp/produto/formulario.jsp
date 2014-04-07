<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="arquivo.html"%>
<title>Cadastro de Produto</title>
</head>
<body>
	<h3>Meu carrinho:</h3>
	<c:if test="${empty carrinho or carrinho.totalDeItens eq 0 }">
		<span>Você não possui itens no seu carrinho</span>
	</c:if>
	<c:if test="${carrinho.totalDeItens > 0 }">
		<ul>
			<li><strong>Itens:</strong> ${carrinho.totalDeItens }</li>
			<li><strong>Total:</strong> <fmt:formatNumber type="currency"
					value="${carrinho.total }" /></li>
		</ul>
	</c:if>
	<div class="form-group">
	<div id="erros">
		<ul>
			<c:forEach items="${errors}" var="error">
				<li>${error.category }-${error.message }</li>
			</c:forEach>
		</ul>
	</div>
<div class="form-group">
	<form id="formID" class="formular" action='<c:url value="/produtos"/>' method="post">
		<fieldset>
		<legend>Adicionar Produto</legend>
		<label>Nome</label> 
		<input class="validate[required,minSize[3],maxSize[20]], form-control" type="text" name="produto.nome"/> 
		<label>Descrição</label> 
		<input class="validate[required,minSize[3],maxSize[20]], form-control" type="text" name="produto.descricao" />
		<label for="preco">Preço</label>
		<input class="validate[required,minSize[3],maxSize[20]], form-control"id="preco" type="text" name="produto.preco" />
		<button class="btn btn-primary" type="submit">Enviar</button>
		</fieldset>
	</form>
</div>
<div class="form-group" align="center">
	<a class="btn btn-link" href="<c:url value="/produtos/novo"/>">
	<button class="btn btn-primary" type="submit">Novo Produto</button></a> 
	<a class="btn btn-link" href="<c:url value="/produtos"/>">
	<button	class="btn btn-primary" type="submit">Lista Produtos</button></a>
</div>
<div class="form-group" align="center">
	<form action="<c:url value="/produto/busca"/>">
	<input id="busca" class="validate[minSize[3],maxSize[20]], " name="nome" />
	</form>
	</div>
</div>
<img src="<c:url value="/produtos/${produto.id}/imagem"/>"width="100" height="100"/>
</body>
<%@ include file="script.html"%>
</html>