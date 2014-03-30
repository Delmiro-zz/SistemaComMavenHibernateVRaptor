package vraptor.carrinhodecompras.Controller;

import java.util.List;

import vraptor.carrinhodecompras.dao.ProdutoDao;
import vraptor.carrinhodecompras.modelo.Produto;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ProdutoController {

	private final ProdutoDao dao;
	private final Result result;
	
	public ProdutoController(ProdutoDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	public List<Produto> lista() {
		return dao.listaProduto();
	}
	
	public void formulario(){}

	
	public void adiciona(Produto produto){
		dao.salva(produto);
		result.redirectTo(this).lista();
		result.include("adicionado", "Produto adicionado com sucesso");
	}
	
	public Produto edita(Long id){
		return dao.carrega(id);
	}
	
	public void altera(Produto produto){
		dao.atualiza(produto);
		result.redirectTo(this).lista();
	}
	
	public void remove(Long id){
		Produto produto = dao.carrega(id);
		dao.remove(produto);
		result.redirectTo(this).lista();
	}
}
