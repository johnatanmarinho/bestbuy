<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<tr id="produto_${produto.id }">
				<td>${produto.nome }</td>
				<td>${produto.descricao }</td>
				<td>${produto.preco }</td>
				<td><a href="#" onclick="altera(${produto.id})">Alterar</a></td>
				<td><a href="#" onclick="apaga(${produto.id})">Remover</a></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
