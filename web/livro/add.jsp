
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
    EditoraDAO edao = new EditoraDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("txtNome") != null) {
            //pego uma lista de autores(com mesmo name)
            String[] autoresid = request.getParameter("autores").split(";");

            //popular o livro
            Livro l = new Livro();
            l.setNome(request.getParameter("txtNome"));
            l.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
            l.setDatapublicacao(StormData.formata(request.getParameter("txtDataPublicacao")));
            l.setSinopse(request.getParameter("txtSinopse"));
            if (request.getParameter("txtImg1") != null)
            {
                l.setImagem1(request.getParameter("txtImg1"));
            }
            if (request.getParameter("txtImg2") != null) 
            {
                l.setImagem2(request.getParameter("txtImg2"));
            }
            if (request.getParameter("txtImg3") != null) 
            {
                l.setImagem3(request.getParameter("txtImg3"));
            }

            //Autores
            List<Autor> listaautores = new ArrayList<>();
            for (String id : autoresid) {
                Integer idinteger = Integer.parseInt(id);
                listaautores.add(adao.buscarPorChavePrimaria(idinteger));
            }
            l.setAutorList(listaautores);

            Categoria c = new Categoria();
            c.setId(Integer.parseInt(request.getParameter("categorias")));
            l.setCategoria(c);

            Editora e = new Editora();
            e.setCnpj(request.getParameter("editoras"));
            l.setEditora(e);

            LivroDAO ldao = new LivroDAO();
            ldao.incluir(l);

            Boolean resultado = ldao.incluir(l);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-success";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
        }

    }
    //pego meus autores
    List<Autor> autores = adao.listar();
    List<Editora> editoras = edao.listar();
    List<Categoria> categorias = cdao.listar();
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
                    <%for (Autor a: autores ) {%>
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
                    <input class="form-control" type="date"  name="txtDataPublicacao"  required />
                </div>
                <div class="form-group">
                    <select name="txtCategoria" required />
                    
                    <label>Categoria</label>
                    <%for (Categoria c: categorias) {%>
                  
                    <option value="<%=c.getId()%>">
                        <%=c.getNome()%>
                    </option>

                    <%}%>   
                </select>
                </div>
                <div class="form-group">
                    <select name="txtEditora" required />
                    <label>Editora</label>
                    <%for (Editora e: editoras) {%>
                   
                    <option value="<%=e.getCnpj()%>">
                        <%=e.getNome()%>
                    </option>
                    

                    <%}%> 
                </select> 
                </div>
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
