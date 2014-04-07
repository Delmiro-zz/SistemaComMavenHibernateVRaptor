<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrinho</title>
</head>
<body>
	<form action="<c:url value="/produtos/novo"/>">
		<button style="width: 190px; height: 25px" type="submit">Tela
			de Cadastro</button>
	</form>
	<form action="<c:url value="/produtos"/>">
		<button style="width: 190px; height: 25px" type="submit">Lista
			de Produtos</button>
	</form>
	<h3>Itens do seu carrinho de compras</h3>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Descrição</th>
				<th>Preço</th>
				<th>Qtde</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${carrinho.itens}" var="item" varStatus="s">
				<tr>
					<td>${item.produto.nome }</td>
					<td>${item.produto.descricao }</td>
					<td><fmt:formatNumber type="currency" value="${item.produto.preco }" /></td>
					<td>${item.quantidade }</td>
					<td><fmt:formatNumber type="currency" value="${item.quantidade * item.produto.preco }" /></td>
					<td>
						<form action="<c:url value="/carrinho/${s.index}"/>" method="post">
						<button class="link" name="_method" value="DELETE">Remover</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2"></td>
				<th colspan="2">Total:</th>
				<th><fmt:formatNumber type="currency" value="${carrinho.total }" /></th>
			</tr>
		</tfoot>
	</table>
</body>
</html>