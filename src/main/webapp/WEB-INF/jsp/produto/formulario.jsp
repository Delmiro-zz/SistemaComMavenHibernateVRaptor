<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="../css/template.css" type="text/css" />

<link rel="stylesheet" href="../bootstrap-3.1.1-dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script charset="utf-8" type="text/javascript" src="<c:url value='/javascript/api-jquery/jquery.validationEngine.js'/>"></script>
<script charset="utf-8" type="text/javascript"  src="<c:url value='/javascript/api-jquery/jquery.validationEngine-pt_BR.js'/>"></script>
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
	<form id="formID" class="formular"  action='<c:url value="/produtos"/>'method="post">
		<fieldset>
			<legend>Adicionar Produto</legend>
			<label>Nome</label>
			<input class="validate[required,minSize[3],maxSize[20]], form-control"  type="text" name="produto.nome"/>
			<label>Descrição</label>
			<input class="validate[required,minSize[3],maxSize[20]], form-control"  type="text" name="produto.descricao"/>
			<label for="preco">Preço</label>
			<input class="validate[required,minSize[3],maxSize[20]], form-control"  id="preco" type="text" name="produto.preco" />
			<button class="btn btn-primary" type="submit" class="btn btn-default">Enviar</button>
		</fieldset>
	</div>
		</form>
		<form id="formBusca" action="" class="formular">
			<a class="btn btn-link" href="<c:url value="/produtos/novo"/>"><button class="btn btn-primary" type="submit">Novo Produto</button></a>
			<a class="btn btn-link" href="<c:url value="/produtos"/>"><button class="btn btn-primary" type="submit">Lista Produtos</button></a>
			<h4>Buscar Produto:</h4>
			<form action="<c:url value="/produto/busca"/>"><input class="validate[minSize[3],maxSize[20]], form-control" name="nome" />
				<button class="btn btn-primary" type="submit" class="btn btn-default">Buscar</button>
			</form>
		</form></div>
</body>
<script>
$(document).ready(function(){
    $("#formID").validationEngine();
   });
</script>
<script>
$(document).ready(function(){
    $("#formBusca").validationEngine();
   });
</script>
</html>