
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    /////////FAZER ISSO NA PROXIMA AULA
    String msg = "";
    String classe = "";
    LivroDAO ldao = new LivroDAO();
    if (request.getMethod().equals("POST")) {
        //pego uma lista de autores(com mesmo name)
        String[] livrosid = request.getParameter("livros").split(";");
        //popular o livro
        Autor a = new Autor();
        a.setNome(request.getParameter("txtNome"));
        a.setFoto(request.getParameter("txtFoto"));
        a.setNacionalidade(request.getParameter("txtNacionalidade"));
        a.setSexo(request.getParameter("txtSexo").charAt(0));

        //Autores
        List<Livro> listalivros = new ArrayList<>();
        for (String id : livrosid) {
            Integer idinteger = Integer.parseInt(id);
            listalivros.add(ldao.buscarPorChavePrimaria(idinteger));
        }
        a.setLivroList(listalivros);

        AutorDAO dao = new AutorDAO();
        dao.incluir(a);

    }
    //pego meus autores

    List<Livro> livros = ldao.listar();
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
            Autores
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">

                <!--div class="col-lg-6">

                    <!--                       <label>Livros</label>
                                        <select name="autores" multiple>
                    <%for (Livro l : livros) {%>
                    <option value="<%=l.getId()%>"><%=l.getNome()%>
                    </option>
                    <%}%>
                </select>
                </div-->

                <div class="form-group">
                    <label>Livros</label>
                    <%for (Livro l : livros) {%>
                    <input type="checkbox" name="autoreschk" value="<%=l.getId()%>"><%=l.getNome()%>

                    <%}%> 
                </div>

                <div class="form-group">
                    <label>Nome</label>
                    <input class="form-control" type="text"  name="txtNome"  required />
                </div>
                <div class="form-group">
                    <label>Foto</label>
                    <input type="file"  name="txtFoto" id="foto"/>
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