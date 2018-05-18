
<%@page import="modelo.Categoria"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Autor"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    LivroDAO dao = new LivroDAO();
    Livro obj = new Livro();
    
    Categoria c = new Categoria();
    Editora e = new Editora();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
            obj.setNome(request.getParameter("txtNome"));
            obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
            obj.setDatapublicacao(StormData.formata(request.getParameter("txtDataPublicacao")));
            obj.setSinopse(request.getParameter("txtSinopse"));
            c.setId(Integer.parseInt(request.getParameter("txtCategoria")));
            e.setCnpj(request.getParameter("txtEditora"));
            obj.setCategoria(c);
            obj.setEditora(e);
            obj.setImagem1(request.getParameter("txtImagem1"));
            obj.setImagem2(request.getParameter("txtImagem2"));
            obj.setImagem3(request.getParameter("txtImagem3"));
        
        
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new LivroDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livro
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getId()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                    </div>
                    <div class="form-group">
                        <label>Preco</label>
                        <input class="form-control" type="number" name="txtPreco" required value="<%=obj.getPreco()%>" />
                    </div>
                    <div class="form-group">
                        <label>Data da Publicacao</label>
                        <input class="form-control" type="date" name="txtDataDaPublicacao" required value="<%=obj.getDatapublicacao()%>" />
                    </div>
                     <div class="form-group">
                        <label>Autor</label>
                        <input class="form-control" type="text" name="txtAutor" required value="<%=obj.getAutorList() %>" />
                    </div>
                       <div class="form-group">
                        <label>Categoria</label>
                        <input class="form-control" type="number" name="txtCategoria" required value="<%=obj.getCategoria()%>" />
                    </div>
                       <div class="form-group">
                        <label>Editora</label>
                        <input class="form-control" type="text" name="txtEditora" required value="<%=obj.getEditora()%>" />
                    </div>
                       <div class="form-group">
                        <label>Imagem1</label>
                        <input class="form-control" type="text" name="txtFoto" required value="<%=obj.getImagem1()%>" />
                       </div>         
                       <div class="form-group">
                        <label>Imagem2</label>
                        <input class="form-control" type="text" name="txtImagem2" required value="<%=obj.getImagem2()%>" />
                    </div>
                       <div class="form-group">
                        <label>Imagem3</label>
                        <input class="form-control" type="text" name="txtImagem3" required value="<%=obj.getImagem3()%>" />
                    </div>
                     </div>
                       <div class="form-group">
                        <label>Sinopse</label>
                        <input class="form-control" type="text" name="txtSinopse" required value="<%=obj.getSinopse()%>" />
                    </div>


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>