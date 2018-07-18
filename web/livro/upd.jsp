
<%@page import="dao.EditoraDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.AutorDAO"%>
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
    String msg = "";
    String classe = "";
    LivroDAO dao = new LivroDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    AutorDAO adao = new AutorDAO();
    EditoraDAO edao = new EditoraDAO();
    
    
    Livro obj = new Livro();

    
    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {
      

    } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }

    List<Autor> autores = adao.listar();
    List<Editora> editoras = edao.listar();
    List<Categoria> categorias = cdao.listar();
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
                        <input class="form-control" type="text" name="txtAutor" required value="<%=obj.getAutorlist() %>" />
                    </div>
                    
                     <div class="form-group">
                        <label>Categoria</label>
                        <select name="selCategoria" class="form-control">
                            <option>Selecione</option>
                            
                        <%
                         String selecionado;
                         for(Categoria c:categorias){
                             
                            if(obj.getCategoria().getId()==c.getId()){
                                selecionado="selected";
                            }
                            else{
                                selecionado="";
                            }
                        %>
                        <option value="<%=c.getId()%>" <%=selecionado%>>
                            
                            
                        <%=c.getNome()%>
                        </option>
                        <%}%>
                        </select>
                    </div>

                       <div class="form-group">
                        <label>Editora</label>
                        <input class="form-control" type="text" name="txtEditora" required value="<%=obj.getEditora()%>" />
                    </div>
                       <div class="form-group">
                        <label>Imagem1</label>
                        <input class="form-control" type="file" name="imagem1" id="arquivo1"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getImagem1()%>" id="img1"/>
                       </div>         
                       <div class="form-group">
                        <label>Imagem2</label>
                        <input class="form-control" type="file" name="imagem2" id="arquivo1"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getImagem2()%>" id="img2"/>
                    </div>
                       <div class="form-group">
                        <label>Imagem3</label>
                       <input class="form-control" type="file" name="iamgem3" id="arquivo1"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getImagem3()%>" id="img3"/>
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