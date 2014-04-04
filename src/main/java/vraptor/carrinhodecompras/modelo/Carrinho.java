package vraptor.carrinhodecompras.modelo;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class Carrinho {
	
	private List<Item> itens = new ArrayList<Item>();
	
	private Double total = 0.0;
	
	
	public void adiciona(Item item){
		itens.add(item);
		total += total + item.getProduto().getPreco() * item.getQuantidade();
	}
	
	public List<Item> getItens() {
		return itens;
	}

	public void setItens(List<Item> itens) {
		this.itens = itens;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
}
