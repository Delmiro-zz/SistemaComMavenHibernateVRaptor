package vraptor.carrinhodecompras.Controller;

import java.util.List;

import vraptor.carrinhodecompras.dao.ProdutoDao;
import vraptor.carrinhodecompras.modelo.Produto;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.Validations;

@Resource
public class ProdutoController {

	private final ProdutoDao dao;
	private final Result result;
	private final Validator validator;

	public ProdutoController(ProdutoDao dao, Result result, Validator validator) {
		this.dao = dao;
		this.result = result;
		this.validator = validator;
	}
	@Get("/produtos")
	public List<Produto> lista() {
		return dao.listaProduto();
	}
	@Get("/produtos/novo")
	public void formulario() {
	}
	@Get("/produtos/{id}")
	public Produto edita(Long id) {
		return dao.carrega(id);
	}
	@Put("/produtos/{produto.id}")
	public void altera(Produto produto) {
		dao.atualiza(produto);
		result.redirectTo(this).lista();
	}
	@Delete("/produtos/{id}")
	public void remove(Long id) {
		Produto produto = dao.carrega(id);
		dao.remove(produto);
		result.redirectTo(this).lista();
	}
	@Post("/produtos")
	public void adiciona(final Produto produto) {
		validator.checking(new Validations() {
			{
				that(produto.getNome() != null
						&& produto.getNome().length() >= 3, "Atencao",
						"nome.obrigatorio");
				that(produto.getDescricao() != null
						&& produto.getDescricao().length() <= 40
						&& produto.getDescricao().length() >= 4, "Atencao",
						"descricao.obrigatorio");
				that(produto.getPreco() != null, "Atencao", "preco.obrigatorio");

			}
		});

		validator.onErrorUsePageOf(ProdutoController.class).formulario();
		dao.salva(produto);
		result.redirectTo(this).lista();
	}
	
	public List<Produto> busca(String nome){
		result.include("nome", nome);
		return dao.busca(nome);
	}
	
}
