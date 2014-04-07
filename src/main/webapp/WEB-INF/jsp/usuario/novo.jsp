<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form id="usuariosForm" action="<c:url value="/usuarios"/>" method="post" >
		<fieldset>
			<legend>Criar novo usuário</legend>
			<label for="nome">Nome:</label> 
			<input id="nome" class="required"type="text" name="usuario.nome" value="${usuario.nome }" />
			 <label for="login">Login:</label> 
			 <input id="login" class="required" type="text" name="usuario.login" value="${usuario.login }" /> 
			 <label for="senha">Senha:</label> 
			 <input id="senha" class="required" type="password" name="usuario.senha" /> 
			 <label for="confirmacao">Confirmea senha:</label> 
			 <input id="confirmacao" equalTo="#senha" type="password" />
			<button type="submit">Enviar</button>
		</fieldset>
		<div id="usuario">
			<c:if test="${usuarioWeb.logado}">
				Olá, ${usuarioWeb.nome }!
			<a href="<c:url value="/logout"/>">Logout</a>
			</c:if>
			<c:if test="${empty usuarioWeb or not usuarioWeb.logado}">
				Você não está logado.
			<a href="<c:url value="/login"/>">Login</a>
				<a href="<c:url value="/usuarios/novo"/>">Cadastre-se</a>
			</c:if>
		</div>
	</form>
</body>
<script type="text/javascript">
		$('#usuariosForm').validate();
	</script>
</html>