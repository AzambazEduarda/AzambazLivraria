<%@page import="java.math.BigDecimal"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Livro obj = new Livro();
    LivroDAO dao = new LivroDAO();
    
    if (request.getParameter("txtNome") != "findFilter") {
        obj.setNome(request.getParameter("txtNome"));
        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
        obj.setDatapublicacao(request.getParameter("txtDataDaPublicacao"));
        obj.setCategoria((request.getParameter("txtCategoria")));
        obj.setEditora((request.getParameter("txtEditora")));
        obj.setImagem1(request.getParameter("txtImagem1"));
        obj.setImagem2(request.getParameter("txtImagem2"));
        obj.setImagem3(request.getParameter("txtImagem3"));
        
        Boolean resultado = dao.incluir(obj);
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
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
            Livros
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    <div class="form-group">
                        <label>Preco</label>
                        <input class="form-control" type="number"  name="txtPreco"  required />
                    </div>
                    <div class="form-group">
                        <label>Data da Publicacao</label>
                        <input class="form-control" type="number"  name="txtDataDaPublicacao"  required />
                    </div>
                      <div class="form-group">
                        <label>Categoria</label>
                        <input class="form-control" type="text"  name="txtCategoria"  required />
                    </div>
                     <div class="form-group">
                        <label>Editora</label>
                        <input class="form-control" type="text"  name="txtEditora"  required />
                    </div>
                     <div class="form-group">
                        <label>Imagem1</label>
                        <input class="form-control" type="text"  name="txtImagem1"  required />
                    </div>
                     <div class="form-group">
                        <label>Imagem2</label>
                        <input class="form-control" type="text"  name="txtImagem2"  required />
                    </div>
                     <div class="form-group">
                        <label>imagem3</label>
                        <input class="form-control" type="text"  name="txtImagem3"  required />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>