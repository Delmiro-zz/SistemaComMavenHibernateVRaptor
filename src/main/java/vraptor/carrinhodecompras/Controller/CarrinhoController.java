package vraptor.carrinhodecompras.Controller;

import vraptor.carrinhodecompras.dao.ProdutoDao;
import vraptor.carrinhodecompras.modelo.Carrinho;
import vraptor.carrinhodecompras.modelo.Item;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class CarrinhoController {
	
	private final Carrinho carrinho;
	private ProdutoDao dao;
	private Result result;
	
	public CarrinhoController(Carrinho carrinho, ProdutoDao dao, Result result){
		this.carrinho = carrinho;
		this.dao = dao;
		this.result = result;
	}
	
	@Post("/carrinho")
	public void adiciona(Item item){
		dao.recarrega(item.getProduto());
		carrinho.adiciona(item);
		result.redirectTo(this).visualiza();
	}
	
	@Get 
	@Path("/carrinho/novo")
	public void visualiza(){}
	
	@Delete("/carrinho/{indiceItem}")
	public void remove(int indiceItem){
		carrinho.remove(indiceItem);
		result.redirectTo(this).visualiza();
	}

}
