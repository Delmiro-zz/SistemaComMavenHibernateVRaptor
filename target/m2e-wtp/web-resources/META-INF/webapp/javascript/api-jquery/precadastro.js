$(document).ready(function(){
	$("#nascimento, #dataEmissaoIdentidade, #dataEmissaoCertidao, #dataEmissaoCarteiraTrabalho").mask("99/99/9999");
	$("#nascimento, #dataEmissaoIdentidade, #dataEmissaoCertidao, #dataEmissaoCarteiraTrabalho").datepicker({
				dateFormat:  "dd/mm/yy"
	});
	
	$("#cpf").mask("999.999.999-99", {placeholder:" "});
	$("#cartaoSus").mask("99?999999999",{placeholder:" "});
	$("#pis").mask("99?999999999",{placeholder:" "});
	$("#cartaoMunicipal").mask("99?999999999",{placeholder:" "});
	$("#numeroIdentidade").mask("99?999999999",{placeholder:" "});
	$("#cep").mask("99999-999",{placeholder:" "});
	$("#numeroTituloEleitor").mask("99?99999999999",{placeholder:" "});
	$("#secaoTituloEleitor").mask("9?999",{placeholder:" "});
	$("#zonaTituloEleitor").mask("9?99",{placeholder:" "});
	$("#numeroCarteiraTrabalho").mask("99?99999",{placeholder:" "});
	$("#serieCarteiraTrabalho").mask("9?9999",{placeholder:" "});
	$("#numero").mask("9?9999999", {placeholder:" "});
	
	$("#cpf").change(function(){
	        CPF = $(this).val();
	        if(!CPF){ return false;}
	        erro  = new String;
	        cpfv  = CPF;
	        if(cpfv.length == 14 || cpfv.length == 11){
	            cpfv = cpfv.replace('.', '');
	            cpfv = cpfv.replace('.', '');
	            cpfv = cpfv.replace('-', '');
	  
	            var nonNumbers = /\D/;
	    
	            if(nonNumbers.test(cpfv)){
	                erro = "A verificacao de CPF suporta apenas números!";
	            }else{
	                if (cpfv == "00000000000" ||
	                    cpfv == "11111111111" ||
	                    cpfv == "22222222222" ||
	                    cpfv == "33333333333" ||
	                    cpfv == "44444444444" ||
	                    cpfv == "55555555555" ||
	                    cpfv == "66666666666" ||
	                    cpfv == "77777777777" ||
	                    cpfv == "88888888888" ||
	                    cpfv == "99999999999") {
	                            
	                    erro = "Número de CPF inválido!"
	                }
	                var a = [];
	                var b = new Number;
	                var c = 11;
	  
	                for(i=0; i<11; i++){
	                    a[i] = cpfv.charAt(i);
	                    if (i < 9) b += (a[i] * --c);
	                }
	                if((x = b % 11) < 2){
	                    a[9] = 0
	                }else{
	                    a[9] = 11-x
	                }
	                b = 0;
	                c = 11;
	                for (y=0; y<10; y++) b += (a[y] * c--);
	    
	                if((x = b % 11) < 2){
	                    a[10] = 0;
	                }else{
	                    a[10] = 11-x;
	                }
	                if((cpfv.charAt(9) != a[9]) || (cpfv.charAt(10) != a[10])){
	                    erro = "Número de CPF inválido.";
	                }
	            }
	        }else{
	            if(cpfv.length == 0){
	                return false;
	            }else{
	                erro = "Número de CPF inválido.";
	            }
	        }
	        if (erro.length > 0){
	            $(this).val('');
	            alert(erro);
	            setTimeout(function(){$(this).focus();},100);
	            return false;
	        }
	        return $(this);
		
	});
	
	$("#numeroCelular, #numeroComercial, #numeroResidencial").mask("(99) 9999-9999",{placeholder:" "});
	$("#cep").change(function(){
		var cep = $("#cep").val().replace('-', '');
		var spinner = $("#enderecoDiv");
		spinner.show().spin(spinOptions);
			$.ajax({
				dataType : 'json',
				type : "GET",
				data : {
					"cep" : cep
				},
				url :  $(".configuracao.endereco").text().trim(),
				success : function(retorno) {
					if (typeof (retorno.endereco) == 'undefined') {
						adicionarMensagem(retorno.message);
					} else {
						adicionarEndereco(retorno);
					}
					spinner.spin(false);
				},
				error : function(jqXHR,
								 textStatus,
								 errorThrown) {
					spinner.spin(false);
					console.log(errorThrown);
				}
			});
			
			function adicionarMensagem(mensagem) {
				$("#enderecoLabel").html(mensagem);
				$("#cep").val("");
				$("#logradouro").val("");
				$("#complemento").val("");
				$("#numero").val("");
				$("#bairro").val("");
				$("#cidade").val("");
				$("#uf option[value='']").attr('selected','selected');
//				updateSelectSizeReload();
			}
			
			function adicionarEndereco(enderecoRetornado) {
				$("#enderecoLabel").html('');
				$("#logradouro").val(enderecoRetornado.endereco.logradouro);
				$("#complemento").val(enderecoRetornado.endereco.complemento);
				$("#bairro").val(enderecoRetornado.endereco.bairro);
				$("#cidade").val(enderecoRetornado.endereco.municipio.descricao);
				$('#ufEndereco option[value='+enderecoRetornado.endereco.uf.id+']').attr('selected','selected');
				$('#numero').focus();
//				updateSelectSizeReload();
			}
			
		});
	
	$("#descricaoNaturalidade").autocomplete({
		source: function(request, response){
			searchAutoCompleteNomeNaturalidade(request, response);
		},
		minLength: 3,
		select: function(event, ui){
			$("#descricaoNaturalidade").val(ui.item.descricao);
			$("#codigoNaturalidade").val(ui.item.id);
		}
	});
	
	function searchAutoCompleteNomeNaturalidade(request, response) {
		
		var nome = $("#descricaoNaturalidade").val();
		
		$.ajax({
			dataType: 'json',
			type: "GET",
			data : {"municipio.descricao": nome},
			url : $(".configuracao.municipios").text().trim(),
			success : function(retorno) {
				response( $.map( retorno.municipios, function( item ) {
					return {
						label: item.descricao,
						value: item.descricao,
						id: item.id
					};
				}));
			}
		});
	}
	
	$("#descricaoNacionalidade").autocomplete({
		source: function(request, response){
			searchAutoCompletePais(request, response);
		},
		minLength: 3,
		select: function(event, ui){
			$("#descricaoNacionalidade").val(ui.item.descricao);
			$("#codigoNacionalidade").val(ui.item.id);
		}
	});
	
	function searchAutoCompletePais(request, response) {
		
		var nome = $("#descricaoNacionalidade").val();
		
		$.ajax({
			dataType: 'json',
			type: "GET",
			data : {"pais.descricao": nome},
			url : $(".configuracao.paises").text().trim(),
			success : function(retorno) {
				response( $.map( retorno.paises, function( item ) {
					return {
						label: item.descricao,
						value: item.descricao,
						id: item.id
					};
				}));
			}
		});
	}
	
	$("#descricaoOcupacao").autocomplete({
		source: function(request, response){
			searchAutoCompleteOcupacao(request, response);
		},
		minLength: 3,
		select: function(event, ui){
			$("#descricaoOcupacao").val(ui.item.descricao);
			$("#codigoOcupacao").val(ui.item.id);
		}
	});
	function searchAutoCompleteOcupacao(request, response) {
		
		var nome = $("#descricaoOcupacao").val();
		
		$.ajax({
			dataType: 'json',
			type: "GET",
			data : {"ocupacao.descricao": nome},
			url : $(".configuracao.ocupacoes").text().trim(),
			success : function(retorno) {
				response( $.map( retorno.ocupacoes, function( item ) {
					return {
						label: item.descricao,
						value: item.descricao,
						id: item.id
					};
				}));
			}
		});
	}
	
	$("#descricaoAtividade").autocomplete({
		source: function(request, response){
			searchAutoCompleteAtividade(request, response);
		},
		minLength: 3,
		select: function(event, ui){
			$("#descricaoAtividade").val(ui.item.descricao);
			$("#codigoAtividade").val(ui.item.id);
		}
	});
	function searchAutoCompleteAtividade(request, response) {
		
		var nome = $("#descricaoAtividade").val();
		
		$.ajax({
			dataType: 'json',
			type: "GET",
			data : {"atividadeEconomica.descricao": nome},
			url : $(".configuracao.atividadesEconomicas").text().trim(),
			success : function(retorno) {
				response( $.map( retorno.atividadesEconomicas, function( item ) {
					return {
						label: item.descricao,
						value: item.descricao,
						id: item.id
					};
				}));
			}
		});
	}
	
	$("#cidade").autocomplete({
		source: function(request, response){
			searchAutoCompleteNomeMunicipio(request, response);
		},
		minLength: 3,
		select: function(event, ui){
			$("#cidade").val(ui.item.descricao);
			$("#idMunicipio").val(ui.item.id);
			$('#ufEndereco option[value='+ ui.item.idUf+']').attr('selected','selected');
//			updateSelectSizeReload();
		}
	});
	
	function searchAutoCompleteNomeMunicipio(request, response) {
		
		var nome = $("#cidade").val();
		var uf; 
		$.ajax({
			dataType: 'json',
			type: "GET",
			data : {"municipio.descricao": nome},
			url : $(".configuracao.municipios").text().trim(),
			success : function(retorno) {
				response( $.map( retorno.municipios, function( item ) {
					return {
						label: item.descricao,
						value: item.descricao,
						id: item.id,
						idUf: item.uf.id
					};
				}));
			}
		});
	}
	
	$(".alert-message>.close").click(function(){
		var parent = $(this).parent();

		removerNotificacao = function(){
			parent.remove();
		}

		parent.hide("blind", "slow", removerNotificacao);
	});
	
	
	$('#btnSalvar').click(function(){
		var cep = $('#cep').val().replace('-', '');
		 $('#cep').val(cep);
		 $('#form').submit();
	});
});