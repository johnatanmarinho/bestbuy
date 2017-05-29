<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>Good Buy</title>
		<link href="<c:url value="/goodbuy.css"/>" rel="stylesheet" type="text/css" media="screen" />
		<link href="<c:url value="/javascripts/jquery.autocomplete.css"/>" rel="stylesheet" type="text/css" media="screen" />
		<script type="text/javascript" src="<c:url value="/javascripts/jquery-1.3.2.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/javascripts/jquery.validate.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/javascripts/jquery.autocomplete.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/javascripts/jquery.puts.js"/>"></script>
		<fmt:setLocale value="pt_br"/>
	</head>
	
	
<body>

	<script type="text/javascript">
		function lista(){
			$.get("<c:url value="/produtos"/>", function (result){
				$("#content").html(result);
				
			});
		}
		
		function adiciona(){
			$.get("<c:url value="/produtos/novo"/>", function (result){
				$("#content").html(result);
			});
		}

		function altera(id){
			$.get("<c:url value="/produtos/"/>"+id, function(result){
				$("#content").html(result);
			});
		}
		function remove(id, callback){
			$.ajax({
				type: "DELETE",
				url: "<c:url value="/phttps://download3.vmware.com/software/player/file/VMware-Player-12.5.5-5234757.x86_64.bundle?HashKey=9dab69c47504765c6d7fd58f294108b9&params=%7B%22sourcefilesize%22%3A%22128.03+MB%22%2C%22dlgcode%22%3A%22PLAYER-1255%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22N%22%2C%22downloaduuid%22%3A%225d2e48d6-5667-447e-802c-88b6dbf35e5e%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%2212.5.5%22%2C%22productfamily%22%3A%22VMware+Workstation+Player%22%7D&AuthKey=1495110427_7a669965e34b0f3316e985fb1a264b0dhttps://download3.vmware.com/software/player/file/VMware-Player-12.5.5-5234757.x86_64.bundle?HashKey=9dab69c47504765c6d7fd58f294108b9&params=%7B%22sourcefilesize%22%3A%22128.03+MB%22%2C%22dlgcode%22%3A%22PLAYER-1255%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22N%22%2C%22downloaduuid%22%3A%225d2e48d6-5667-447e-802c-88b6dbf35e5e%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%2212.5.5%22%2C%22productfamily%22%3A%22VMware+Workstation+Player%22%7D&AuthKey=1495110427_7a669965e34b0f3316e985fb1a264b0drodutos/"/>"+id,
				success: callback
			});
		}
		
		function apaga(id){
			$.ajax({
				url: "<c:url value="/produtos/"/>"+id,
				type: "DELETE",
				success: function(result){
					$("#produto_"+id).remove();
				}
			});
		}
		
		$( document ).ready(function(){
			$("#search").submit(function(event){
				event.preventDefault();
				$.get("<c:url value="/produtos/busca"/>", $("form#search").serialize(),function(result){
					$("#content").html(result);
				});
			});
			
				
			$("#searchInput").autocomplete("<c:url value="/produtos/busca.json"/>", {
				dataType: "json",
				parse: function(produtos){
					return $.map(produtos, function(produto){
						return {
							data: produto,
							value: produto.nome,
							result: produto.nome
						};
					});
				},
				formatItem: function(produto){
					return produto.nome + "(" + produto.preco + ")";
				}
			});
		
		});
		
		
	</script>
	<div id="header">
		
	</div>
	<div id="erros">
		<ul>
			<c:forEach var="error" items="${errors}">
			    <li>${error.category} - ${error.message}</li>
			</c:forEach>

		</ul>
	</div>
	
	
	<div id="body">
		<div id="menu">
			<ul>
				<li><a href="#header" onclick="adiciona()" >Adiciona Produto</a></li>
				<li><a href="#" onclick="lista()" >Lista Produtos</a></li>
				<li>
					<form id="search" action="<c:url value="/produtos/busca"/>">
						<input type="text" 
								id="searchInput"
								name="nome" 
								placeholder="busca por nome"/>
					</form>
				</li>
				<!--  <li><a href="<c:url value="/produtos"/>">Lista Produtos</a></li>  -->
			</ul>
		</div>
		<div id="content">
		<div id="teste"></div>
		

		</div><!-- div content -->
	</div><!-- div body -->
	<div id="footer">
	
	</div>

</body>
</html>