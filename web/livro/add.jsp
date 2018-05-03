
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="dao.AutorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Autor"%>
<%@page import="util.StormData"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    AutorDAO adao = new AutorDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    EditoraDAO edao = new EditoraDAO();

    if (request.getMethod().equals("POST")) {
        //pego uma lista de autores(com mesmo name)
        String[] autoresid = request.getParameter("autores").split(";");////Sempre que for n p n o upd tem q ser assim
        String[] categoriasid = request.getParameter("categoria").split(";");
        String[] editorasid = request.getParameter("editora").split(";");
        //LIVRO
        Livro l = new Livro();
        l.setNome("StormTroopers - Uma viagem que nao sai");
        l.setDatapublicacao(new Date());
        l.setPreco(13.12f);
        //Autores
        List<Autor> listaautores = new ArrayList<>();
        for (String id : autoresid) {
            Integer idinteger = Integer.parseInt(id);
            listaautores.add(adao.buscarPorChavePrimaria(idinteger));
        }
        l.setAutorList(listaautores);

        //CATEGORIA
        List<Categoria> listacategorias = new ArrayList<>();
        for (String id : categoriasid) {
            Integer idinteger = Integer.parseInt(id);
            listacategorias.add(cdao.buscarPorChavePrimaria(idinteger));
        }
        l.setCategoriaList(listacategorias);
        
        ///EDITORA
        List<Editora> listaeditoras = new ArrayList<>();
        for (String id : editorasid){
            Integer idinteger = Integer.parseInt(id);
            listaeditoras.add(edao.buscarPorChavePrimaria(idinteger));
        }
        l.setEditoraList(listaeditoras);
            
        LivroDAO dao = new LivroDAO();
        dao.incluir(l);
    }
    //pego meus autores
    List<Autor> autores = adao.listar();
    List<Categoria> categorias = cdao.listar();
    List<Editora> editoras = edao.listar();

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Meu Sistema, dois bjos
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
            <form action="../UploadWS" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label>Autores</label>
                    <%for (Autor a : autores) {%>
                    <input type="checkbox" name="autoreschk" value="<%=a.getId()%>"><%=a.getNome()%>

                    <%}%>
                    </select>
                </div>
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
                    <%for (Categoria c : categorias) {%>
                    <input type="checkbox" name="autoreschk" value="<%=c.getId()%>"><%=c.getNome()%>

                    <%}%>                </div>
                <div class="form-group">
                    <label>Editora</label>
                    <%for (Editora e : editoras) {%>
                    <input type="checkbox" name="autoreschk" value="<%=e.getCnpj()%>"><%=e.getNome()%>

                    <%}%>                 </div>
                <div class="form-group">
                    <label>Imagem1</label>
                    <input type="file"  name="txtImagem1"  />
                </div>
                <div class="form-group">
                    <label>Imagem2</label>
                    <input type="file"  name="txtImagem2"  />
                </div>
                <div class="form-group">
                    <label>imagem3</label>
                    <input type="file"  name="txtImagem3"  />
                </div>
                <div class="form-group">
                    <label>Sinopse</label>
                    <input class="form-control" type="text"  name="txtSinopse"  required />
                </div>
                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>