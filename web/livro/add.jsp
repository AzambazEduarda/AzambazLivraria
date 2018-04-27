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
    if (request.getMethod().equals("POST")) {
        //pego uma lista de autores(com mesmo name)
        String[] autoresid = request.getParameter("autores").split(";");////Sempre que for n p n o upd tem q ser assim
        //popular o livro
        Livro l = new Livro();
        l.setNome("StorTroopers - Uma viagem que nao sai");
        l.setDatapublicacao(new Date());
        l.setPreco(13.12f);
        
        //Autores
        List<Autor> listaautores = new ArrayList<>();
        for (String id : autoresid) {
            Integer idinteger = Integer.parseInt(id);
            listaautores.add(adao.buscarPorChavePrimaria(idinteger));
        }
        l.setAutorList(listaautores);

        LivroDAO dao = new LivroDAO();
        dao.incluir(l);

    }
    //pego meus autores
    List<Autor> autores = adao.listar();
////    if (request.getParameter("txtNome") != "findFilter") {
////        obj.setNome(request.getParameter("txtNome"));
////        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
//////        obj.setDatapublicacao(StormData.formata(Date data,String formata));
//////        obj.setCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
//////        obj.setEditora((request.getParameter("txtEditora")));
////        obj.setImagem1(request.getParameter("txtImagem1"));
////        obj.setImagem2(request.getParameter("txtImagem2"));
////        obj.setImagem3(request.getParameter("txtImagem3"));
////        obj.setSinopse(request.getParameter(""));
////        Boolean resultado = dao.incluir(obj);
////        dao.fecharConexao();
////        if (resultado) {
////            msg = "Registro cadastrado com sucesso";
////            classe = "alert-success";
////        } else {
////            msg = "N�o foi poss�vel cadastrar";
////            classe = "alert-danger";
////        }
////    } 
////    

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Meu Sistema, dois bjos
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o 
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

                <div class="col-lg-6">
                    <label>Autores</label>
                    <select name="autores" multiple>
                        <%for (Autor a : autores) {%>
                        <option value="<%=a.getId()%>"><%=a.getNome()%>
                        </option>
                        <%}%>
                    </select>
                </div>

                <div class="form-group">
                    <label>Autores com checkbox</label>

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
                    <input class="form-control" type="number"  name="txtCategoria"  required />
                </div>
                <div class="form-group">
                    <label>Editora</label>
                    <input class="form-control" type="text"  name="txtEditora"  required />
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