
<%@include file="cabecalho.jsp" %>
<%@page import="modelo.Livro"%>
<%@page import="java.util.List"%>
<%@page import="dao.LivroDAO"%>
<%    
    LivroDAO ldao = new LivroDAO();
    List<Livro> lista;
    ////SE É FILTRO POR CATEGORIA
    if (request.getParameter("categoriaid") != null)
    {
        Integer id= Integer.parseInt(request.getParameter("categoriaid"));
        Categoria c = cdao.buscarPorChavePrimaria(id);
        lista = c.getLivroList();
    } 
    else 
    {
        lista = ldao.listar();
    }

    ldao.fecharConexao();

%>

<div class="colorlib-shop">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
                <h2><span>Lançamentos</span></h2>
                <p>Você faz parte de nós, o importante é que lá vivem os textos cegos.</p>
            </div>
        </div>
        <div class="row">
            <% for (Livro item : lista) {%>
            <div class="col-md-3 text-center">
                <div class="product-entry">
                    <div class="product-img">
                        <img src="../arquivos/<%=item.getImagem1()%>" alt="">
                        <p class="tag"><span class="new">NOVO</span></p>
                        <div class="cart">
                            <p>
                                <span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
                                <span><a href="produto.jsp?id=<%=item.getId()%>"><i class="icon-eye"></i></a></span> 
                                <span><a href="#"><i class="icon-heart3"></i></a></span>
                                <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
                            </p>
                        </div>
                    </div>
                    <div class="desc">
                        <h3><a href="shop.html"><%=item.getNome()%></a></h3>
                        <p class="price"><span><%=item.getPreco()%></span></p>

                    </div>
                </div>
            </div>
            <% }%>
<%@include file="rodape.jsp" %>