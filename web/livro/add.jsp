
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
    
    Livro obj = new Livro();
    LivroDAO dao = new LivroDAO();
    
    CategoriaDAO cdao = new CategoriaDAO();
    List <Categoria> clistar = cdao.listar();
    Categoria c = new Categoria();
    
    EditoraDAO edao= new EditoraDAO();
    List<Editora> elistar = edao.listar();
    Editora e = new Editora();
    
    AutorDAO adao = new AutorDAO();
    List<Autor> alistar = adao.listar();
    
    if(request.getMethod().equals("POST")){
        String[] autoresid = request.getParameter("autores").split(";");
        
        if(request.getParameter("txtNome") !=null && request.getParameter("txtPreco") != null && request.getParameter("txtDataPublicacao")
                != null && request.getParameter("txtSinopse") != null && request.getParameter("txtCategoria") != null &&
                request.getParameter("txtEditora")!= null);
        {
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
            
            List<Autor> listaautores = new ArrayList<>();
            for (String id : autoresid){
                 Integer idinteger = Integer.parseInt(id);
                 listaautores.add(adao.buscarPorChavePrimaria(idinteger));
            }
            obj.setAutorList(listaautores);
            Boolean resultado = dao.incluir(obj);
            if(resultado){
                msg = "Registro cadastrado com sucess";
                classe = "alert-success";
            }
            else{
                msg = "Não foi possivel cadastrar";
                classe = "alert-danger";
            }
            
        }
    }
    dao.fecharConexao();
    

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
                    <%for (Autor item:alistar ) {%>
                    <input type="checkbox" name="autoreschk" value="<%=item.getId()%>"><%=item.getNome()%>

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
                    <%for (Categoria item:clistar) {%>
                  
                    <option value="<%=item.getId()%>">
                        <%=item.getNome()%>
                    </option>

                    <%}%>   
                </select>
                </div>
                <div class="form-group">
                    <select name="txtEditora" required />
                    <label>Editora</label>
                    <%for (Editora item:elistar) {%>
                   
                    <option value="<%=item.getCnpj()%>">
                        <%=item.getNome()%>
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
