package br.com.johnatan.bestbuy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.google.gson.JsonArray;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.johnatan.bestbuy.daos.ProdutoDao;
import br.com.johnatan.bestbuy.modelo.Produto;

@Controller
public class ProdutoController {

	private ProdutoDao dao;
	private Validator validator;
	private Result result;
	
	protected ProdutoController(){
		this(null, null, null);
	}
	
	@Inject
	public ProdutoController( ProdutoDao dao, Result result, Validator validator){
		this.dao = dao;
		this.result = result;
		this.validator = validator;
	}
	
	@Get("/produtos")
	public List<Produto> lista(){
		return dao.lista();
	}
	
	@Get("/produtos/busca")
	public List<Produto> busca(String nome){
		result.include("nome", nome);
		return dao.busca(nome);
	}
	
	@Get("/produtos/busca.json")
	public void buscaJson(String q){
		result.use(Results.json()).withoutRoot()
			.from(dao.busca(q))
			.exclude("id", "descricao")
			.serialize();
	}
	
	@Get("/produtos/novo")
	public void formulario(){
		
	}
	
	@Post("/produtos")
	public void adiciona(@NotNull @Valid Produto produto){
		validator.onErrorForwardTo(HomeController.class).index();
		dao.salva(produto);
		result.redirectTo(HomeController.class).index();
	}
	
	@Get("/produtos/{id}")
	public Produto edita(Long id){
		return dao.getById(id);
	}
	
	@Put("/produtos/{produto.id}")
	public void altera(@NotNull @Valid Produto produto){
		validator.onErrorRedirectTo(HomeController.class).index();
		
		dao.atualiza(produto);
		result.redirectTo(HomeController.class).index();
	}
	
	@Delete("/produtos/{id}")
	public void remove(Long id){
		dao.remove(id);
		result.nothing();
	}
	
}
