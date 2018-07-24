
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@include file="cabecalho.jsp" %>
<%    if (request.getParameter("id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO dao = new LivroDAO();
    Livro obj = dao.buscarPorChavePrimaria(id);
%>

<div class="colorlib-shop">
    <div class="container">
        <div class="row row-pb-lg">
            <div class="col-md-10 col-md-offset-1">
                <div class="product-detail-wrap">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="product-entry">
                                <img src="../arquivos/<%=obj.getImagem1()%>" height="350px"  width="300px" />
                                <div class="thumb-nail">
                                    
                                    <img src="../arquivos/<%=obj.getImagem2()%>" height="150px"  width="150px" />
                                    <img src="../arquivos/<%=obj.getImagem3()%>" height="150px"  width="150px" />
                                </div>
                            </div>
                        </div>
                      
                        <div class="col-md-7">
                            <div class="desc">
                                <h3><%=obj.getNome()%></h3>
                                <p class="price">
                                    <span>R$ <%=obj.getPreco()%></span> 

                                </p>
                                <!-- FAZER O DETALHE DO LIVRO -->
                                <div class="size-wrap">
                                    <p class="size-desc">
                                        Editora:
                                        <span><%=obj.getEditora()%></span>

                                    </p>
                                </div>
                                <div class="size-wrap">
                                    <p class="size-desc">
                                        Categoria:
                                        <span><%=obj.getCategoria()%></span>
                                    </p>
                                </div>
                                <div class="size-wrap">
                                    <p class="size-desc">
                                        Autores: 
                                        <span>
                                            <%for (Autor a : obj.getAutorList()) {

                                            %>
                                            <a href="detalheautor?id=<%=a.getId()%>">
                                                <%=a.getNome()%></a> - 
                                                <%}

                                                %></span>										</p>
                                </div>
                                <div class="row row-pb-sm">
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                                    <i class="icon-minus2"></i>
                                                </button>
                                            </span>
                                            <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                            <span class="input-group-btn">
                                                <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                    <i class="icon-plus2"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>                                        
                                </div>

                                <p><a href="carrinho.jsp?id=<%=obj.getId()%>" class="btn btn-primary btn-addtocart"><i class="icon-shopping-cart"></i>Adicionar ao carrinho</a></p>

                            </div>
                        </div>
                      

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<%@include file="rodape.jsp" %>