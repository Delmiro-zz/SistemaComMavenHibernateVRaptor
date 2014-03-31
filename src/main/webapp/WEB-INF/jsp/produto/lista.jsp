<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Produtos</title>
</head>
<body>
<a href="<c:url value="/produtos/novo"/>">Novo Produto</a>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Preço</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${produtoList}" var="produto">
				<tr>
					<td>${produto.nome }</td>
					<td>${produto.descricao }</td>
					<td>${produto.preco }</td>
					<td><a href="<c:url value="/produtos/${produto.id}"/>">Editar</a></td>
					<td>
						<form action="<c:url value="/produtos/${produto.id}"/>"
							method="POST">
							<button class="link" name="_method" value="DELETE">Remover</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>