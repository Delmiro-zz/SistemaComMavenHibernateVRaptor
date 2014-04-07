package vraptor.carrinhodecompras.infra;

import vraptor.carrinhodecompras.Controller.UsuarioController;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class AutenticacaoInterceptor implements Interceptor{
	
	private final UsuarioLogado usuario;
	private final Result result;
	
	public AutenticacaoInterceptor (UsuarioLogado usuario, Result result){
		this.usuario = usuario;
		this.result = result;
	}
	
	public boolean accepts(ResourceMethod method) {
		return !this.usuario.isLogado() && method.containsAnnotation(Restrito.class);
	}

	public void intercept(InterceptorStack arg0, ResourceMethod arg1,
			Object arg2) throws InterceptionException {
		result.redirectTo(UsuarioController.class).loginForm();
	}
	
	
}
