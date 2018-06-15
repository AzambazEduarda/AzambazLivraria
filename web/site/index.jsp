<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="cabecalho.jsp" %>

<%

    CategoriaDAO dao = new CategoriaDAO();
    List<Categoria> lista;

    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));

    } else {

        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            Categoria obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                dao.excluir(obj);
            }
        }

        lista = dao.listar();
    }
%>
<!--		<aside id="colorlib-hero">
                        <div class="flexslider">
                                <ul class="slides">
                                <li style="background-image: url(images/img_bg_1.jpg);">
                                        <div class="overlay"></div>
                                        <div class="container-fluid">
                                                <div class="row">
                                                        <div class="col-md-6 col-md-offset-3 col-md-pull-2 col-sm-12 col-xs-12 slider-text">
                                                                <div class="slider-text-inner">
                                                                        <div class="desc">
                                                                                <h1 class="head-1">Os melhores</h1>
                                                                                <h2 class="head-2">Topzeras</h2>
                                                                                <p class="category"><span>Livros maneiros da moda</span></p>
                                                                                <p><a href="#" class="btn btn-primary">Coleção da loja</a></p>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </li>
                </aside>
                <div id="colorlib-featured-product">
                        <div class="container">
                                <div class="row">
                                        <div class="col-md-6">
                                                <a href="shop.html" class="f-product-1" style="background-image: url(images/item-1.jpg);">
                                                        <div class="desc">
                                                                <h2>Fahion <br>for <br>men</h2>
                                                        </div>
                                                </a>
                                        </div>-->
<div class="colorlib-shop">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center colorlib-heading">
                <h2><span>Lançamentos</span></h2>
                <p>Você faz parte de nós, o importante é que lá vivem os textos cegos.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 text-center">
                <div class="product-entry">
                    <div class="product-img" style="background-image: url(images/item-5.jpg);">
                        <p class="tag"><span class="new">New</span></p>
                        <div class="cart">
                            <p>
                                <span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
                                <span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
                                <span><a href="#"><i class="icon-heart3"></i></a></span>
                                <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
                            </p>
                        </div>
                    </div>
                    <div class="desc">
                        <h3><a href="shop.html">Floral Dress</a></h3>
                        <p class="price"><span>$300.00</span></p>
                         <%for(Categoria item: lista)
                            {
                         %>
                    </div>
                </div>
            </div>
<%@include file="rodape.jsp" %>