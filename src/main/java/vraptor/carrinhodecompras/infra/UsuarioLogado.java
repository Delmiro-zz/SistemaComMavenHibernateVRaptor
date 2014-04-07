package vraptor.carrinhodecompras.infra;

import vraptor.carrinhodecompras.modelo.Usuario;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UsuarioLogado {
	
	private Usuario logado;
	
	public void login(Usuario usuario){
		this.logado = usuario;
	}
	
	public String getNome(){
		return logado.getNome();
	}
	
	public Boolean isLogado(){
		return logado != null;
	}
	
	public void logout(){
		this.logado = null;
	}
}
