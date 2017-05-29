<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="produtoForm"
		action="<c:url value="/produtos"/>" 
		method="POST">
	<fieldset>
		<legend>Adicionar Produto</legend>
		
		<label for="nome">Nome:</label>
		<input id="nome" 
				class="required"
				minlength="3"
				type="text" 
				name="produto.nome"/>
		
		<label for="descricao">Descrição:</label>
		<input id="descricao"
				class="required"
				maxlength="150" 
				type="text" 
				name="produto.descricao"/>
		
		<label for="preco">Preço:</label>
		<input id="preco" 
				class="required"
				min="0"
				type="text" 
				name="produto.preco"/>
		
		<button type="submit">Enviar</button>
	</fieldset>
</form>

<script type="text/javascript">
	$("#produtoForm").validate();
</script>