
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
    String msg = "";
    String classe = "";
    LivroDAO ldao = new LivroDAO();
    /// pego uma lista de autores (com mesmo nome)
    String [] livrosid = request.getParameter("livros").split(";");
    //popular o livro
    Autor a = new Autor();
     AutorDAO adao = new AutorDAO();
    if (request.getParameter("txtNome") != null && request.getParameter("txtNacionalidade")!= null && request.getParameter("txtSexo")!=null) {
        a.setNome(request.getParameter("txtNome"));
        a.setNacionalidade(request.getParameter("txtNacionalidade"));
        a.setSexo(request.getParameter("txtSexo").charAt(0));
        a.setFoto(request.getParameter("txtFoto"));
       
    //autores 
    List<Livro> listalivros = new ArrayList<>();
    for (String id: livrosid){
        Integer idinteger = Integer.parseInt(id);
        listalivros.add(ldao.buscarPorChavePrimaria(idinteger));
    }
    a.setLivroList(listalivros);
    adao.incluir(a);
    }
    ///pego meus autores
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