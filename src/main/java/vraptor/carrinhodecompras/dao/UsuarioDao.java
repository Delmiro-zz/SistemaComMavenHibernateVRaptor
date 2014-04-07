package vraptor.carrinhodecompras.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import vraptor.carrinhodecompras.modelo.Usuario;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class UsuarioDao {
	
	private Session session;
	
	public UsuarioDao(Session session){
		this.session = session;
	}
	
	public Boolean existeUsuario(Usuario usuario) {
		Usuario usuarioEncontrado = (Usuario) session
				.createCriteria(Usuario.class)
				.add(Restrictions.eq("login", usuario.getLogin()))
				.uniqueResult();
		return usuarioEncontrado != null;
	}
	
	
	public void adiciona(Usuario usuario){
		Transaction transaction = this.session.beginTransaction();
		this.session.save(usuario);
		transaction.commit();
	}

	public Usuario carrega(Usuario usuario) {
		return (Usuario) session.createCriteria(Usuario.class).
				add(Restrictions.eq("login", usuario.getLogin())).
				add(Restrictions.eq("senha", usuario.getSenha())).uniqueResult();
	}
	
}
