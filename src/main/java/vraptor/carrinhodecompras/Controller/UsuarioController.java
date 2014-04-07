package vraptor.carrinhodecompras.Controller;

import vraptor.carrinhodecompras.dao.UsuarioDao;
import vraptor.carrinhodecompras.infra.UsuarioLogado;
import vraptor.carrinhodecompras.modelo.Usuario;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

@Resource
public class UsuarioController {
	
	
	private final UsuarioDao dao;
	private final Result result;
	private final Validator validator;
	private final UsuarioLogado usuarioLogado;
	
	public UsuarioController(UsuarioDao dao, Result result, Validator validator, UsuarioLogado usuarioWeb){
		this.dao = dao;
		this.result = result;
		this.validator = validator;
		this.usuarioLogado = usuarioWeb;
	}
	
	public void novo(){}

	@Get("/login")
	public void loginForm(){}
	
	@Post("login")
	public void login(Usuario usuario) {
		Usuario carregado = dao.carrega(usuario);
		if (carregado == null) {
			validator.add(new ValidationMessage("Login e/ou senha inválidos",
					"usuario.login"));
		}
		validator.onErrorForwardTo(UsuarioController.class).loginForm();
		usuarioLogado.login(carregado);
		result.redirectTo(ProdutoController.class).lista();
	}
	@Path("/logout")
	public void logout(){
		usuarioLogado.logout();
		result.redirectTo(ProdutoController.class).lista();
	}
	
	
}
