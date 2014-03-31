<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script  src = "https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.js"  type="text/javascript" ></script>
<link rel="stylesheet" href="../css/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="../css/template.css" type="text/css" />
<link rel="stylesheet" href="../bootstrap-3.1.1-dist/css/bootstrap.min.css">

<script src="../js/languages/jquery.validationEngine-ja.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>


<script src="../bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

<title>Cadastro de Produto</title>
</head>			
				
<div  class="form-group"  >
<div id="erros">
	<ul>
		<c:forEach items="${errors}" var="error">
			<li>${error.category }- ${error.message }</li>
		</c:forEach>
	</ul>
</div>
<body>
<style>
body{
	background-color:#BFB8B8;
}
</style>
	<div class="form-group">
	<form id="formID" onsubmit="return jQuery(this).validationEngine('validate');" class="formular"  action='<c:url value="/produtos"/>'method="post">
		<fieldset>
			<legend>Adicionar Produto</legend>
			<label>Nome</label> 
			<input class="validate[required,minSize[2]] text-input" type="text" name="minsize" id="minsize" name="produto.nome" /> ˜ 
			<label for="descricao">Descri&ccedil;&atilde;o</label>
			<input id="descricao" name="produto.descricao"/>
			<label for="preco">Preço</label> 
			<input id="preco" type="text" name="produto.preco" />
			<button class= "btn btn-primary" type="submit" class="btn btn-default">Enviar</button>
			</fieldset>
	</div>
		</form>
		<form action="" class="formular">
			<a class="btn btn-link" href="<c:url value="/produtos/novo"/>"><button class="btn btn-primary" type="submit">Novo Produto</button></a>
			<a class="btn btn-link" href="<c:url value="/produtos"/>"><button class="btn btn-primary" type="submit">Lista Produtos</button></a>
			<p>Busca Produto:</p>
			<form action="<c:url value="/produto/busca"/>"><input name="nome" />
				<button class="btn btn-primary" type="submit" class="btn btn-default">Buscar</button>
			</form>
		</form></div>
</body>
</html>