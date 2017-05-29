package br.com.johnatan.bestbuy.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Produto {

	@Id @GeneratedValue
	private Long id;
	
	@NotNull @Size(min=3, max=10)
	private String nome;
	
	@Size(max=155)
	private String descricao;
	
	@Min(0)
	private Long preco;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Long getPreco() {
		return preco;
	}
	public void setPreco(Long preco) {
		this.preco = preco;
	}
	
	
	
}
