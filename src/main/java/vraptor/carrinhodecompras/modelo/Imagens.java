package vraptor.carrinhodecompras.modelo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;
import org.apache.commons.io.IOUtils;
import java.io.FileOutputStream;
@Component
public class Imagens {

	
	private File pastaImagens;
	
	public Imagens(ServletContext context ){
		String caminhoImagem = context.getRealPath("/WEB-INF/imagens");
		pastaImagens = new File(caminhoImagem);
		pastaImagens.mkdir();
	}
	
	public void salva(UploadedFile imagem , Produto produto){
		File destino = new File(pastaImagens, produto.getId()+ "imagem");
		try{
			IOUtils.copy(imagem.getFile(), new FileOutputStream(destino));
		}catch(IOException e){
			throw new RuntimeException("Erro ao copiar imagem", e);
		}
	}
	
	public File mostra(Produto produto) {
		return new File(pastaImagens, produto.getId()+ "imagem");
	}
}
