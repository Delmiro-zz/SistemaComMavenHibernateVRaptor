package vraptor.carrinhodecompras.Controller;

import java.io.File;

import org.hibernate.validator.cfg.defs.NotNullDef;

import vraptor.carrinhodecompras.modelo.Imagens;
import vraptor.carrinhodecompras.modelo.Produto;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.Validations;
import static org.hamcrest.Matchers.*;

@Resource
public class ImagensController {
	
	private Validator validator;
	private Result result;
	private Imagens imagens;
	
	public ImagensController(Validator validator, Result result, Imagens imagens){
		this.validator = validator;
		this.imagens= imagens;
		this.result = result;
	}
	
	
	@Post("/produtos/{produto.id}/imagem")
	public void upload(Produto produto , final UploadedFile imagem){
		validator.checking(new Validations(){{
			if(that(imagem, is(notNullValue()), "imagem", "imagem.nula")){
			that(imagem.getContentType(), startsWith("imagem"), "imagem", "nao.e.imagem");
			}
		}});
		validator.onErrorForwardTo(ProdutoController.class).edita(produto.getId());
		imagens.salva(imagem, produto);
		result.redirectTo(ProdutoController.class).edita(produto.getId());
	}
	
	@Get("/produtos/{produto.id}/imagem")
	public File download(Produto produto){
		return imagens.mostra(produto);
	}
	
	
}
