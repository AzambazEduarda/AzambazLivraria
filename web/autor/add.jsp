
<%@page import="modelo.Livro"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    /////////FAZER ISSO NA PROXIMA AULA
    String msg = "";
    String classe = "";
    AutorDAO adao = new AutorDAO();
    if (request.getMethod().equals("POST")) {
        //pego uma lista de autores(com mesmo name)
        String[] autoresid = request.getParameterValues("autores");
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
    
//    String msg = "";
//    String classe = "";
//    Autor obj = new Autor();
//    AutorDAO dao = new AutorDAO();
//
//    if (request.getParameter("txtNome") != null) {
//        obj.setNome(request.getParameter("txtNome"));
//        obj.setNacionalidade(request.getParameter("txtNacionalidade"));
//        obj.setSexo(request.getParameter("txtSexo").charAt(0));
//        obj.setFoto(request.getParameter("txtFoto"));
//
//        Boolean resultado = dao.incluir(obj);
//        dao.fecharConexao();
//        if (resultado) {
//            msg = "Registro cadastrado com sucesso";
//            classe = "alert-success";
//        } else {
//            msg = "Não foi possível cadastrar";
//            classe = "alert-danger";
//        }
//    }


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
            Autors
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">
                    
                    <label>Livros</label>
                    <select name="livros" multiple>
                        <%for (Livro l : livros) {%>
                        <option value="<%=l.getId()%>"><%=l.getNome()%>
                        </option>
                        <%}%>
                    </select>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    <div class="form-group">
                        <label>Foto</label>
                        <input class="form-control" type="file"  name="Foto"  required />
                    </div>
                    <div class="form-group">
                        <label>Sexo</label>
                        <select >

                            <option value='M'>Masculino</option>
                            <option value='F'>Feminino</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>Nacionalidade</label>
                        <input class="form-control" type="text"  name="txtNacionalidade"  required />
                    </div>


                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>