package vraptor.carrinhodecompras.Controller;

import vraptor.carrinhodecompras.dao.ProdutoDao;
import vraptor.carrinhodecompras.modelo.Carrinho;
import vraptor.carrinhodecompras.modelo.Item;
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
		result.redirectTo(ProdutoController.class).lista();
	}
	
	
}
