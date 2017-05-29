<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="produtoForm"		
		action="<c:url value="/produtos/${produto.id}" />" 
		method="POST">
	<fieldset>
		<legend>Editar Produto</legend>
		
		<label for="nome">Nome: </label>
		<input id="nome" type="text"
				class="required"
				minlength="3" 
				name="produto.nome" 
				value="${produto.nome }" />
		
		<label for="descricao">Descrição: </label>
		<textarea id="descricao" type="text"
				class="required"
				maxlength="150"
				name="produto.descricao">${produto.descricao }
		</textarea>
				
		<label for="preco">Preço:</label>
		<input id="preco" type="text"
				class="required"
				min="0"
				name="produto.preco"
				value="${produto.preco }" />
				
		<button type="submit" name="_method" value="PUT">Enviar</button>
		
	</fieldset>
</form>

<script type="text/javascript">
	$("#produtoForm").validate();
</script>