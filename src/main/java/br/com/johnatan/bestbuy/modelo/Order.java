package br.com.johnatan.bestbuy.modelo;

import java.util.Collection;

import javax.persistence.ElementCollection;

public class Order {

	private Long id;
	
	@ElementCollection
	private Collection<OrderDetail> details;
	
	
}
