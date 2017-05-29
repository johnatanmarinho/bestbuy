package br.com.johnatan.bestbuy.daos;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.johnatan.bestbuy.modelo.Produto;

@RequestScoped
public class ProdutoDao {
	
	@Inject
	private EntityManager manager;


	@SuppressWarnings("unchecked")
	public List<Produto> lista(){
		Query query = manager.createQuery("select p from Produto as p");
		return query.getResultList();
	}
	
	public Produto getById(Long id){
		return manager.find(Produto.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Produto> busca(String nome) {
		Query query = manager.createQuery("select p from Produto as p WHERE p.nome LIKE CONCAT('%', :buscaParam, '%')");
		query.setParameter("buscaParam", nome);
		return query.getResultList();
	}

	public void salva(Produto produto) {
		manager.persist(produto);
	}

	public void remove(Long id) {
		manager.remove(manager.find(Produto.class, id));
	}

	public void atualiza(Produto produto) {
		manager.merge(produto);
	}
	

}
