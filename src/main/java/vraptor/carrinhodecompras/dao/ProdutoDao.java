package vraptor.carrinhodecompras.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import vraptor.carrinhodecompras.modelo.Produto;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ProdutoDao {
	
	private final Session session;
	
	public ProdutoDao(Session session){
		this.session = session;
	}
	
	public void salva(Produto produto) {
		Transaction transaction = session.beginTransaction();
		session.save(produto);
		transaction.commit();
	}

	public void remove(Produto produto) {
		Transaction transaction = session.beginTransaction();
		session.delete(produto);
		transaction.commit();
	}

	public void atualiza(Produto produto) {
		Transaction transaction = session.beginTransaction();
		session.update(produto);
		transaction.commit();
	}
	
	public List<Produto> listaProduto(){
		return this.session.createCriteria(Produto.class).list();
	}
	
	public Produto carrega(Long id){
		return (Produto) this.session.load(Produto.class, id);
	}
	
}	
